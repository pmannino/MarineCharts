$header = $productCatalog.Header
$charts = $productCatalog.cell
[datetime]$newDateCreated = Get-Date -Date $($header.date_created) -format 'yyyy-MM-dd'

$result = Execute-DynamicSelect -TableName 'ProductCatalogs' -Columns @('date_created') -Parameters @{title='ENC Product Catalog'}
[datetime]$oldDateCreated = $result.date_created

$psObj = xmlNodeToPsCustomObject -node $header
$psObj | Add-Member -Name 'DateRetrieved' -Value (Get-Date -Format 'yyyy-MM-dd HH:mm:ss') -MemberType NoteProperty
Invoke-PSObject -Object $psObj -DestinationTable 'ProductCatalogs' -OnConflict REPLACE | Out-Null

if(($oldDateCreated -eq $newDateCreated) -or !$result) {  #!! -ne
    Write-Host "Updating $catalogName tables"

    $chartList=@()
    $locList=@()
    $panelList=@()
    $verticesList=@()
#    $charts = $charts[0..10]
    [int]$chartNum=0

    foreach ($chart in $charts) {
        $chartName = $chart.name
        $chartNum++
        $details = "$scriptName-$chartName $chartNum of $($charts.Count)"
        $host.ui.RawUI.WindowTitle = $details

        $chartObj = New-Object PSObject -Property @{
            chartName      = $chartName
            cscale         = $chart.cscale
            DateRetrieved  = (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
            DownloadStatus = 'Current'
            edtn           = $chart.edtn;
            isdt           = $chart.isdt;
            lname          = $chart.lname;
            src_chart      = $chart.src_chart;
            status         = $chart.status;
            uadt           = $chart.uadt;
            updn           = $chart.updn;
            zipfile_datetime = $chart.zipfile_datetime;
            zipfile_datetime_iso8601 = $chart.zipfile_datetime_iso8601;
            zipfile_location = $chart.zipfile_location;
            zipfile_size     = $chart.zipfile_size
        }

        $result = Execute-DynamicSelect -TableName 'ENCCharts'-Parameters @{ChartName=$chartName}

        if($result) {
            [datetime]$oldDateCreated = $result.isdt
            [datetime]$newDateCreated = $chart.isdt
            if($newDateCreated -ne $oldDateCreated) {
                  $chartObj.DownloadStatus = 'Changed'                       
            }

        } else {
            $chartObj.DownloadStatus = 'New'                       
        }
        $chartList += $chartObj

        $locations = $chart.coast_guard_districts.coast_guard_district
        foreach ($location in $locations) {
            $parameters = @{'chartName'=$chartName;
                            'loc'=$location;
                            'loc_type'='CGDistrict'}
            $locObj = New-Object –TypeName PSObject –Prop $parameters
            $locList += $locObj
        }

        $locations = $chart.states.state
        foreach ($location in $locations) {
            $parameters = @{'chartName'=$chartName;
                            'loc'=$location;
                            'loc_type'='State'}
            $locObj = New-Object –TypeName PSObject –Prop $parameters
            $locList += $locObj
        }

        $locations = $chart.regions.region
        foreach ($location in $locations) {
            $parameters = @{'chartName'=$chartName;
                            'loc'=$location;
                            'loc_type'='Region'}
            $locObj = New-Object –TypeName PSObject –Prop $parameters
            $locList += $locObj
        }

        $panels = $chart.cov.panel
        foreach ($panel in $panels) {
            $panelNumber = $panel.panel_no
            $parameters = @{'chartName'=$chartName;
                            'panel_no'=$panelNumber;
                            'panel_type'=$panel.type}
            $panelObj = New-Object –TypeName PSObject –Prop $parameters
            $panelList += $panelObj

            $vertices = $panel.vertex
            for ($i=0; $i -le ($vertices.Count-1); $i++) {
                $vertex = $vertices[$i]
                $parameters = @{'chartName'=$chartName;
                                'panel_no'=$panelNumber;
                                'lat'=$vertex.lat;                       
                                'long'=$vertex.long;
                                'pointNumber'=$i}
                $vertexObj = New-Object –TypeName PSObject –Prop $parameters
                $verticesList += $vertexObj
            }

        }

    }

    Write-Host "Updating ENCCharts"
    Invoke-PSObject -Object $chartList -DestinationTable 'ENCCharts'

    Write-Host "Updating Locations"
    Invoke-PSObject -Object $locList -DestinationTable 'Locations' -OnConflict REPLACE

    Write-Host "Updating Panels"
    Invoke-PSObject -Object $panelList -DestinationTable 'Panels'

    Write-Host "Updating Vertices"
    Invoke-PSObject -Object $verticesList -DestinationTable 'Vertices' -OnConflict REPLACE
}