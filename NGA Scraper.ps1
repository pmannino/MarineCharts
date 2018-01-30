
    $links = @()

for ($page=1; $page -le 15; $page++) {
    $url = "http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_st=&_pageLabel=msi_portal_page_62&pubCode=$($page.ToString("0000"))"
    $site = Invoke-WebRequest -Uri $url
    $links = $site.Links.href | Where-Object{$_ -match '(?i)\.(zip|pdf)$'} # | Sort -Descending | Select-Object -First 1
    $links | Out-File -FilePath "c:\temp\PUB$($page.ToString("0000"))_links.txt"
#    Download-File -URI $url -outputFile "c:\temp\PUB$($page.ToString("0000")).html"


}

#/MSISiteContent/StaticFiles/Files
#MSISiteContent/StaticFiles/NAV_PUBS
