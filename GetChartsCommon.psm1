Add-Type -assembly “System.IO.Compression.FileSystem”

function ConvertFrom-Xml {
<#
.SYNOPSIS
    Converts XML object to PSObject representation for further ConvertTo-Json transformation
.EXAMPLE
    # JSON->XML
    $xml = ConvertTo-Xml (get-content 1.json | ConvertFrom-Json) -Depth 4 -NoTypeInformation -as String
.EXAMPLE
    # XML->JSON
    ConvertFrom-Xml ([xml]($xml)).Objects.Object | ConvertTo-Json
#>
    param([System.Xml.XmlElement]$Object)

    if (($Object -ne $null) -and ($Object.HasChildNodes)) {
        $PSObject = New-Object PSObject

        foreach ($Property in $Object.ChildNodes) {
            if ($Property.Property.Name -like 'Property') {
                $PSObject | Add-Member NoteProperty $Property.Name ($Property.Property | % {ConvertFrom-Xml $_})
            } else {
                if ($Property.'#text' -ne $null) {
                    $PSObject | Add-Member NoteProperty $Property.Name $Property.'#text'
                } else {
                    if ($Property.Name -ne $null) {
                        $PSObject | Add-Member NoteProperty $Property.Name (ConvertFrom-Xml $Property)
                    }
                }
            } 
        }   
        $PSObject
    }
    
}

function Download-File {
param (
    [Parameter(Mandatory=$true)][Alias('URL')]
    [string]$Uri,
    [Parameter(Mandatory=$true)][Alias('FilePath')]
    [string]$OutFile
)
    Write-Host "Downloading file: $OutFile"
    Invoke-WebRequest -Uri $Uri -OutFile $OutFile
}

function Download-Manifest(
    [Parameter(Mandatory=$true)]
    [string]$URL,
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)
{
# Only download if not current
    $fileExists = Test-Path -Path $FilePath

    if($fileExists) {
        $fileDate = (Get-ChildItem $FilePath).LastWriteTime
        $now = get-date
        if($fileDate.ToShortDateString() -ne $now.ToShortDateString()){$fileExists = $false}
    } 

    if (!$fileExists){Download-File -URL $URL -FilePath $FilePath}
    }

function Get-ChangedCharts(
    [Parameter(Mandatory=$true)]
    [string]$ZipFilepath,
    [Parameter(Mandatory=$true)]
    [string]$Product
    )
{
    $chartsToUpdate = Execute-DynamicSelect -TableName ChartsToUpdate -Parameters @{Product=$Product}
#    $chartsToUpdate = Select-AllColumns -TableName 'ChartsToUpdate' -WhereClause "Product = '$Product'"

    foreach ($chartToUpdate in $chartsToUpdate) {
        $zipFileURL = $chartToUpdate.URL

        $zipFileURL = $zipFileURL.Replace('.zip','')
        $zipFileURL = $zipFileURL.Substring($zipFileURL.lastIndexOf('/')+1)
        $zipFileURL = $zipFileURL.Substring($zipFileURL.lastIndexOf('=')+1)
        $filename = "$zipFileURL.zip"
        $zipPath = [io.path]::combine($ZipFilepath, $filename)
        if (!(Test-Path -Path $zipPath)) {
            Write-Host "Retrieving: $($chartToUpdate.chartName) / $($chartToUpdate.Title)"
            Download-File -URL $zipFileURL -FilePath $zipPath
            $file = Get-ChildItem -Path $zipPath
            $file.CreationTime = $chartToUpdate.CreationTime
            $file.LastAccessTime = $chartToUpdate.LastAccessTime
            $file.LastWriteTime = $chartToUpdate.LastWriteTime
        }
    }
}

function Get-ChartManifests {
param (
    [Parameter(Mandatory=$true)]
    [string]$ChartSources,
    [Parameter(Mandatory=$true)]
    [string]$FilePath
    )
    [xml]$xmlDoc = Get-Content -Path $ChartSources
    $manifests = Select-Xml -Xml $xmlDoc -XPath "//catalog" | foreach {$_.node}

    $manifests | ForEach-Object {
        $fileName = (Split-Path $_.Location -Leaf)
        Download-Manifest -URL $_.Location -FilePath (Join-Path $FilePath $fileName)
    }

    $obj = $manifests | Select name, type,location, dir
    Invoke-PSObject -Object $obj -DestinationTable 'Manifests'

}

