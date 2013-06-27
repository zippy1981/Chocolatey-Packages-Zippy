$id = 'picasa';
$url = 'https://dl.google.com/picasa/picasa39-setup.exe';
try {
  Install-ChocolateyPackage $id 'exe' '/S /L' $url
} catch {
  Write-ChocolateyFailure $id "$($_.Exception.Message)"
  throw 
}