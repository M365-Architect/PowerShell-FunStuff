#========================================================================
# Created on:   27.05.2014 12:10
# Created by:    Andreas Hähnel
#========================================================================

$zeit = 180
$loop = $true
Add-Type -AssemblyName System.Windows.Forms
Clear-Host
while($loop)
{
	Write-Host "Drinking coffee :) "-ForegroundColor 'Green'
	[System.Windows.Forms.SendKeys]::SendWait("+") #alternativ ASCII Zeichen - zB [char] 1 für Smiley
	Start-Sleep -Seconds $zeit
}