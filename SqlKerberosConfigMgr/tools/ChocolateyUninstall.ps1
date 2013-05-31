$package = 'SqlKerberosConfigMgr'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{E12F3D8B-3D75-40F7-8D98-FB9E41405658}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qn" -validExitCodes @(0)
  
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 
}