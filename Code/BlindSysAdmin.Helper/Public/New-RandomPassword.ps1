function New-RandomPassword {
<#
    .SYNOPSIS
    Creates new random password.

    .DESCRIPTION
    Creates new random password having a random nnumber of characters between minimum and maximum.
    Default character sets for uppercase characters, lowercase letter, and number contain all
    know values. Default values for these character ssets can be overriden by sepcifying other
    values.

    .PARAMETER MinimumLength
    Minimum length of password to generate.
    
    Default value is 8

    .PARAMETER MaximumLength
    Maximum length of password to generate.
    
    Default value is 32

    .PARAMETER IncludeSpecialCharacters
    Indicates if generated password should include special characters.
    
    Default is true.

    .PARAMETER UppercaseCharacterset
    Allows default set of uppercase characters to be overriden by
    secifying a value.
    
    Default value is 'ABCDEFGHKLMNOPRSTUVWXYZ'.

    .PARAMETER LowercaseCharacterset
    Allows default set of lowercase characters to be overriden by
    secifying a value.
    
    Default value is 'abcdefghiklmnoprstuvwxyz'.

    .PARAMETER NumberCharacterset
    Allows default set of number characters to be overriden by
    secifying a value.
    
    Default value is '0123456789'.

    .PARAMETER SpecialCharacterset
    Allows default set of special characters to be overriden by
    secifying a value.
    
    Default value is '!$%()=?{@#'.

    .PARAMETER AsSecureString
    True if a secure sctring should be returned. False if plain text.
    
    Default is true.

    .PARAMETER EnforceComplexity
    True if characters from at least 3 of the 4 character sets must
    be present in generated password.
    
    Default is true.

    .PARAMETER StartWithAlphanumeric
    True if first letter of generated password must be from one
    of the alphanumeric character sets (uppcase letters, lowercase letters,
    numbers)
    
    Default is true.

    .INPUTS
    None. New-RandomPassword does not accept values from pipeline.

    .OUTPUTS
    System.Security.SecureString By default New-RandomPassword returns the 
    generated password as a SecureString.
    
    System.String New-RandomPassword returns the generated password as a 
    plain text string when AsSecureString is false.

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
    Online license: https://github.com/aces4all00/BlinSysAdmin.Helper/blob/main/LICENSE

    .LINK
    Online repository: https://github.com/aces4all00/BlinSysAdmin.Helper

    .NOTES
    Author: Aces4All00, The Blind SysAdmin
    Date:   2022-05-25

#>
    [CmdletBinding()]
    param (
        [parameter(Mandatory = $false)]
        [int]$MinimumLength = 8,

        [parameter(Mandatory = $false)]
        [int]$MaximumLength = 32,

        [parameter(Mandatory = $false)]
        [bool]$IncludeSpecialCharacters = $true,

        [parameter(Mandatory = $false)]
        [string]$UppercaseCharacterset = 'ABCDEFGHKLMNOPRSTUVWXYZ',

        [parameter(Mandatory = $false)]
        [string]$LowercaseCharacterset = 'abcdefghiklmnoprstuvwxyz',

        [parameter(Mandatory = $false)]
        [string]$NumberCharacterset = '0123456789',

        [parameter(Mandatory = $false)]
        [string]$SpecialCharacterset = '!$%()=?{@#',

        [parameter(Mandatory = $false)]
        [bool]$AsSecureString = $true,

        [parameter(Mandatory = $false)]
        [bool]$EnforceComplexity = $true,

        [parameter(Mandatory = $false)]
        [bool]$StartWithAlphanumeric = $true
    )

    $possibleCharacters = "$(
        $UppercaseCharacterset +
        $LowercaseCharacterset +
        $NumberCharacterset
    )"

    $randomLength = Get-Random -Minimum $MinimumLength -Max $MaximumLength

    if ($StartWithAlphanumeric) {
        $firstCharacter = $possibleCharacters.ToCharArray() | Get-Random -Count 1
        $possibleCharacters = $possibleCharacters + $SpecialCharacterset
        $remainingCharacters = ($possibleCharacters.ToCharArray() | Get-Random -Count ($randomLength - 1)) -join ''
        $password = $firstCharacter + $remainingCharacters
    } else {
        $possibleCharacters = $possibleCharacters + $SpecialCharacterset
        $password = ($possibleCharacters.ToCharArray() | Get-Random -Count $randomLength) -join ''
    }

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

    if(($EnforceComplexity) -and ($characterSetCount -lt 3)) {
        "Not complex enough. Retrying"
        $password = New-RandomPassword @PSBoundParameters
    }

    if ($AsSecureString) {
        $password | ConvertTo-SecureString -AsPlainText
    } else {
        $password
    }
}