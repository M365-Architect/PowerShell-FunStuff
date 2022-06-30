<#
.SYNOPSIS
   Generates or compares an MD5 hashvalue from the content of a file.
   Author: Andreas Hähnel
	
.DESCRIPTION
   This Script generates the MD5 hash of a file or string. 
   Changing file content makes the hash invalid, so a re-generation is necessary!
   
.PARAMETER generateHashFrom
   contains the filepath to the source. The parameter is required.
    Example:
    "C:\Scripts\helloworld.ps1"
    "Hello World"    

.PARAMETER file
    This parameter provides a switch to tell the script if the provided value is a file ($true) or a simple string.
    This parameter is optional.
    
.PARAMETER compareHash
    This parameter let you compare hashes. If you want to check if contents of a file have changed, 
	enter the last known hash and check if it is still the same. This parameter is optional.
     
#>

[CmdletBinding()]

PARAM(
    [Parameter(Mandatory=$true)][string]$generateHashFrom,
    [Parameter(Mandatory=$false)][System.Boolean]$file,
    [Parameter(Mandatory=$false)][string]$compareHash
)


#generate a new MD5Provider object
$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
if($file) {
    $stream = [System.IO.File]::Open("$generateHashFrom",[System.IO.Filemode]::Open, [System.IO.FileAccess]::Read)
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($stream))
    $stream.Close()
    
} else {
    $utf8 = new-object -TypeName System.Text.UTF8Encoding
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($generateHashFrom)))
}

Write-Host "Your Hash has been generated for $generateHashFrom `n" -ForegroundColor "Yellow"
Write-Host "$hash `n"

if($compareHash) {
    if($hash.Equals($compareHash)) {
        Write-Host "The two Hashes are identical `n" -ForeGroundColor "Green"
        Write-Host "$hash"
        Write-Host "$compareHash `n"
    } else {
        Write-Host "The two Hashes are different `n" -ForeGroundColor "Red"
        Write-Host "$hash"
        Write-Host "$compareHash `n"
    }
}