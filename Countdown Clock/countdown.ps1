
param (
    [Parameter(Mandatory=$true)]
    [System.Int32]
    $DurationInMinutes
) 

$Start = Get-Date
$Duration = New-TimeSpan -Minutes $DurationInMinutes
$End = $Start + $Duration
Do{
    Start-Sleep -Seconds 1
    $DisplayTime = New-TimeSpan -Start $(Get-Date) -End $End
    $Time = "{0:D2}:{1:D2}" -f ($DisplayTime.Minutes),  ($DisplayTime.Seconds)
    Write-Progress $Time 
}
While((Get-date) -lt $End)