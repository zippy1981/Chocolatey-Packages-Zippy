Install-ChocolateyZipPackage 'ReSharper.SDK.tool' `
	'http://download.jetbrains.com/resharper/ReSharperSDK-8.0.1086.zip' `
	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"