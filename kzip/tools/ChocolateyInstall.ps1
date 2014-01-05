try 
{ 
    $name    = 'kzip'
    $url     = 'http://advsys.net/ken/util/kzip.exe'
    
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) 'content'
    
    $target  = Join-Path $content 'kzip.exe'

    New-Item $content -Type Directory
    Get-ChocolateyWebFile $name $target $url

    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name "$($_.Exception.Message)"
    throw 
}