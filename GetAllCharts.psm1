Add-Type -assembly “System.IO.Compression.FileSystem”

function Convert-XMLNodeToPsCustomObject ($nodes){
    $nodeList = @()
    if(!$nodes){return $nodeList}
    if($nodes.GetType().FullName -eq 'System.DBNull'){return $nodeList}

    $nodeNames = ($nodes.childnodes | Where-Object {$_ -ne $null}).LocalName | Select -Unique

    $nodes | ForEach-Object {
        $node = $_
        $nodeObj = New-Object -TypeName PsObject; 
        $nodeNames | ForEach-Object {
            $nodeName = $_
            $nodeValue = $node.$nodeName
            try {
                [type]$T = $nodeValue.GetType()
            } catch { }
            if($T.FullName -ne 'System.Xml.XmlElement' -and $T.FullName -ne 'System.Object[]' ) {
                if($nodeValue -eq $null) {$nodeValue = [DBNull]::Value}
                Add-Member -InputObject $nodeObj -MemberType NoteProperty -Name $nodeName -Value $nodeValue 
            }
        }
        $nodeList += $nodeObj
    }
    Return $nodeList
}

function Download-File {
    param ([Parameter(Mandatory=$true)]
           [Alias ('URL')]
           [string]$URI,
           [Parameter(Mandatory=$true)]
           [Alias ('FilePath')]
           [string]$outputFile,
           [int]$OlderThan=7
    )
    [boolean]$fileExists = Test-Path $outputFile

    if($fileExists) {
        $today = (Get-Date)
        $fileDate = (Get-ChildItem $outputFile).LastWriteTime
        $diff = $today-$fileDate
        if($diff.Day -gt $OlderThan){$fileExists = $false}
    }

    if(!$fileExists) {
        $retval = Invoke-WebRequest -Uri $URI -OutFile $outputFile
    }
}

