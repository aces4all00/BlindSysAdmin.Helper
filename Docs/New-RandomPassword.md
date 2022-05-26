---
external help file:
Module Name:
online version:
schema: 2.0.0
---

# New-RandomPassword

## SYNOPSIS
Creates new random password.

## SYNTAX

```
New-RandomPassword [[-MinimumLength] <Int32>] [[-MaximumLength] <Int32>]
 [[-IncludeSpecialCharacters] <Boolean>] [[-UppercaseCharacterset] <String>]
 [[-LowercaseCharacterset] <String>] [[-NumberCharacterset] <String>] [[-SpecialCharacterset] <String>]
 [[-AsSecureString] <Boolean>] [[-EnforceComplexity] <Boolean>] [[-StartWithAlphanumeric] <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates new random password having a random nnumber of characters between minimum and maximum.
Default character sets for uppercase characters, lowercase letter, and number contain all
know values.
Default values for these character ssets can be overriden by sepcifying other
values.

## EXAMPLES

### EXAMPLE 1
```
New-RandomPassword -AsString $false
7{V5BaO7CFrn#y=eGU
```

Generates new random password and returns it as string

### EXAMPLE 2
```
New-RandomPassword
System.Security.SecureString
```

Generates new random password and returns it as SecureString

## PARAMETERS

### -MinimumLength
Minimum length of password to generate.

Default value is 8

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
Maximum length of password to generate.

Default value is 32

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

### -IncludeSpecialCharacters
Indicates if generated password should include special characters.

Default is true.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -UppercaseCharacterset
Allows default set of uppercase characters to be overriden by
secifying a value.

Default value is 'ABCDEFGHKLMNOPRSTUVWXYZ'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: ABCDEFGHKLMNOPRSTUVWXYZ
Accept pipeline input: False
Accept wildcard characters: False
```

### -LowercaseCharacterset
Allows default set of lowercase characters to be overriden by
secifying a value.

Default value is 'abcdefghiklmnoprstuvwxyz'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Abcdefghiklmnoprstuvwxyz
Accept pipeline input: False
Accept wildcard characters: False
```

### -NumberCharacterset
Allows default set of number characters to be overriden by
secifying a value.

Default value is '0123456789'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0123456789
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpecialCharacterset
Allows default set of special characters to be overriden by
secifying a value.

Default value is '!$%()=?{@#'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: !$%()=?{@#
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsSecureString
True if a secure sctring should be returned.
False if plain text.

Default is true.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnforceComplexity
True if characters from at least 3 of the 4 character sets must
be present in generated password.

Default is true.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartWithAlphanumeric
True if first letter of generated password must be from one
of the alphanumeric character sets (uppcase letters, lowercase letters,
numbers)

Default is true.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. New-RandomPassword does not accept values from pipeline.
## OUTPUTS

### System.Security.SecureString By default New-RandomPassword returns the generated password as a SecureString.
### System.String New-RandomPassword returns the generated password as a plain text string when AsSecureString is false.
## NOTES
Author: Aces4All00, The Blind SysAdmin

Date:   2022-05-25

## RELATED LINKS

[Online version: https://github.com/aces4all00/BlinSysAdmin.Helper](https://github.com/aces4all00/BlinSysAdmin.Helper)

[Online license: https://github.com/aces4all00/BlinSysAdmin.Helper/blob/main/LICENSE](https://github.com/aces4all00/BlinSysAdmin.Helper/blob/main/LICENSE)

[Online repository: https://github.com/aces4all00/BlinSysAdmin.Helper](https://github.com/aces4all00/BlinSysAdmin.Helper)

