$package = 'IIS7Manager'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{2349E6AA-CFCA-4D17-B633-3ECDA92E38CD}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qn" -validExitCodes @(0)
  
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 
}