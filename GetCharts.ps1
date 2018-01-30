Clear
#
# ********** GET & SET THE WORKING DIRECTORY **********
#
Set-Variable -Name scriptFile        -Value $script:MyInvocation.Mycommand.Path   -Option ReadOnly -Force
Set-Variable -Name appDirectory      -Value (Split-Path $scriptFile -Parent)      -Option ReadOnly -Force
Set-Variable -Name rootDirectory     -Value (Split-Path $appDirectory -Parent)    -Option ReadOnly -Force
Set-Variable -Name settingsDirectory -Value (Join-Path $rootDirectory 'Settings') -Option ReadOnly -Force
Set-Variable -Name classesDirectory  -Value (Join-Path $rootDirectory 'Classes')  -Option ReadOnly -Force
Set-Variable -Name modulesDirectory  -Value (Join-Path $rootDirectory 'Modules')  -Option ReadOnly -Force
Set-Variable -Name logsDirectory     -Value (Join-Path $rootDirectory 'Logs')     -Option ReadOnly -Force
Set-Location -Path $appDirectory

Set-Variable -Name chartSources -Value (Join-Path $appDirectory 'chart_sources.xml') -Option ReadOnly -Force
Set-Variable -Name manifestPath -Value (Join-Path $appDirectory 'Manifests')         -Option ReadOnly -Force
Set-Variable -Name zipFilepath  -Value (Join-Path $appDirectory 'Zips')              -Option ReadOnly -Force

#Set-Variable -Name cloudStorage -Value 'C:\Users\Dad\Box Sync\Boating'                 -Option ReadOnly -Force
Set-Variable -Name cloudStorage -Value 'C:\Users\Dad\MEGA\Boating'                    -Option ReadOnly -Force
Set-Variable -Name dataSource -Value (Join-Path $cloudStorage 'MarineCharts.sqlite3') -Option ReadOnly -Force
Set-Variable -Name chartsPath -Value (Join-Path $cloudStorage 'Charts')               -Option ReadOnly -Force
Set-Variable -Name coastPilot -Value (Join-Path $cloudStorage 'CoastPilot')           -Option ReadOnly -Force
Set-Variable -Name topoMaps   -Value (Join-Path $cloudStorage 'TopoMaps')             -Option ReadOnly -Force

#$Global:NOAAURL = 'http://www.nauticalcharts.noaa.gov'

Import-Module -Name "$modulesDirectory\Common" -force -DisableNameChecking
# Import-Module -Name "$appDirectory\DBSupport" -force -DisableNameChecking
Import-Module -Name "$appDirectory\GetChartsCommon" -force -DisableNameChecking
Import-Module -Name "$classesDirectory\SimplySql" -force -DisableNameChecking

# Display script name & parameters in Windows Title
Set-Variable -Name scriptName -Value (Get-ScriptName $scriptFile) -Option ReadOnly -Force 
$details = "$scriptName"
$host.ui.RawUI.WindowTitle = $details

New-Directory -Path $coastPilot   | Out-Null
New-Directory -Path $manifestPath | Out-Null
New-Directory -Path $topoMaps     | Out-Null

Open-SQLiteConnection -DataSource 'C:\Users\Dad\MEGA\Boating\MarineCharts.sqlite3'


#Create-Tables
#return
Get-ChartManifests -ChartSources $chartSources -FilePath $manifestPath

#Process-ChartManifest -ChartsPath $chartsPath -ZipFilePath $zipFilepath -QueryParameters @{name='All'; type='ENC'}
#Process-ChartManifest -ChartsPath $chartsPath -ZipFilePath $zipFilepath -QueryParameters @{name='All'; type='RNC'}

#Process-ChartManifest -ChartsPath $chartsPath -ZipFilePath $zipFilepath -QueryParameters @{Type='USACE'; Name='US ACE Inland ENC charts'}
#Process-ChartManifest -ChartsPath $chartsPath -ZipFilePath $zipFilepath -QueryParameters @{Type='USACE'; Name='US ACE Inland ENC Buoy Overlay'}
#Process-ChartManifest -ChartsPath $chartsPath -ZipFilePath $zipFilepath -QueryParameters @{Type='USACE'; Name='US ACE Inland ENC SW Pass Overlay'}



# Get other useful files
#Get-CoastalPilots -FilePath $coastPilot
#Get-NavRules -FilePath $cloudStorage
# 'http://ienccloud.us/ienc/products/files/documents/IENC%20Encoding%20Guide%20-%20Edition%202.3.6.pdf'

#
Close-SqlConnection
#Get-TopoMaps -ConnectionName $conn

<#
Invoke-SqlQuery -Query "SELECT * FROM Manifests WHERE name = 'All' and type = 'RNC';"

Invoke-SqlQuery -Query "SELECT * FROM ENCCharts"
Invoke-SqlQuery -Query "SELECT count(*) FROM ENCCharts"
Invoke-SqlQuery -Query "SELECT * FROM ENCCharts WHERE isdt > '2016-06-13'"

Invoke-SqlQuery -Query "SELECT * FROM RNCCharts"
Invoke-SqlQuery -Query "SELECT count(*) FROM RNCCharts"
Invoke-SqlQuery -Query "SELECT * FROM RNCCharts WHERE ntm_date > '2016-06-17'"
Invoke-SqlQuery -Query "SELECT * FROM RNCCharts WHERE chartName = '1116A'"

Invoke-SqlQuery -Query "SELECT * FROM Locations"

Invoke-SqlQuery -Query "SELECT * FROM Panels"
Invoke-SqlQuery -Query "SELECT count(*) FROM Panels"

Invoke-SqlQuery -Query "SELECT * FROM Vertices"
#>
