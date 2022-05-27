enum UniqueType {
    Time
    Date
    Random
}

function New-UniqueUserName {
<#
    .SYNOPSIS
    Creates unique user name.

    .DESCRIPTION
    Attempts to create a unique user name by appending date, time, or random characters to a base name.

    .PARAMETER BaseName
    First part of user name. May only contain alphanumeric values and must be at least1 character and may not exceed 9 characters.

    .PARAMETER Method
    Method to use to try to make unique user name. Time appends a string representing current time, Date appends a string representing current date, Random appends a string of randomly generated alphanumeric characters.

    .INPUTS
    System.String   BaseName

    .OUTPUTS
    System.String   Unuque user name

    .EXAMPLE
    PS> New-UniqueUserName -BaseName "TempUsr"
    TempUsr220526

        Creates unique user name by appending current date (default method) to BaseName 'TempUsr'

    .EXAMPLE
    PS> New-UniqueUserName -BaseName "TempUsr" -Method Random
    TempUsrdxX8Eu

        Creates unique user name by appending Random string to BaseName 'TempUsr'

    .LINK
    Online version: https://aces4all00.github.com/

    .LINK
    Online license: https://github.com/aces4all00/BlindSysAdmin.Helper/blob/main/LICENSE

    .LINK
    Online repository: https://github.com/aces4all00/BlindSysAdmin.Helper

    .NOTES
    Author: Aces4All00, The Blind SysAdmin

    Date:   2022-05-26
#>
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
        )][ValidateScript (
            {
                if (($_.Length -le 9) -and ($_.Length -ge 1) -and ($_ -notmatch "[^a-zA-Z\d]")) {
                    $true
                } else {
                    throw "Invalid BaseName. BaseName must only contain alphanumeric characters be at least 1 character and no more than 9 in length"
                }
            }
        )][String]$BaseName,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )][UniqueType]$Method = [UniqueType]::Date
    )

    switch ($Method) {
        Time    {
            return $BaseName + "$((Get-Date).ToString('HHmmss'))"
        }

        Date    {
            return $BaseName + "$((Get-Date).ToString('yyMMdd'))"
        }

        Random  {
            return $BaseName + "$(New-RandomPassword -ExcludeSpecialCharacters -MinimumLength 6 -MaximumLength 6 -AsPlainText)"
        }
    }
}