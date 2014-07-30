# The installer doesn't properly kill ditto
Get-Process | Where { $_.name -eq 'ditto' } | Stop-Process
Install-ChocolateyPackage 'ditto' 'exe' '/sp- /silent /norestart' `
	'http://iweb.dl.sourceforge.net/project/ditto-cp/Ditto/3.19.24.0/DittoSetup_3_19_24_0.exe' `
	'http://superb-dca3.dl.sourceforge.net/project/ditto-cp/Ditto/3.19.24.0/DittoSetup_64bit_3_19_24_0.exe'
Set-ItemProperty -Path HKCU:\Software\Ditto\CopyStrings -name 'powershell.exe' -value '% {{Delay100}ey'
Set-ItemProperty -Path HKCU:\Software\Ditto\PasteStrings -name 'powershell.exe' -value '% {{Delay100}ep'
# It also doesn't start the process
start (Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run).Ditto