function Get-CoastalPilots(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
    )
{
    $cpManifest = Execute-DynamicSelect -TableName Manifests -Parameters  @{Type='CP'}
    $baseURL = $cpManifest.location

    for ($region=1; $region -le 9; $region++) {
        $details = "$scriptName-$region of 9"
        $host.ui.RawUI.WindowTitle = $details

        $site = Invoke-WebRequest -Uri "$baseURL/download.php?book=$region"
        $link = $null
        $link = $site.Links.href | Where-Object{$_ -match '^.*(CP[0-9]-[0-9]{4}.*\.PDF)$'} | Sort -Descending | Select-Object -First 1
        if($site.StatusCode -eq 200 -and $link) {
            $s = $link -match '^.*(?<ReleaseDate>[0-9]{4}-[0-9]{2}-[0-9]{2})-(?<Edition>[0-9]{1,3}).*$'
            $releaseDate = $Matches['ReleaseDate']
            $edition = $Matches['Edition']
            $result = Execute-DynamicSelect -TableName 'CoastPilots'-Parameters @{region=$region}
            if($result) {
                if([datetime]$releaseDate -gt [datetime]$result.ReleaseDate) {
                    $cp = New-Object PSObject -Property @{            
                        Region      = $region                 
                        Description = $null
                        DownloadURL = "$Global:NOAAURL$link"           
                        Edition     = $edition            
                        Name        = "Coast Pilot Volume $region"
                        ReleaseDate = $releaseDate
                        DownloadStatus = 'Changed'
                    }                         
                    Invoke-PSObject -Object $cp -DestinationTable 'CoastPilots' -OnConflict REPLACE | Out-Null
                }

            } else {
                $cp = New-Object PSObject -Property @{            
                    Region      = $region                 
                    Description = $null
                    DownloadURL = "$Global:NOAAURL$link"           
                    Edition     = $edition            
                    Name        = "Coast Pilot Volume $region"
                    ReleaseDate = $releaseDate
                    DownloadStatus = 'New'
                }                           
                Invoke-PSObject -Object $cp -DestinationTable 'CoastPilots' | Out-Null
            }
        } else {}

    }

    $query = "SELECT * FROM CoastPilots WHERE DownloadStatus IN ('New','Changed')"
    $results = Invoke-SqlQuery -Query $query
    $results | ForEach-Object {
            $url = $_.DownloadURL
            $filename = Split-Path -Path $url -Leaf
            $pdfPath = Join-Path $FilePath $filename
            Download-File -URL $url -FilePath $pdfPath
            [System.IO.FileInfo]$pdfFile = [System.IO.FileInfo]$pdfPath
            $pdfFile.CreationTime = $_.ReleaseDate
            $pdfFile.LastAccessTime = $_.ReleaseDate
            $pdfFile.LastWriteTime = $_.ReleaseDate

            $cp = New-Object PSObject -Property @{            
                Region      = $_.Region
                Description = $_.Description
                DownloadURL = $_.DownloadURL
                Edition     = $_.Edition
                Name        = $_.Name
                ReleaseDate = $_.ReleaseDate
                DownloadStatus = 'Current'
            }                         
            Invoke-PSObject -Object $cp -DestinationTable 'CoastPilots' -OnConflict REPLACE | Out-Null

    }
}

function Get-NavRules(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
    )
{
    $manifests = Execute-DynamicSelect -TableName Manifests -Parameters  @{Type='NAV'}
#    $manifests = Invoke-SqlQuery `
#                    -Query "SELECT * FROM Manifests WHERE type = @Type" -Parameters @{Type='NAV'}

    $manifests | ForEach-Object {
        $fileName = [System.IO.Path]::GetFileName($_.location)
        Download-File -URL $_.location -FilePath (Join-Path $FilePath $fileName)
    }
}

function Get-TopoMaps(
    )
{
    $zipPath = Join-Path  $Global:zipFilepath "TopoMaps"
    New-Item -ItemType Directory -Force -Path $zipPath | Out-Null

    $savedZips = Join-Path  $Global:savedZipsFilepath "TopoMaps"
    New-Item -ItemType Directory -Force -Path $savedZips | Out-Null

$sqlText = @"
SELECT GDAItemID,
       MapName,
       DownloadGeoPDF,
       CreateDate
  FROM ToposToUpdate
 WHERE DownloadDate IS NULL;
"@

    $topoMaps = Invoke-SqlQuery -Query $sqlText
    foreach ($topoMap in $topoMaps)
    {
        $zipFile = Join-Path $zipPath $topoMap.MapName
        $zipFile = "$zipFile.zip"
        if(!(Test-Path -Path $zipFile))
        {
            $url = $topoMap.DownloadGeoPDF
            Download-File -URL $url -FilePath $zipFile

        }
        $zipFile = Get-ChildItem -Path $zipFile
        $zipFile.CreationTime = $topoMap.CreateDate
        $zipFile.LastAccessTime = $topoMap.CreateDate
        $zipFile.LastWriteTime = $topoMap.CreateDate
        Extract-Files -SourceZip  $zipFile -Destination $Global:topoFilepath
        Move-Item -Path $zipFile.FullName -Destination $savedZips -Force #-ErrorAction Ignore

        Update-AllTopoMaps -GDAItemID $topoMap.GDAItemID
    }
}

