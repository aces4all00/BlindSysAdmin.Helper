---
external help file: BlindSysAdmin.Helper-help.xml
Module Name: BlindSysAdmin.Helper
online version: 0.0.2
schema: 2.0.0
---

# New-UniqueUserName

## SYNOPSIS
Creates unique user name.

## SYNTAX

```
New-UniqueUserName [-BaseName] <String> [[-Method] <UniqueType>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Attempts to create a unique user name by appending date, time, or random characters to a base name.

## EXAMPLES

### EXAMPLE 1
```powershell
New-UniqueUserName -BaseName "TempUsr"
```
```output
TempUsr220526
```

Creates unique user name by appending current date (default method) to BaseName 'TempUsr'

### EXAMPLE 2
```powershell
New-UniqueUserName -BaseName "TempUsr" -Method Random
```
```output
TempUsrdxX8Eu
```

Creates unique user name by appending Random string to BaseName 'TempUsr'

## PARAMETERS

### -BaseName
First part of user name.
May only contain alphanumeric values and must be at least1 character and may not exceed 9 characters.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Method
Method to use to try to make unique user name.
Time appends a string representing current time, Date appends a string representing current date, Random appends a string of randomly generated alphanumeric characters.

```yaml
Type: UniqueType
Parameter Sets: (All)
Aliases:
Accepted values: Time, Date, Random

Required: False
Position: 2
Default value: Date
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, -ProgressAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String   BaseName
## OUTPUTS

### System.String   Unique user name
## NOTES
Author: Aces4All00, The Blind SysAdmin

Date:   2022-05-26

## RELATED LINKS

[Online version: https://aces4all00.github.com/]()

[Online license: https://github.com/aces4all00/BlindSysAdmin.Helper/blob/main/LICENSE]()

[Online repository: https://github.com/aces4all00/BlindSysAdmin.Helper]()

