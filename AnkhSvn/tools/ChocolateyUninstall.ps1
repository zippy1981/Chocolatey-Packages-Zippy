$package = 'AnkhSvn'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{A6E0F8A8-469D-4109-BC4B-F67564065069}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qb" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)" 
}