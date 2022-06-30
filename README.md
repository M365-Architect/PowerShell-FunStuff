# PowerShell-FunStuff
This repository contains scripts with no real business use case, just some fun stuff. 
Before using any, carefully review and adjust the scripts to your need. 
USE AT YOUR OWN RISK!

## Countdown Clock
This is a small PowerShell based countdown, that ticks down for a specified amount of time.
```powershell
.\countdown.ps1 -DurationInMinutes 1
``` 

## MD5 Hash
This script can create and compare MD5 hashes for a file or strings. This script was originally written by a good friend (https://github.com/DrBlackBird) and later refined by me
```powershell
.\Start-HashToolbox.ps1 'Read me, I am a String!'
.\Start-HashToolbox.ps1 'C:\batch\myWonderfulScript.ps1' -file $true
.\Start-HashToolbox.ps1 'C:\batch\myWonderfulScript.ps1' -file $true -compareHash 'FA-0E-D3-31-8E-24-57-0D-09-25-AE-F6-5F-A1-60-82'
```
## Password Generator
This script generates secure passwords with 50 characters. These passwords are randomly generated and contain special characters. The script avoids the use of hardly readable characters like 'O' and 'l'. The result is printed to your PowerShell Window.
```powershell
.\Get-SecurePassword.ps1
```

## Replace Delimiter
Struggling with delimiters in CSV? Annoyed of manually replacing delimiters in structured files? That script can replace the delimiter in a whole file at once. The output will be a CSV with ; as delimiter. This is helpful for Excel imports.
```powershell
.\Replace-Delimiter.ps1 -CSV 'C:\batch\myCSV.csv' -Delimiter 'Tab'
.\Replace-Delimiter.ps1 -CSV 'C:\batch\myCSV.csv' -Delimiter ','
```

## Split Files
the need of splitting one large CSV file into smaller ones is addressed with these tiny scripts. The scripts can split any file, I mostly use them for CSV splitting.
### Split-CSVFile
This scripts splits a large CSV up to multiple ones for all entries with the same indicator. For example all entries with the same time zone. 
Adjust all variables inside the script to fit your needs.
### Split-CSVFileByLength.ps1
If you need to create multiple CSVs that contain a certain maximum number of entries (e.g. for small migration batches), this script helps you out.

## Stay Awake
You cannot install PowerToys and the Windows presentation settings are not availbe? Keep your screen active by automatically sending a keystroke to Windows. Adjust the time needed inside your script.

