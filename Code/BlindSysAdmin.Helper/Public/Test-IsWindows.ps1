function Test-IsWindows {
<#
    .SYNOPSIS
    Tests if PowerShell is running on Windows

    .DESCRIPTION
    Tests if PowerShell is running on Windows.
    Helps cross-platform scripts identify if they are running on Windows.

    .INPUTS
    System.Void     None

    .OUTPUTS
    System.Void     None

    .EXAMPLE
    PS> Test-IsWindows
    TRUE
    
        Test if PowerShell is running on a Windows OS

    .LINK
    Online version: https://aces4all00.github.com/

    .LINK
    Online license: https://github.com/aces4all00/BlindSysAdmin.Helper/blob/main/LICENSE

    .LINK
    Online repository: https://github.com/aces4all00/BlindSysAdmin.Helper

    .NOTES
    Author: Aces4All00, The Blind SysAdmin

    Date:   2025-02-24
#>
    [OutputType([bool])]
    param ()
    $null = if ($PSVersionTable.PSVersion.Major -lt 6) {
        return $true
    } elseif ($null -ne $IsWindows) {
        return $IsWindows
    } else {$null}
}