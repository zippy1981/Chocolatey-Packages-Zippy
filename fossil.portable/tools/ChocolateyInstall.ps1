try {
  $package = 'fossil'
  $url = 'http://www.fossil-scm.org/download/fossil-w32-20130911114349.zip'
  $destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

  Install-ChocolateyZipPackage $package -url $url -unzipLocation $destination
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}

#