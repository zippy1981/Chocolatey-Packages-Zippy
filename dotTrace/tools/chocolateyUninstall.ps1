$package = 'dotTrace'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{97EF6F43-2795-4665-A2EA-486DE96EF267}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qb" -validExitCodes @(0,1603)

  # the following is all part of error handling
  Write-ChocolateySuccess $package¦
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}