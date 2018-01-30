#install-module simplysql
#set-psrepository

Clear

Set-Variable -Name scriptFile        -Value $script:MyInvocation.Mycommand.Path   -Option ReadOnly -Force
Set-Variable -Name appDirectory      -Value (Split-Path $scriptFile -Parent)      -Option ReadOnly -Force
Set-Variable -Name rootDirectory     -Value (Split-Path $appDirectory -Parent)    -Option ReadOnly -Force
Set-Variable -Name settingsDirectory -Value (Join-Path $rootDirectory 'Settings') -Option ReadOnly -Force
Set-Variable -Name classesDirectory  -Value (Join-Path $rootDirectory 'Classes')  -Option ReadOnly -Force
Set-Variable -Name modulesDirectory  -Value (Join-Path $rootDirectory 'Modules')  -Option ReadOnly -Force
Set-Variable -Name logsDirectory     -Value (Join-Path $rootDirectory 'Logs')     -Option ReadOnly -Force
Set-Location -Path $appDirectory

Import-Module -Name "$classesDirectory\SimplySql" -force -DisableNameChecking

$name='All'
$Type='ENC'
$Tablename = 'USACECharts'
Open-SQLiteConnection -ConnectionName 'SQLite' -DataSource 'C:\Users\Dad\MEGA\Boating\MarineCharts.sqlite3'
# Invoke-SqlQuery -ConnectionName  'SQLite' -Query 'SELECT * from Manifests'
#    $topoMaps = Invoke-SqliteQuery -DataSource $DataSource -Query 'SELECT GDAItemID, MapName, DownloadGeoPDF FROM ToposToUpdate WHERE DownloadDate IS NULL'

$Parameters = @{Name=$Name; Type=$Type}


$conn = 'SQLite'
#    $manifest = Invoke-SqlQuery -ConnectionName  'SQLite' -Query "$query name = @Name and type = @Type" -Parameters $Parameters
    
    Execute-DynamicSelect -ConnectionName $conn -TableName $Tablename # -Parameters $Parameter

Invoke-SqlUpdate -ConnectionName $conn -Query "UPDATE USACECharts SET DateRetrieved = '2017-12-01'"

