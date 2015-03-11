$pkgId = 'SqlKerberosConfigMgr'
$url = 'http://download.microsoft.com/download/3/0/0/30097741-2498-4CD4-A475-EAC04DF6877A/ENU/x86/KerberosConfigMgr.'
$url64 = 'http://download.microsoft.com/download/3/0/0/30097741-2498-4CD4-A475-EAC04DF6877A/ENU/x64/KerberosConfigMgr.msi'

if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{60C2F0E4-DE3E-4810-83B5-16AA144E01A5}") {
    Write-Host "$($pkgId) is already installed! Adding to chocolatey database"
}
else {
	Install-ChocolateyPackage $pkgId 'msi' '/qn' $url $url64
}