function Process-ChartManifest
(
    [Parameter(Mandatory=$true)]
    [hashtable]$QueryParameters,
    [Parameter(Mandatory=$true)]
    [string]$ChartsPath,
    [Parameter(Mandatory=$true)]
    [string]$ZipFilepath
)
{
    $manifest = Execute-DynamicSelect -TableName Manifests -Parameters $QueryParameters

    $productType = $manifest.type

    $filePath = ($manifest.dir).Replace('{USERDATA}',$ChartsPath)
    New-Directory -Path $filePath | Out-Null
    $fileName = [System.IO.Path]::GetFileName($manifest.location)
    $manifestPath = Join-Path $filePath $fileName

    Download-Manifest -URL $manifest.location -FilePath $manifestPath

    [xml]$xmlDoc = Get-Content -Path $manifestPath
    $catalogName = $xmldoc.FirstChild.NextSibling.Name
    $productCatalog = $xmlDoc.$catalogName
    . "$appDirectory\Get$productType`Charts.ps1"   

    $zipPath = ($manifest.dir).Replace('{USERDATA}',$ZipFilepath)
    New-Directory -Path $zipPath | Out-Null
    Get-ChangedCharts -ZipFilePath $zipPath -Product $productType

    $chartPath = ($manifest.dir).Replace('{USERDATA}',$ChartsPath)
    Unzip-ChartFiles -ZipPath $zipPath -ChartFilePath $chartPath -Product $productType
}

function Unzip-ChartFiles
(
    [Parameter(Mandatory=$true)]
    [string]$zipPath,
    [Parameter(Mandatory=$true)]
    [string]$ChartFilePath,
    [Parameter(Mandatory=$true)]
    [string]$Product
)
{
    $chartsToUpdate = (Execute-DynamicSelect -TableName ChartsToUpdate -Parameters @{Product = $Product}) |
                        Select -ExpandProperty  ChartName 

    $zipFiles = Get-ChildItem -Path $zipPath -filter *.zip -recurse | Where-Object {$_.BaseName -in $chartsToUpdate}

    foreach ($zipFile in $zipFiles) {
        Write-Host "Unzipping: $($zipFile.FullName)"

        $path = Join-Path $ChartFilePath $($zipFile.Basename)
        New-Directory -Path $path | Out-Null

        $zipArchive = [System.IO.Compression.ZipFile]::OpenRead($zipFile.FullName)
        foreach ($zipArchiveEntry in $zipArchive.Entries) {
            $archiveName = $zipArchiveEntry.Name
            if($archiveName)
            {
                $chartFile = Join-Path $path $archiveName
                Write-Host "     Unzip file: $archiveName to $path"

                [System.IO.Compression.ZipFileExtensions]::ExtractToFile($zipArchiveEntry, $chartFile, $true)

                $chartFile = Get-ChildItem -Path $chartFile
                $chartFile.CreationTime = $zipFile.CreationTime
                $chartFile.LastAccessTime = $zipFile.LastAccessTime
                $chartFile.LastWriteTime = $zipFile.LastWriteTime
            }
        }

        Set-ItemProperty -Path $path -Name CreationTime -Value $($zipFile.CreationTime)
        Set-ItemProperty -Path $path -Name LastAccessTime -Value $($zipFile.LastAccessTime)
        Set-ItemProperty -Path $path -Name LastWriteTime -Value $($zipFile.LastWriteTime)

        $zipArchive.Dispose()
    }
}

function Unzip-CoastalPilot(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Source,
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Destination
)
{
    Write-Host "Unzipping: FilePath"
    Extract-File -SourceZip $Source -Destination $Destination
}

#  Obsolete
function Extract-Files
(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    $SourceZip,
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Destination
)
{
    Write-Host "Unzipping: $SourceZip"
    $zipArchive = [System.IO.Compression.ZipFile]::OpenRead($SourceZip)
#        $zipArchiveEntry = $zipArchive.Entries[0]
    foreach ($zipArchiveEntry in $zipArchive.Entries)
    {
        $archiveName = $zipArchiveEntry.Name
        if($archiveName)
        {
            $zipFile = Join-Path $Destination $archiveName
            Write-Host "     Unzip file: $archiveName to $Destination"
            [System.IO.Compression.ZipFileExtensions]::ExtractToFile($zipArchiveEntry, $zipFile, $true)

            $zipFile = Get-ChildItem -Path $zipFile
            $zipFile.CreationTime = $SourceZip.CreationTime
            $zipFile.LastAccessTime = $SourceZip.LastAccessTime
            $zipFile.LastWriteTime = $SourceZip.LastWriteTime
        }
    }

    $zipArchive.Dispose()
}

function Process-ChartManifests {
    $subset = @('ENCProdCat.xml','RNCProdCat.xml')
    $subset = @('RNCProdCat.xml')
    $manifests = Get-ChildItem -Path $manifestPath | Where {$_.Name -in $subset}
    $manifests | ForEach-Object {
        $fileName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        [xml]$xmlDoc = Get-Content -Path $_.FullName

        $catalogName = $xmldoc.FirstChild.NextSibling.LocalName
        New-Directory -Path $(Join-Path $zipFilepath $catalogName)

        $productCatalog = $xmlDoc.$catalogName

        . "$appDirectory\Get$catalogName.ps1"   
    }

}

