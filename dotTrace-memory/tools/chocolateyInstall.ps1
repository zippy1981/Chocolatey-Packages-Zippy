try {

  Install-ChocolateyPackage `
    'dotTraceMemory' 'exe' '/S /v/qn' `
    'http://download-ln.jetbrains.com/dottrace/dotTraceMemorySetup.IA32.3.5.360.114.exe' `
    'http://download-ln.jetbrains.com/dottrace/dotTraceMemorySetup.AMD64.3.5.360.114.exe'

} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw

}