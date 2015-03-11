$package = 'SqlKerberosConfigMgr'

try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\
  $msiid = '{60C2F0E4-DE3E-4810-83B5-16AA144E01A5}'
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msIid /qn" -validExitCodes @(0)
  
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 
}