$pkgId = 'SqlKerberosConfigMgr'
$url = 'http://download.microsoft.com/download/3/0/0/30097741-2498-4CD4-A475-EAC04DF6877A/x86/KerberosConfigMgr.msi'
$url64 = 'http://download.microsoft.com/download/3/0/0/30097741-2498-4CD4-A475-EAC04DF6877A/x64/KerberosConfigMgr.msi'

if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{E12F3D8B-3D75-40F7-8D98-FB9E41405658}") {
    Write-Host "$($pkgId) is already installed! Adding to chocolatey database"
}
else {
	Install-ChocolateyPackage $pkgId 'msi' '/qn' $url $url64
}