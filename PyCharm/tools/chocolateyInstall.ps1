$packageName = 'Pycharm'
$installerType = 'EXE'
$url = 'http://download.jetbrains.com/python/pycharm-professional-4.5.1.exe'
$url64 = $url
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
