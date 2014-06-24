try {
  if (Test-Path HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Inkscape) {
    $installedVersion = [Version] (Get-ItemProperty HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Inkscape DisplayVersion).DisplayVersion
  }
  if ($installedVersion -eq [Version] '0.48.5.0') {
    Write-ChocolateySuccess 'inkscape' 'Inkscape is already installed. Updating the chococolatey database.'
  }
  elseif ($installedVersion -gt [Version] '0.48.5.0') {
    Write-ChocolateyFailure 'inkscape' "A newer version of inkscape [$($installedVersion)] is already installed. Updating the chococolatey database."
  }
  else {
    Install-ChocolateyPackage 'inkscape' 'exe' '/S' 'http://sourceforge.net/projects/inkscape/files/inkscape/0.48.5/Inkscape-0.48.5-1-win32.exe/download'
  }
} catch {
  Write-ChocolateyFailure 'inkscape' "$($_.Exception.Message)"
  throw
}
