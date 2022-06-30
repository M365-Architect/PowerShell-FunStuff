#========================================================================
# Created on:   04.03.2014 12:06
# Created by:   Andreas Hähnel
#========================================================================


param
( 	[Parameter(Position=0, Mandatory=$true)][string]$CSV,
	[Parameter(Position=0, Mandatory=$true)][ValidateSet(",", ";","Tab")][string]$Delimiter
)

Write-Host ("Parsing file " +$CSV)

if($Delimiter -eq ";") {Write-Host "nothing to do :) "}
if($Delimiter -eq ",") { $new = foreach($zeile in (Get-Content -Path $CSV -ReadCount 0)) {$zeile -replace ',',';' } }
if($Delimiter -eq "Tab") { $new = foreach($zeile in (Get-Content -Path $CSV -ReadCount 0)) {$zeile -replace '\t',';' } }

$new | Out-File "D:\neu.log"