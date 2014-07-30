try {

  Install-ChocolateyPackage `
    'dotMemory' 'dotTrace' 'msi' '/passive /qn'  `
    'http://download-cf.jetbrains.com/dotmemory/dotMemorySetup.4.0.5.148.msi'

} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw

}