$pkgId = 'IIS7Manager'
$url = 'http://download.microsoft.com/download/A/9/3/A9391E22-2554-4D19-BA3E-794456EC77E0/inetmgr_i386.msi'
$url64 = 'http://download.microsoft.com/download/A/9/3/A9391E22-2554-4D19-BA3E-794456EC77E0/inetmgr_amd64.msi'

if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{2349E6AA-CFCA-4D17-B633-3ECDA92E38CD}") {
    Write-Host "$($pkgId) is already installed! Adding to chocolatey database"
}
else {
	Install-ChocolateyPackage $pkgId 'msi' '/qn' $url $url64
}