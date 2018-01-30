Clear


#
# ********** GET & SET THE WORKING DIRECTORY **********
#
Set-Variable -Name scriptFile        -Value $script:MyInvocation.Mycommand.Path   -Option ReadOnly -Force
Set-Variable -Name appDirectory      -Value (Split-Path $scriptFile -Parent)      -Option ReadOnly -Force
Set-Variable -Name rootDirectory     -Value (Split-Path $appDirectory -Parent)    -Option ReadOnly -Force
Set-Variable -Name classesDirectory  -Value (Join-Path $rootDirectory 'Classes')  -Option ReadOnly -Force
Set-Variable -Name logsDirectory     -Value (Join-Path $rootDirectory 'Logs')     -Option ReadOnly -Force
Set-Variable -Name modulesDirectory  -Value (Join-Path $rootDirectory 'Modules')  -Option ReadOnly -Force
Set-Variable -Name settingsDirectory -Value (Join-Path $rootDirectory 'Settings') -Option ReadOnly -Force
Set-Location -Path $appDirectory
Set-Variable -Name datafile     -Value (Join-Path $appDirectory 'MarineCharts.sqlite3') -Option ReadOnly -Force
Set-Variable -Name manifestPath -Value (Join-Path $appDirectory 'Manifests')      -Option ReadOnly -Force
Set-Variable -Name zipRootPath  -Value (Join-Path $appDirectory 'Zips')           -Option ReadOnly -Force

#Set-Variable -Name cloudStorage -Value 'C:\Temp\Boating'                          -Option ReadOnly -Force
#Set-Variable -Name cloudStorage -Value 'C:\Users\Dad\MEGA\Boating'                -Option ReadOnly -Force
Set-Variable -Name cloudStorage -Value 'C:\Users\Pure Enjoyment\Documents\MEGA\Boating'    -Option ReadOnly -Force

Set-Variable -Name chartRootPath -Value (Join-Path $cloudStorage 'Charts')           -Option ReadOnly -Force

Import-Module (Join-Path $appDirectory "GetAllCharts") -force -DisableNameChecking

Import-Module (Join-Path $modulesDirectory "Common")         -force -DisableNameChecking
Import-Module (Join-Path $modulesDirectory "ZipFiles")       -force -DisableNameChecking

Import-Module (Join-Path $classesDirectory "SimplySql") -force -DisableNameChecking

New-Directory -Path $manifestPath
New-Directory -Path $chartRootPath
New-Directory -Path $zipRootPath

# Display script name & parameters in Windows Title
Set-Variable -Name scriptName -Value (Get-ScriptName $scriptFile) -Option ReadOnly -Force
$details = "$scriptName"
$host.ui.RawUI.WindowTitle = $details

Open-SQLiteConnection -DataSource $dataFile

# Load ChartSources table
[xml]$xmlDoc = Get-Content -Path "$appDirectory\chart_sources.xml"
$sources = Select-Xml -Xml $xmlDoc -XPath "//catalog" | Select-Object –ExpandProperty 'node'
$retval = Insert-PSObject -Object $sources -DestinationTable 'ChartSources'

Get-NOAAEncCharts -ManifestPath $manifestPath -ChartSourceName 'All'
Get-NOAARncCharts -ManifestPath $manifestPath -ChartSourceName 'All'

Get-USACEEncCharts -ManifestPath $manifestPath -ChartSourceName 'US ACE Inland ENC charts'
Get-USACEEncCharts -ManifestPath $manifestPath -ChartSourceName 'US ACE Inland ENC Buoy Overlay'
Get-USACEEncCharts -ManifestPath $manifestPath -ChartSourceName 'US ACE Inland ENC SW Pass Overlay'

Get-ChangedCharts -ZipFilepath $zipRootPath -ChartFilepath $chartRootPath

Get-CoastPilots -FilePath $cloudStorage

#Get-Documents -Source 'USCG' -DocumentType 'LightList' -FilePath $cloudStorage

#Get-Documents -Source 'NGA' -DocumentType 'LightList' -FilePath $cloudStorage
#Get-Documents -Source 'NGA' -DocumentType 'American Practical Navigator' -FilePath $cloudStorage
#Get-Documents -Source 'NGA' -DocumentType 'Chart1' -FilePath $cloudStorage

Get-Documents -Source 'NOAA' -DocumentType 'Chart1' -FilePath $cloudStorage

#Get-Documents -Source 'FAA' -DocumentType 'Advisory Circular' -FilePath $cloudStorage

Close-SqlConnection
