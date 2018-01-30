$dt.GetType()



$scriptPath = $script:MyInvocation.Mycommand.Path

$rootPath = Split-Path $scriptPath
Set-Location -Path $rootPath
$dataSource = Join-Path $rootPath "MarineCharts.sqlite3"

$Global:topoFilepath = Join-Path $rootPath "TopoMaps"
New-Item -ItemType Directory -Force -Path $Global:topoFilepath | Out-Null

Import-Module -Name "$rootPath\DBSupport" -force -DisableNameChecking
Import-Module -Name "$rootPath\GetChartsCommon" -force -DisableNameChecking




    $topoMaps = Invoke-SqliteQuery -DataSource $DataSource -Query 'SELECT GDAItemID, MapName, DownloadGeoPDF FROM ToposToUpdate WHERE DownloadDate IS NULL'
    foreach ($topoMap in $topoMaps)
    {
        $filepath = Join-Path $Global:topoFilepath $topoMap.MapName
        $filepath = "$filepath.pdf"
        if(!(Test-Path -Path $filepath))
        {
            $url = $topoMap.DownloadGeoPDF
            Download-File -URL $url -FilePath $filepath
            Update-AllTopoMaps -DataSource $DataSource -GDAItemID $topoMap.GDAItemID
        }
    }

# http://viewer.nationalmap.gov/basic/
# http://viewer.nationalmap.gov/apps/download_manager/
# http://thor-f5.er.usgs.gov/ngtoc/metadata/misc/topomaps_all.zip

<#
for ($region=1; $region -le 9; $region++)
{
    $site = Invoke-WebRequest -UseBasicParsing -Uri "$noaaURL`coastpilot_w.php?book=$region"
    $link = $site.Links | Where-Object{$_.href -match '^.*(E[0-9]{2})_([0-9]{8}).*.pdf$'}
    $coastPilot = $link.href
    $isMatch = $coastPilot -match '^.*(E[0-9]{2})_([0-9]{8}).*$'
    if ($isMatch){
        $costalURL = $noaaURL + $Matches[0]
        $costalEdition = $Matches[1].Replace('E',$null)
        $costalUpdate = [datetime]::ParseExact($Matches[2], 'yyyyMMdd', $null)
    }else {
    }

    $booksToUpdate = Select-AllColumns -DataSource $DataSource -TableName 'CoastPilots' -WhereClause "region = $region"
    if($booksToUpdate.LastUpdate -ne $costalPilotUpdate)
    {
        $filename = Split-Path -Path $costalURL -Leaf
        $filepath = Join-Path $coastPilotFilepath $filename
        Download-File -URL $costalURL -FilePath $filepath
        $pdfFile = Get-ChildItem -Path $filepath
        $pdfFile.CreationTime = $costalUpdate
        $pdfFile.LastAccessTime = $costalUpdate
        $pdfFile.LastWriteTime = $costalUpdate
        Rename-Item -Path $filepath -NewName "$($booksToUpdate.Name).pdf"
        Update-CoastPilots -DataSource $DataSource -Region $region -SqlParameters @{
                        Edition=$costalEdition;
                        LastUpdate=$costalUpdate;
                        URL=$costalURL
                        }
    }

}
#>