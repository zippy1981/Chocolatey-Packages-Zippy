$package = 'RSAT.FeaturePack'
$osInfo = Get-CimInstance Win32_OperatingSystem | SELECT Version, ProductType, Caption
$osInfo.Version = [version] $osInfo.Version

if ($osInfo.Version -lt [version]'6.0') {
    Write-Write-ChocolateyFailure $package 'The Remote System Administration Tool (RSAT) requires Windows Vista, Windows 2008 Server or later.'
    return
}
elseif ($osInfo.ProductType -ne 1) {
    Write-Host 'The RSAT is built into Windows server OSes, making this effectively a stub package'
    Write-ChocolateySuccess $package
}
else {
    if ($osInfo.Version.Major -eq 6) {
        if ($osInfo.Version.Minor -eq 0) {
            $url = 'http://download.microsoft.com/download/3/0/1/301EC38B-D8BD-40CD-A3B8-3A514A553BE8/Windows6.0-KB941314-x86_en-US.msu'
            $url64 = 'http://download.microsoft.com/download/6/7/3/673608E6-FAC4-4601-9443-6067FF432D98/Windows6.0-KB941314-x64_en-US.msu'
        }
        elseif ($osInfo.Version.Minor -eq 1) {
            $url = 'http://download.microsoft.com/download/4/F/7/4F71806A-1C56-4EF2-9B4F-9870C4CFD2EE/Windows6.1-KB958830-x86-RefreshPkg.msu'
            $url64 = 'http://download.microsoft.com/download/4/F/7/4F71806A-1C56-4EF2-9B4F-9870C4CFD2EE/Windows6.1-KB958830-x64-RefreshPkg.msu'
        }
        elseif ($osInfo.Version.Minor -eq 2) {
            $url = 'http://download.microsoft.com/download/4/3/F/43FAC524-F605-426E-A2AE-EAD03D264FDE/Windows6.2-KB2693643-x86.msu'
            $url64 = 'http://download.microsoft.com/download/4/3/F/43FAC524-F605-426E-A2AE-EAD03D264FDE/Windows6.2-KB2693643-x64.msu'
        }
        else {
            Write-ChocolateyFailure $package "This package does not support $($osInfo.Caption) yet."
            return
        }
        $chocTempDir = Join-Path $env:TEMP "chocolatey"
        $tempDir = Join-Path $chocTempDir "$package"
        if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir) | Out-Null}
        $file = Join-Path $tempDir "$($packageName).msu"
        Get-ChocolateyWebFile $package $file $url $url64
        Start-ChocolateyProcessAsAdmin @($file, '/quiet', '/norestart') 'wusa.exe'
        Write-ChocolateySuccess $package
    }
    else {
        Write-ChocolateyFailure $package "This package does not support $($osInfo.Caption) yet."
        return
    }
        

}
