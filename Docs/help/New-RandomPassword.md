---
external help file: BlindSysAdmin.Helper-help.xml
Module Name: BlindSysAdmin.Helper
online version: 0.0.2
schema: 2.0.0
---

# New-RandomPassword

## SYNOPSIS
Creates new random password.

## SYNTAX

```
New-RandomPassword [[-MinimumLength] <Int32>] [[-MaximumLength] <Int32>] [-ExcludeSpecialCharacters]
 [[-UppercaseCharacterset] <String>] [[-LowercaseCharacterset] <String>] [[-NumberCharacterset] <String>]
 [[-SpecialCharacterset] <String>] [-AsPlainText] [-EnforceComplexity] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates new random password having a random number of characters between minimum and maximum.
Default character sets for uppercase letters, lowercase letters, and numbers contain all known values.
Default values for these character sets can be overridden by specifying other values.

## EXAMPLES

### EXAMPLE 1
```powershell
New-RandomPassword -AsPlainText
```

```output
7{V5BaO7CFrn#y=eGU
```

Generates new random password and returns it as string

### EXAMPLE 2
```powershell
New-RandomPassword
```
```output
System.Security.SecureString
```

Generates new random password and returns it as SecureString

## PARAMETERS

### -MinimumLength
Minimum length of password to generate. Default is 8.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 8
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaximumLength
Maximum length of password to generate. Default is 32.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 32
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeSpecialCharacters
Excludes (all) special characters from generated password.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UppercaseCharacterset
Allows default set of uppercase characters to be overridden by specifying a value.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: ABCDEFGHKLMNOPRSTUVWXYZ
Accept pipeline input: False
Accept wildcard characters: False
```

### -LowercaseCharacterset
Allows default set of lowercase characters to be overridden by specifying a value.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: abcdefghiklmnoprstuvwxyz
Accept pipeline input: False
Accept wildcard characters: False
```

### -NumberCharacterset
Allows default set of number characters to be overridden by specifying a value.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0123456789
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpecialCharacterset
Allows default set of special characters to be overridden by specifying a value.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: `~,./<>?;:"'\|!@#$%^&*()-_=+[]{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsPlainText
Returns generated password as plain text string instead of a securestring.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnforceComplexity
Requires characters from at least 3 of the 4 character sets must be present in generated password.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, -ProgressAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. New-RandomPassword does not accept values from pipeline.
## OUTPUTS

### System.Security.SecureString By default New-RandomPassword returns the generated password as a SecureString.
### System.String New-RandomPassword returns the generated password as a plain text string when AsPlainText switch is used.
## NOTES
Author: Aces4All00, The Blind SysAdmin

Date:   2022-05-26

## RELATED LINKS

[Online version: https://aces4all00.github.com/]()

[Online license: https://github.com/aces4all00/BlindSysAdmin.Helper/blob/main/LICENSE]()

[Online repository: https://github.com/aces4all00/BlindSysAdmin.Helper]()

