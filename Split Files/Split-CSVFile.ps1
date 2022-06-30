# Author: Andreas Hähnel
# provide the source and the field, that will be the marker for the split, e.g. the column that contains the timezone

$GroupField = "TimeZone"
$Delimiter = ";"
$csv = "C:\batch\myCSV.csv"
$outfolder = "C:\batch"

$all = Import-Csv $csv -Delimiter $Delimiter
$groupedCollection = $all | Group-Object $GroupField

#now we have an Array 
foreach($group in $groupedCollection)
{
    Write-Host ("Group '" + $group.Name + "' // " + $group.Count.ToString() + " Members")
    $group.Group | ConvertTo-Csv -NoTypeInformation -Delimiter "," | Out-File ($outfolder + $group.Name + ".csv")
}