function Get-ChangedCharts {
param ([Parameter(Mandatory=$true)]
       [string]$ZipFilepath,
       [Parameter(Mandatory=$true)]
       [string]$ChartFilepath
)

    $chartsToUpdate = Execute-DynamicSelect -TableName ChartsToUpdate
#    $chartsToUpdate = $chartsToUpdate[0..2]
    $totalCount = if($chartsToUpdate.Count){$chartsToUpdate.Count}else{1}
    foreach ($chartToUpdate in $chartsToUpdate) {
        try {
            $zipNum ++

            $chartDirectory = $chartToUpdate.Directory
            $chartName = $chartToUpdate.chartName
            $chartTitle = $chartToUpdate.Title
            $zipFileURL = $chartToUpdate.URL

            $zipPath = $chartDirectory.Replace('{USERDATA}', $ZipFilepath)
            New-Directory -Path $zipPath

            [string]$zipFile = [regex]::match($zipFileURL,'[^\/ | ^=]*$').Groups[0].Value
            $zipFile = if($zipFile.EndsWith('.zip')){$zipFile}else{"$zipFile.zip"}
            $zipFile = Join-Path $zipPath $zipFile

            [int]$pct = ($zipNum/$totalCount)*100
            Write-Progress -Activity "Retrieving: $chartName / $chartTitle" `
                           -PercentComplete $pct `
                           -CurrentOperation "$pct% complete" `
                           -Status "File $zipNum of $totalCount"

            Download-File -URI $chartToUpdate.URL -outputFile $zipFile -OlderThan 180
            $file = Get-ChildItem -Path $zipFile
            $file.CreationTime = $chartToUpdate.CreationTime
            $file.LastAccessTime = $chartToUpdate.LastAccessTime
            $file.LastWriteTime = $chartToUpdate.LastWriteTime

            $chartPath = $chartDirectory.Replace('{USERDATA}', $ChartFilepath)
            New-Directory -Path $chartPath
            Unzip-ChartFile -zipFile $zipFile -ChartFilePath $chartPath

$sqlText = @"
UPDATE $($chartToUpdate.Tablename)
    SET DateRetrieved = CURRENT_TIMESTAMP,
        DownloadStatus = 'Current'
    WHERE ChartName = @ChartName;
"@
            $retval = Invoke-SqlUpdate -Query $sqlText -Parameters @{ChartName = $chartName}
        } catch {Throw}
    }
}

function Get-CoastPilots {
    param(
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $cpManifest = Execute-DynamicSelect -TableName Documents -Parameters  @{Source='NOAA';DocumentType='CoastPilot'}
    $URL = $cpManifest.URL

    $FilePath = (($cpManifest.Path).Replace('{USERDATA}', $FilePath))
    New-Directory -Path $FilePath

    for ($region=1; $region -le 9; $region++) {
        $site = Invoke-WebRequest -Uri "$URL/download.php?book=$region"
        $link = $null

        $link = $site.Links.href | Where-Object{$_ -match '(?i)^.*(CPB[0-9]_E[0-9]{2}_[0-9]{8}_[0-9]{4}.*\.pdf)$'} # This is the main document
#        $link = $site.Links.href | Where-Object{$_ -match '(?i)^.*(CPB[0-9].*\.pdf)$'} # | Sort -Descending | Select-Object -First 1
#        $link = $site.Links.href | Where-Object{$_ -match '(?i)^.*(CP[0-9]-[0-9]{4}.*\.PDF)$'} | Sort -Descending | Select-Object -First 1
        if($site.StatusCode -eq 200 -and $link) {
            $s = $link -match '^.*_E(?<Edition>[0-9]{1,2})_(?<ReleaseDate>[0-9]{8}_[0-9]{4}).*$'
#            $s = $link -match '^.*(?<ReleaseDate>[0-9]{4}-[0-9]{2}-[0-9]{2})-(?<Edition>[0-9]{1,3}).*$'
            $releaseDate = $Matches['ReleaseDate'].Insert(4, '-').insert(7,'-').insert(13, ':').Replace('_',' ')
            $edition = $Matches['Edition']
            $result = Execute-DynamicSelect -TableName 'CoastPilots'-Parameters @{region=$region}
            if($result) {
                if([datetime]$releaseDate -gt [datetime]$result.ReleaseDate) {
                    $cp = New-Object PSObject -Property @{            
                        Region        = $region
                        DateRetrieved = [System.DBNull]::Value
                        Description   = $null
                        DownloadStatus = 'Changed'
                        DownloadURL   = "$URL/$link"           
                        Edition       = $edition            
                        Name          = "Coast Pilot Volume $region"
                        ReleaseDate   = $releaseDate
                    }                         
                }

            } else {
                $cp = New-Object PSObject -Property @{            
                    Region      = $region                 
                    DateRetrieved = [System.DBNull]::Value
                    Description = $null
                    DownloadStatus = 'New'
                    DownloadURL = "$URL/$link"           
                    Edition     = $edition            
                    Name        = "Coast Pilot Volume $region"
                    ReleaseDate = $releaseDate
                }                           
            }
            $retval = Invoke-PSObject -Object $cp -DestinationTable 'CoastPilots'
        } else {}

    }

    $i=0
    $query = "SELECT * FROM CoastPilots WHERE DownloadStatus IN ('New','Changed')"
    $results = Invoke-SqlQuery -Query $query
    $totalCount = $results.Count
    $results | ForEach-Object {
        $region = $_.region
        $i++
        [int]$pct = ($i/$totalCount)*100
        Write-Progress -Activity "Retrieving: Coast Pilot Volume $region)" `
                        -PercentComplete $pct `
                        -CurrentOperation "$pct% complete" `
                        -Status "File $i of $totalCount"

        $url = $_.DownloadURL
        $filename = Split-Path -Path $url -Leaf
        $pdfPath = Join-Path $FilePath $filename
        Download-File -URL $url -FilePath $pdfPath
        [System.IO.FileInfo]$pdfFile = [System.IO.FileInfo]$pdfPath
        $pdfFile.CreationTime = $_.ReleaseDate
        $pdfFile.LastAccessTime = $_.ReleaseDate
        $pdfFile.LastWriteTime = $_.ReleaseDate

$sqlText = @"
UPDATE 'CoastPilots'
    SET DateRetrieved = CURRENT_TIMESTAMP,
        DownloadStatus = 'Current'
    WHERE Region = @Region;
"@
        $retval = Invoke-SqlUpdate -Query $sqlText -Parameters @{Region = $region}
    }
}

function Get-LightLists {
    param(
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $cpManifest = Execute-DynamicSelect -TableName Documents -Parameters  @{Source='USCG';DocumentType='LightLists'}
    [System.Uri]$uri = [System.Uri]$cpManifest.URL

    $FilePath = (($cpManifest.Path).Replace('{USERDATA}', $FilePath))
    New-Directory -Path $FilePath

    $site = Invoke-WebRequest -Uri $uri.OriginalString
    $Global:site = $site
    $links = $null
    $links = $site.Links.href | Where-Object{$_ -match '(?i)^.*LightList%20V[0-9].*\.pdf$'} | Select -Unique
    $links | ForEach-Object {
        $url = "{0}://{1}{2}" -f $uri.scheme,$uri.Host,($_ -replace '^.')
        $Global:url=$url
        $filename = Split-Path -Path $url -Leaf
        $pdfPath = Join-Path $FilePath $filename
        Download-File -URI $url -OutputFile $pdfPath -OlderThan 14
    }

Return
    for ($region=1; $region -le 9; $region++) {
        $site = Invoke-WebRequest -Uri "$URL/download.php?book=$region"
        $link = $null

        $link = $site.Links.href | Where-Object{$_ -match '(?i)^.*(CPB[0-9]_E[0-9]{2}_[0-9]{8}_[0-9]{4}.*\.pdf)$'} # This is the main document
#        $link = $site.Links.href | Where-Object{$_ -match '(?i)^.*(CPB[0-9].*\.pdf)$'} # | Sort -Descending | Select-Object -First 1
#        $link = $site.Links.href | Where-Object{$_ -match '(?i)^.*(CP[0-9]-[0-9]{4}.*\.PDF)$'} | Sort -Descending | Select-Object -First 1
        if($site.StatusCode -eq 200 -and $link) {
            $s = $link -match '^.*_E(?<Edition>[0-9]{1,2})_(?<ReleaseDate>[0-9]{8}_[0-9]{4}).*$'
#            $s = $link -match '^.*(?<ReleaseDate>[0-9]{4}-[0-9]{2}-[0-9]{2})-(?<Edition>[0-9]{1,3}).*$'
            $releaseDate = $Matches['ReleaseDate'].Insert(4, '-').insert(7,'-').insert(13, ':').Replace('_',' ')
            $edition = $Matches['Edition']
            $result = Execute-DynamicSelect -TableName 'CoastPilots'-Parameters @{region=$region}
            if($result) {
                if([datetime]$releaseDate -gt [datetime]$result.ReleaseDate) {
                    $cp = New-Object PSObject -Property @{            
                        Region        = $region
                        DateRetrieved = [System.DBNull]::Value
                        Description   = $null
                        DownloadStatus = 'Changed'
                        DownloadURL   = "$URL/$link"           
                        Edition       = $edition            
                        Name          = "Coast Pilot Volume $region"
                        ReleaseDate   = $releaseDate
                    }                         
                }

            } else {
                $cp = New-Object PSObject -Property @{            
                    Region      = $region                 
                    DateRetrieved = [System.DBNull]::Value
                    Description = $null
                    DownloadStatus = 'New'
                    DownloadURL = "$URL/$link"           
                    Edition     = $edition            
                    Name        = "Coast Pilot Volume $region"
                    ReleaseDate = $releaseDate
                }                           
            }
            $retval = Invoke-PSObject -Object $cp -DestinationTable 'CoastPilots'
        } else {}

    }

    $i=0
    $query = "SELECT * FROM CoastPilots WHERE DownloadStatus IN ('New','Changed')"
    $results = Invoke-SqlQuery -Query $query
    $totalCount = $results.Count
    $results | ForEach-Object {
        $region = $_.region
        $i++
        [int]$pct = ($i/$totalCount)*100
        Write-Progress -Activity "Retrieving: Coast Pilot Volume $region)" `
                        -PercentComplete $pct `
                        -CurrentOperation "$pct% complete" `
                        -Status "File $i of $totalCount"

        $url = $_.DownloadURL
        $filename = Split-Path -Path $url -Leaf
        $pdfPath = Join-Path $FilePath $filename
        Download-File -URL $url -FilePath $pdfPath
        [System.IO.FileInfo]$pdfFile = [System.IO.FileInfo]$pdfPath
        $pdfFile.CreationTime = $_.ReleaseDate
        $pdfFile.LastAccessTime = $_.ReleaseDate
        $pdfFile.LastWriteTime = $_.ReleaseDate

$sqlText = @"
UPDATE 'CoastPilots'
    SET DateRetrieved = CURRENT_TIMESTAMP,
        DownloadStatus = 'Current'
    WHERE Region = @Region;
"@
        $retval = Invoke-SqlUpdate -Query $sqlText -Parameters @{Region = $region}
    }
}

function Get-NOAARncCharts {
param([string]$ManifestPath,
      [string]$ChartSourceName='All'
     )

    $chartSource = Invoke-ExecuteDynamicSelect -TableName 'ChartSources' -Parameters @{name=$ChartSourceName; type='RNC'} | Select -First 1
    if(!$chartSource){Throw "Chart source RNC $ChartSourceName not found or ChartSources not loaded."}
    $chartDirectory = $chartSource.dir

    $manifestFile = Join-Path $ManifestPath (Split-Path $ChartSource.location -Leaf)
    Download-File -URI $ChartSource.location -OutputFile $manifestFile -OlderThan 1 #Invoke-WebRequest -Uri $ChartSource.location -OutFile $manifestFile

    [xml]$xmlDoc = Get-Content -Path $manifestFile
    $header = Select-Xml -Xml $xmlDoc -XPath "//Header" | Select-Object –ExpandProperty 'node'

    $title = $header.title
    $currentSource = Invoke-ExecuteDynamicSelect -TableName 'ProductCatalogs' -Parameters @{title=$title}
    if($currentSource){[datetime]$currentSourcedate=$currentSource.date_created}
    else {[datetime]$currentSourcedate = '2000-01-01'}

    if([datetime]$header.date_created -ne $currentSourcedate) {  # -ne
        $headerObj = Convert-XMLNodeToPsCustomObject -node $header
        $retval = Insert-PSObject -Object $headerObj -DestinationTable 'ProductCatalogs'

        $currentCharts = Invoke-ExecuteDynamicSelect -TableName 'RNCCharts' -Columns @('number','ntm_date')    # Only pull charts in ProductCatalog
        $chartDates=@{}
        $currentCharts | ForEach-Object {$chartDates.Add($_.number, $_.ntm_date)}

        $charts = Select-Xml -Xml $xmlDoc -XPath "//chart" | Select-Object –ExpandProperty 'node'
        $charts | ForEach-Object {
            $newNode = $xmlDoc.CreateElement("DownloadStatus")
            if($currentCharts){$newNode.InnerText = ""} else {$newNode.InnerText = "New"}
            $_.AppendChild($newNode) | Out-Null
        }

        $cgList=@()
        $stateList=@()
        $regionList=@()
        $nmList=@()
        $lnmList=@()
        $panelList=@()
        $chartNum = 0
        $prodChartList = @()

        $totalCount = $charts.Count
        $charts | ForEach-Object {
            $chart = $_
            $chartName = $chart.number
            
            $chartNum ++
            [int]$pct = ($chartNum/$totalCount)*100
            Write-Progress -Activity "Parsing $chartName" -PercentComplete $pct -CurrentOperation "$pct% complete" -Status "File $chartNum of $totalCount"

            $currentChartDate = $chartDates.Item($chartName)
            if($currentChartDate){
                if([datetime]$chart.ntm_date -gt [datetime]$currentChartDate){
                    $chart.DownloadStatus = 'Changed'
                } else {$chart.DownloadStatus = 'Current'}
            } else {$chart.DownloadStatus = 'New'}

            if($chart.DownloadStatus -eq 'Changed' -or $chart.DownloadStatus -eq 'New') {
                $prodChart = New-Object PSObject -Property @{            
                    CatalogTitle = $title                 
                    ChartName    = $chartName
                    Directory    = $chartDirectory                 
                }                           
                $prodChartList += $prodChart

                $psObj = Convert-XMLNodeToPsCustomObject -node $chart.coast_guard_districts
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $cgList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $chart.states
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $stateList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $chart.regions
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $regionList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $chart.nm
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $nmList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $chart.lnm
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $lnmList += $psObj

                $panels = $chart.cov.panel
                $panels | ForEach-Object {
                    $panel_no = $_.panel_no
                    $type = $_.type

                    $psObj = Convert-XMLNodeToPsCustomObject -node $_.vertex
                    $psObj | Add-Member -MemberType NoteProperty -Name 'ChartNumber' -Value $chartName
                    $psObj | Add-Member -MemberType NoteProperty -Name 'panel_no' -Value panel_type
                    $psObj | Add-Member -MemberType NoteProperty -Name 'panel_type' -Value $type

                    $panelList += $psObj
                }
            }
        }
        Write-Progress -Completed -Activity "Parsing"

        $retval = Insert-PSObject -Object $prodChartList -DestinationTable 'ProductCharts'

        $chartList = Convert-XMLNodeToPsCustomObject -node $charts
        $retval = Insert-PSObject -Object $chartList -DestinationTable 'RNCCharts'

        $retval = Insert-PSObject -Object $cgList -DestinationTable 'ENCCoastGuardDistricts'
        $retval = Insert-PSObject -Object $nmList -DestinationTable 'ENCNMAgency'
        $retval = Insert-PSObject -Object $stateList -DestinationTable 'ENCStates'
        $retval = Insert-PSObject -Object $regionList -DestinationTable 'ENCRegions'
        $retval = Insert-PSObject -Object $lnmList -DestinationTable 'ENCLNMAgency'
        $retval = Insert-PSObject -Object $panelList -DestinationTable 'RNCCoverage'
    }
}

function Get-NOAAEncCharts {
param([string]$ManifestPath,
      [string]$ChartSourceName='All'
     )

    $chartSource = Invoke-ExecuteDynamicSelect -TableName 'ChartSources' -Parameters @{name=$ChartSourceName; type='ENC'} | Select -First 1
    if(!$chartSource){Throw "Chart source ENC $ChartSourceName not found or ChartSources not loaded."}
    $chartDirectory = $chartSource.dir

    $manifestFile = Join-Path $ManifestPath (Split-Path $ChartSource.location -Leaf)
    Download-File -URI $ChartSource.location -OutputFile $manifestFile -OlderThan 1 #Invoke-WebRequest -Uri $ChartSource.location -OutFile $manifestFile

    [xml]$xmlDoc = Get-Content -Path $manifestFile
    $header = Select-Xml -Xml $xmlDoc -XPath "//Header" | Select-Object –ExpandProperty 'node'

    $title = $header.title
    $currentSource = Invoke-ExecuteDynamicSelect -TableName 'ProductCatalogs' -Parameters @{title=$title}
    if($currentSource){[datetime]$currentSourcedate=$currentSource.date_created}
    else {[datetime]$currentSourcedate = '2000-01-01'}

    if([datetime]$header.date_created -ne $currentSourcedate) {  # -ne
        $headerObj = Convert-XMLNodeToPsCustomObject -node $header
        $retval = Insert-PSObject -Object $headerObj -DestinationTable 'ProductCatalogs'

        $currentCharts = Invoke-ExecuteDynamicSelect -TableName 'ENCCharts' -Columns @('name','isdt')    # Only pull charts in ProductCatalog
        $chartDates=@{}
        $currentCharts | ForEach-Object {$chartDates.Add($_.name, $_.isdt)}

        $cgList=@()
        $stateList=@()
        $regionList=@()
        $nmList=@()
        $lnmList=@()
        $panelList=@()
        $chartNum = 0
        $prodChartList = @()

        $cells = Select-Xml -Xml $xmlDoc -XPath "//cell" | Select-Object –ExpandProperty 'node'
        $totalCount = $cells.Count
        $cells | ForEach-Object {
            $cell = $_
            $chartName = $cell.name
            
            $chartNum ++
            [int]$pct = ($chartNum/$totalCount)*100
            Write-Progress -Activity "Parsing $chartName" `
                -PercentComplete $pct `
                -CurrentOperation "$pct% complete" `
                -Status "File $chartNum of $totalCount"

            $newNode = $xmlDoc.CreateElement("DownloadStatus")
            $newNode.InnerText = ""
            $cell.AppendChild($newNode) | Out-Null

            $currentChartDate = $chartDates.Item($chartName)
            if($currentChartDate){
                if([datetime]$_.isdt -gt [datetime]$currentChartDate){
                    $cell.DownloadStatus = 'Changed'
                } else {$_.DownloadStatus = 'Current'}
            } else {$cell.DownloadStatus = 'New'}

            if($_.DownloadStatus -eq 'Changed' -or $_.DownloadStatus -eq 'New') {
                $prodChart = New-Object PSObject -Property @{            
                    CatalogTitle = $title                 
                    ChartName    = $chartName              
                    Directory    = $chartDirectory                 
                }                           
                $prodChartList += $prodChart

                $psObj = Convert-XMLNodeToPsCustomObject -node $_.coast_guard_districts
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $cgList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $_.states
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $stateList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $_.regions
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $regionList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $_.nm
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $nmList += $psObj

                $psObj = Convert-XMLNodeToPsCustomObject -node $_.lnm
                $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                $lnmList += $psObj

                $panels = $_.cov.panel
                $panels | ForEach-Object {
                    $panel_no = $_.panel_no
                    $type = $_.type

                    $psObj = Convert-XMLNodeToPsCustomObject -node $_.vertex
                    $psObj | Add-Member -MemberType NoteProperty -Name 'ChartName' -Value $chartName
                    $psObj | Add-Member -MemberType NoteProperty -Name 'panel_no' -Value $panel_no
                    $psObj | Add-Member -MemberType NoteProperty -Name 'type' -Value $type

                    $panelList += $psObj
                }
            }
        }
        Write-Progress -Completed -Activity "Parsing"

        $retval = Insert-PSObject -Object $prodChartList -DestinationTable 'ProductCharts'

        $chartList = Convert-XMLNodeToPsCustomObject -node $cells
        $retval = Insert-PSObject -Object $chartList -DestinationTable 'ENCCharts'

        $retval = Insert-PSObject -Object $cgList -DestinationTable 'ENCCoastGuardDistricts'
        $retval = Insert-PSObject -Object $nmList -DestinationTable 'ENCNMAgency'
        $retval = Insert-PSObject -Object $stateList -DestinationTable 'ENCStates'
        $retval = Insert-PSObject -Object $regionList -DestinationTable 'ENCRegions'
        $retval = Insert-PSObject -Object $lnmList -DestinationTable 'ENCLNMAgency'
        $retval = Insert-PSObject -Object $panelList -DestinationTable 'ENCCoverage'
    }
}

function Get-USACEEncCharts {
param([string]$ManifestPath,
      [string]$ChartSourceName
     )

    $chartSource = Invoke-ExecuteDynamicSelect -TableName 'ChartSources' -Parameters @{name=$ChartSourceName} | Select -First 1
    if(!$chartSource){Throw "Chart source USACE $ChartSourceName not found or ChartSources not loaded."}
    $chartDirectory = $chartSource.dir

    $manifestFile = Join-Path $ManifestPath (Split-Path $ChartSource.location -Leaf)
    Download-File -URI $ChartSource.location -OutputFile $manifestFile -OlderThan 1

    [xml]$xmlDoc = Get-Content -Path $manifestFile
    $header = Select-Xml -Xml $xmlDoc -XPath "//Header" | Select-Object –ExpandProperty 'node'

    $title = $header.title
    $currentSource = Invoke-ExecuteDynamicSelect -TableName 'ProductCatalogs' -Parameters @{title=$title}
    if($currentSource){[datetime]$currentSourcedate=$currentSource.date_created}
    else {[datetime]$currentSourcedate = '2000-01-01'}

    if([datetime]$header.date_created -ne $currentSourcedate) {  # -ne
        $headerObj = Convert-XMLNodeToPsCustomObject -node $header
        $headerObj.date_created = "{0:yyyy-MM-dd}" -f [datetime]$headerObj.date_created
        $retval = Insert-PSObject -Object $headerObj -DestinationTable 'ProductCatalogs'

        $currentCharts = Invoke-ExecuteDynamicSelect -TableName 'USACECharts' -Columns @('name','ENCdate_posted')    # Only pull charts in ProductCatalog
        $chartDates=@{}
        $currentCharts | ForEach-Object {$chartDates.Add($_.name, $_.ENCdate_posted)}

        $prodChartList = @()

        $cells = Select-Xml -Xml $xmlDoc -XPath "//Cell" | Select-Object –ExpandProperty 'node'
        $totalCount = if($cells.Count){$cells.Count}else{1}
        $cells | ForEach-Object {
            $chartName = $_.name
            
            $chartNum ++
            [int]$pct = ($chartNum/$totalCount)*100
            Write-Progress -Activity "Parsing $chartName" -PercentComplete $pct -CurrentOperation "$pct% complete" -Status "File $chartNum of $totalCount"

            $newNode = $xmlDoc.CreateElement("DownloadStatus")
            if($currentCharts){$newNode.InnerText = ""} else {$newNode.InnerText = "New"}
            $_.AppendChild($newNode) | Out-Null
            $currentChartDate = $chartDates.Item($chartName)
            if($currentChartDate){
                if($_.ENCdate_Posted -gt [datetime]$currentChartDate){
                    $_.DownloadStatus = 'Changed'
                } else {$_.DownloadStatus = 'Current'}
            } else {$_.DownloadStatus = 'New'}
       
            if($_.DownloadStatus -eq 'Changed' -or $_.DownloadStatus -eq 'New') {
                $prodChart = New-Object PSObject -Property @{            
                    CatalogTitle = $title                 
                    ChartName    = $chartName              
                    Directory    = $chartDirectory                 
                }                           
                $prodChartList += $prodChart

                $newNode = $xmlDoc.CreateElement("ENCdate_posted")
                $newNode.InnerText ="{0:yyyy-MM-dd}" -f [datetime] $_.s57_file.date_posted
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("ENCtime_posted")
                $newNode.InnerText = $_.s57_file.time_posted
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("ENCfile_size")
                $newNode.InnerText = $_.s57_file.file_size
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("ENCLocation")
                $newNode.InnerText = $_.s57_file.location
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("LocationFrom")
                $newNode.InnerText = $_.location.from
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("LocationTo")
                $newNode.InnerText = $_.location.to
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("MileageMarkerBegin")
                $newNode.InnerText = $_.river_miles.begin
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("MileageMarkerEnd")
                $newNode.InnerText = $_.river_miles.end
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("SHPdate_posted")
                $newNode.InnerText = if($_.shp_file.date_posted) {
                                        "{0:yyyy-MM-dd}" -f [datetime] $_.shp_file.date_posted
                                     } else {[system.DBNull]::Value}
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("SHPtime_posted")
                $newNode.InnerText = $_.shp_file.time_posted
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("SHPfile_size")
                $newNode.InnerText = $_.shp_file.file_size
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("SHPLocation")
                $newNode.InnerText = $_.shp_file.location
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("KMLdate_posted")
                $newNode.InnerText = if($_.kml_file.date_posted) {
                                        "{0:yyyy-MM-dd}" -f [datetime] $_.kml_file.date_posted
                                     } else {[system.DBNull]::Value}
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("KMLtime_posted")
                $newNode.InnerText = $_.kml_file.time_posted
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("KMLfile_size")
                $newNode.InnerText = $_.kml_file.file_size
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("KMLLocation")
                $newNode.InnerText = $_.kml_file.location
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("AreaNorth")
                $newNode.InnerText = $_.area.north
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("AreaSouth")
                $newNode.InnerText = $_.area.south
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("AreaEast")
                $newNode.InnerText = $_.area.east
                $_.AppendChild($newNode) | Out-Null

                $newNode = $xmlDoc.CreateElement("AreaWest")
                $newNode.InnerText = $_.area.west
                $_.AppendChild($newNode) | Out-Null

            }
        }
        Write-Progress -Completed -Activity "Parsing"

        $retval = Insert-PSObject -Object $prodChartList -DestinationTable 'ProductCharts'

        $chartList = Convert-XMLNodeToPsCustomObject -node $cells
        $retval = Insert-PSObject -Object $chartList -DestinationTable 'USACECharts'
    }
}

function Get-Documents {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Source,
        [Parameter(Mandatory=$true)]
        [string]$DocumentType,
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )
    $i=0

$sqlText = @"
UPDATE 'Documents'
    SET DateRetrieved = CURRENT_TIMESTAMP,
        DownloadStatus = 'Current'
    WHERE URL = @URL;
"@

    $documents = Execute-DynamicSelect -TableName 'DocumentsToUpdate' -Parameters  @{Source=$Source; DocumentType=$DocumentType}
    $totalCount = $documents.Count
    $documents | ForEach-Object {
        [System.Uri]$url= [System.Uri]$_.URL
        $newPath = (($_.Path).Replace('{USERDATA}', $FilePath))
        New-Directory -Path $newPath
        $filename = if($_.Filename){$_.Filename} else {Split-Path -Path $url -Leaf}
        [System.IO.FileInfo]$pdfFile = [System.IO.FileInfo](Join-Path $newPath $filename)
        $i++
        [int]$pct = ($i/$totalCount)*100
        Write-Progress -Activity "Retrieving: $($_.title)" `
                        -PercentComplete $pct `
                        -CurrentOperation "$pct% complete" `
                        -Status "File $i of $totalCount"
        Download-File -URI $url.AbsoluteUri -OutputFile $pdfFile.FullName -OlderThan 180

        if($_.PublicationDate) {
            $pdfFile.CreationTime = $_.PublicationDate
            $pdfFile.LastAccessTime = $_.PublicationDate
            $pdfFile.LastWriteTime = $_.PublicationDate
        }
        $retval = Invoke-SqlUpdate -Query $sqlText -Parameters @{URL = $url.AbsoluteUri}
    }
}

function Unzip-ChartFile {
param (
    [Parameter(Mandatory=$true)]
    [string]$ZipFile,
    [Parameter(Mandatory=$true)]
    [string]$ChartFilePath
)
    Write-Host "Unzipping: $ZipFile"
    $zipFileObj = Get-Item $ZipFile

    $path = Join-Path $ChartFilePath $zipFileObj.BaseName
    New-Directory -Path $path | Out-Null

    $zipArchive = [System.IO.Compression.ZipFile]::OpenRead($zipFileObj.FullName)
    foreach ($zipArchiveEntry in $zipArchive.Entries) {
        $archiveName = $zipArchiveEntry.Name
        if($archiveName)
        {
            $chartFile = Join-Path $path $archiveName
            Write-Host "     Unzip file: $archiveName to $path"

            [System.IO.Compression.ZipFileExtensions]::ExtractToFile($zipArchiveEntry, $chartFile, $true)

            $chartFile = Get-ChildItem -Path $chartFile
            $chartFile.CreationTime = $zipFileObj.CreationTime
            $chartFile.LastAccessTime = $zipFileObj.LastAccessTime
            $chartFile.LastWriteTime = $zipFileObj.LastWriteTime
        }
    }

    Set-ItemProperty -Path $path -Name CreationTime -Value $($zipFileObj.CreationTime)
    Set-ItemProperty -Path $path -Name LastAccessTime -Value $($zipFileObj.LastAccessTime)
    Set-ItemProperty -Path $path -Name LastWriteTime -Value $($zipFileObj.LastWriteTime)

    $zipArchive.Dispose()
}