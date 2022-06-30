# Author: Andreas Hähnel
# provide the source and adjust the splitting parameters according your needs

function Get-ScriptDirectory
{
	if ($hostinvocation -ne $null)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

$csvlinecount = 15 #maximum number of entries per target CSV
$csvinputpath = "C:\batch\myCSV.csv"
$csvcount = 1
$csvpointer = 1
$csvname = "SMBX"

$csvtemp = Get-Content $csvinputpath

while ($csvpointer -le $csvtemp.Length)
{
	$outpath = ((Get-ScriptDirectory) + "\" + $csvname + "_" + $csvcount.ToString() + ".csv")
	$csvtemp[0] | Out-File $outpath
	while ($csvpointer -le $csvlinecount)
	{
		$csvtemp[$csvpointer] | Out-File $outpath
		$csvpointer++
	}
	$csvcount++
}
