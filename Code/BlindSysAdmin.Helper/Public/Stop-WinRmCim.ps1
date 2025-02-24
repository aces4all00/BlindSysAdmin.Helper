#Requires -version 7.0

function Stop-WinRmCim {
<#
    .SYNOPSIS
    Stop WinRM service using CIM method

    .DESCRIPTION
    Attempts to stop WinRM service of remote Windows computer using
    Cim

    .PARAMETER Computer
    Array of one or more computer names (string) to stop WinRM service on

    .INPUTS
    System.String[]   Computer

    .OUTPUTS
    System.PSObject   PSCustomObject that reports the results of the operation

    .EXAMPLE
    PS> Stop-WinRmCim -Computer 'SomeComputer01'
    Computer   : SomeComputer01
    IsOnline   : TRUE
    Service    : WinRM
    Started    : Stopped
    ReportDate : 2/24/2025 2:03:16 PM

        Stop WinRM Service on Computer 'SomeComputer01'

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
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
        )][string[]]$Computer
    )

    begin {
        $parallelBlock = {
            $result = [PSCustomObject]@{
                Computer    = $_
                IsOnline    = $false
                Service     = 'WinRM'
                Started     = 'Stopped'
                ReportDate  = (Get-Date)
            }
            $cimOption = New-CimSessionOption -Protocol Dcom
            $icmServiceDisableStart = @{
                methodname = "ChangeStartmode"
                Arguments  = @{startmode = 'Disabled'}
            }
            $icmServiceStop = @{
                methodname = "StopService"
            }
            if (Test-Connection -TargetName $_ -Count 1 -Quiet) {
                $result.IsOnline = $true
                $cimSession = New-CimSession -ComputerName $_ -SessionOption $cimOption
                $cimWinRM = Get-CimInstance -CimSession $cimSession -ClassName 'Win32_Service' -Filter 'Name = "WinRM"'
                $null = $cimWinRM | Invoke-CimMethod @icmServiceDisableStart
                $null = $cimWinRM | Invoke-CimMethod @icmServiceStop
                $cimWinRM = $cimWinRM | Get-CimInstance
                $result.Started = $cimWinRM.Started
                $cimWinRM.Dispose()
                $cimSession.Close()
            }
            $icmServiceDisableStart = $null
            $icmServiceStop = $null
            $cimOption.Dispose()
            $cimOption = $null
            $result
        }
    }

    Process {
        $Computer | ForEach-Object -Parallel $parallelBlock
    }

    end {
       Get-CimSession | Remove-CimSession
       $parallelBlock = $null
    }
}