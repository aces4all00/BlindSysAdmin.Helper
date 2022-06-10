function New-RandomPassword {
<#
    .SYNOPSIS
    Creates new random password.

    .DESCRIPTION
    Creates new random password having a random nnumber of characters between minimum and maximum. Default character sets for uppercase letters, lowercase letters, and numbers contain all known values. Default values for these character ssets can be overriden by sepcifying other values.

    .PARAMETER MinimumLength
    Minimum length of password to generate.

    .PARAMETER MaximumLength
    Maximum length of password to generate.

    .PARAMETER ExcludeSpecialCharacters
    Excludes special characters from generated password.

    .PARAMETER UppercaseCharacterset
    Allows default set of uppercase characters to be overriden by secifying a value.

    .PARAMETER LowercaseCharacterset
    Allows default set of lowercase characters to be overriden by secifying a value.

    .PARAMETER NumberCharacterset
    Allows default set of number characters to be overriden by secifying a value.

    .PARAMETER SpecialCharacterset
    Allows default set of special characters to be overriden by secifying a value.

    .PARAMETER AsPlainText
    Returns generated password as plain text string instead of a securestring.

    .PARAMETER EnforceComplexity
    Requires characters from at least 3 of the 4 character sets must be present in generated password.

    .INPUTS
    None. New-RandomPassword does not accept values from pipeline.

    .OUTPUTS
    System.Security.SecureString By default New-RandomPassword returns the generated password as a SecureString.
    
    System.String New-RandomPassword returns the generated password as a plain text string when AsPlainText sqitch is used.

    .EXAMPLE
    PS> New-RandomPassword -AsString $false
    7{V5BaO7CFrn#y=eGU
    
        Generates new random password and returns it as string

    .EXAMPLE
    PS> New-RandomPassword
    System.Security.SecureString

        Generates new random password and returns it as SecureString

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
        [parameter(Mandatory = $false)]
        [int]$MinimumLength = 8,

        [parameter(Mandatory = $false)]
        [int]$MaximumLength = 32,

        [parameter(Mandatory = $false)]
        [switch]$ExcludeSpecialCharacters,

        [parameter(Mandatory = $false)]
        [string]$UppercaseCharacterset = 'ABCDEFGHKLMNOPRSTUVWXYZ',

        [parameter(Mandatory = $false)]
        [string]$LowercaseCharacterset = 'abcdefghiklmnoprstuvwxyz',

        [parameter(Mandatory = $false)]
        [string]$NumberCharacterset = '0123456789',

        [parameter(Mandatory = $false)]
        [string]$SpecialCharacterset = '`~,./<>?;:"''\|!@#$%^&*()-_=+[]{}',

        [parameter(Mandatory = $false)]
        [switch]$AsPlainText,

        [parameter(Mandatory = $false)]
        [switch]$EnforceComplexity
    )

    $possibleCharacters = "$(
        $UppercaseCharacterset +
        $LowercaseCharacterset +
        $NumberCharacterset
    )"

    switch ($MaximumLength)     {
        {$_ -gt $MinimumLength} {
            $randomLength = Get-Random -Minimum $MinimumLength -Max $MaximumLength
            break
        }

        {$_ -eq $MinimumLength} {
            $randomLength = $_
            break
        }

        default                 {
            throw "MaximumLength must be greater than or equal to MinimumLength"
        }
    }
    
    $firstCharacter = $possibleCharacters.ToCharArray() | Get-Random -Count 1
    if (-not $ExcludeSpecialCharacters) {
        $possibleCharacters = $possibleCharacters + $SpecialCharacterset
    }    
    $remainingCharacters = ($possibleCharacters.ToCharArray() | Get-Random -Count ($randomLength - 1)) -join ''
    $password = $firstCharacter + $remainingCharacters
    
    if ($EnforceComplexity) {
        $characterSetCount = 0

        switch -Regex ($password) {
            "[$UppercaseCharacterset]" {
                $characterSetCount++
            }
    
            "[$LowercaseCharacterset]" {
                $characterSetCount++
            }
    
            "[$NumberCharacterset]" {
                $characterSetCount++
            }
    
            "[$SpecialCharacterset]" {
                $characterSetCount++
            }            
        }

        if ($characterSetCount -lt 3) {
            Write-Warning -Message "Not complex enough. Retrying"
            $password = New-RandomPassword @PSBoundParameters
        }
    }

    if ($AsPlainText) {
        $password
    } else {
        $password | ConvertTo-SecureString -AsPlainText
    }
}