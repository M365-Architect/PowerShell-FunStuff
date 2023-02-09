##################
#basic hashtable

$hashtable = @{}

#fill the ht with values
$hashtable.Add('Hans',34)
$hashtable.Add('Max', 51)
$hashtable.Add('Andy',42)

#working with Hashtable keys and direct adressing
$hashtable.Keys | %{Write-Output "$($_) is $($hashtable[$_])"}
Write-Output "Andy is $($hashtable["Andy"]) years old"

#sort the hashtable
$hashtable.GetEnumerator() | Sort-Object -Property Value -Descending
$hashtable.GetEnumerator() | Sort-Object -Property Value


##################
#specialized hashtable
$ht = @{}
#alternatively: Use .NET
#$ht = New-Object -TypeName System.Collections.Hashtable 

$ht = @{
    Name = 'Andy'
    Age = 42
    City = 'Regensburg'
}

#add more values
$ht.Add('country','Germany')

#access values
Write-Output "Age: $($ht["Age"])"
Write-Output "Name: $($ht.Item("Name")))"
Write-Output "City: $($ht.City)"

#loop through the HashTable
foreach($key in $ht.Keys){
    Write-Output "$($key) is $($ht[$key])"
}

$ht.Keys | % {Write-Output "$($_) is $($ht[$_])"}

$ht.GetEnumerator() | %{Write-Output "$($_.Key) : $($_.Value)"}
