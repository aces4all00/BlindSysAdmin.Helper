$scriptPathList = @(
    "$PSScriptRoot\Class\UniqueType.ps1"
    "$PSScriptRoot\Public\New-RandomPassword.ps1"
    "$PSScriptRoot\Public\New-UniqueUserName.ps1"
    "$PSScriptRoot\Public\Start-WinRmCim.ps1"
    "$PSScriptRoot\Public\Stop-WinRmCim.ps1"
    "$PSScriptRoot\Public\Test-IsWindows.ps1"
)

foreach ($path in $scriptPathList) {
    . "`"$path`""
}

Export-ModuleMember -Function $publicFunctionList