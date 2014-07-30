try {

  Install-ChocolateyPackage 'dotTrace' 'msi' '/passive /qn' 'http://download-cf.jetbrains.com/dottrace/dotTraceSetup.5.5.5.346.msi'

} catch {

  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw

}