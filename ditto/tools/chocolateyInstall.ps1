# The installer doesn't properly kill ditto
Get-Process | Where { $_.name -eq 'ditto' } | Stop-Process
Install-ChocolateyPackage 'ditto' 'exe' '/sp- /silent /norestart' `
	'http://iweb.dl.sourceforge.net/project/ditto-cp/Ditto/3.20.54.0/DittoSetup_3_20_54_0.exe'
Set-ItemProperty -Path HKCU:\Software\Ditto\CopyStrings -name 'powershell.exe' -value '% {{Delay100}ey'
Set-ItemProperty -Path HKCU:\Software\Ditto\PasteStrings -name 'powershell.exe' -value '% {{Delay100}ep'
# It also doesn't start the process
start (Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run).Ditto