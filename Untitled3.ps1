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

function ConvertFrom-XmlXX($XML) {
    $PSObject = New-Object PSObject
    $XML.ChildNodes | ForEach-Object {
        $propName = $_.Name
        $propValue = $_.InnerText
        $PSObject | Add-Member -Name $propName -Value $propValue -MemberType NoteProperty
    }

    Return $PSObject
}


    $catalogName = $Global:xmlxxx.FirstChild.NextSibling.Name
    $productCatalog = $Global:xmlxxx.$catalogName
$header = $productCatalog.Header
$charts = $productCatalog.cell
$dateCreated = Get-Date -Date $($header.date_created) -format 'yyyy-MM-dd'

$a = ConvertFrom-XML -Object $header

$a

