$packageName = 'WebStorm'
$installerType = 'EXE'
$url = 'http://download.jetbrains.com/webstorm/WebStorm-9.0.3.exe' # download url
$url64 = $url
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
