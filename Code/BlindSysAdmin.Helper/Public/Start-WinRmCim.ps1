function Start-WinRmCim {
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
            $icmServiceManualStart = @{
                methodname = "ChangeStartmode"
                Arguments  = @{startmode = 'Manual'}
            }
            $icmServiceStart = @{
                methodname = "StartService"
            }
            if (Test-Connection -TargetName $_ -Count 1 -Quiet) {
                $result.IsOnline = $true
                $cimSession = New-CimSession -ComputerName $_ -SessionOption $cimOption
                $cimWinRM = Get-CimInstance -CimSession $cimSession -ClassName 'Win32_Service' -Filter 'Name = "WinRM"'
                $null = $cimWinRM | Invoke-CimMethod @icmServiceManualStart
                $null = $cimWinRM | Invoke-CimMethod @icmServiceStart
                $cimWinRM = $cimWinRM | Get-CimInstance
                $result.Started = $cimWinRM.Started
                $cimWinRM.Dispose()
                $cimSession.Close()
            }
            $icmServiceStart = $null
            $icmServiceManualStart = $null
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
