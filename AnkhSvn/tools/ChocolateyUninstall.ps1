$package = 'AnkhSvn'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{D5DE8FBB-24D6-4F8B-90E5-4737177474D6}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qb" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)" 
}