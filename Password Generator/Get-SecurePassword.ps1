#========================================================================
# Created on:   10.05.2016 10:18
# Created by:   Andreas Hähnel
#========================================================================


function New-RandomPassword
{
	param
	(
		$Length = 50
	)
	$upper = [Char[]](65..90) -ne 'O' -ne 'Q' -ne 'L' -ne 'I'
	$lower = [Char[]](97..122) -ne 'o' -ne 'q' -ne 'l'
	#$special = [Char[]]'§&"/+#*'
	$special = [Char[]]'-=)(/&%$§!'

	$bucket = New-Object -TypeName System.Collections.ArrayList
	$null = $bucket.Add((Get-Random -Maximum 10))
	$null = $bucket.Add((Get-Random -Count 1 -InputObject $special))
	(Get-Random -Count (($length-2) /2) -InputObject $upper ).Foreach{$null = $bucket.Add($_)}
	(Get-Random -Count (($length-2) /2) -InputObject $lower ).Foreach{$null = $bucket.Add($_)}

	$bucket =  Get-Random -Count $length -InputObject $bucket
	-join $bucket
} 

New-RandomPassword
