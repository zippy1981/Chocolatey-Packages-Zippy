$package = 'dotTrace'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{6F9F4527-229C-4A6B-98A4-6874DCF5309F}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qb" -validExitCodes @(0,1603)

  # the following is all part of error handling
  Write-ChocolateySuccess $package¦
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}