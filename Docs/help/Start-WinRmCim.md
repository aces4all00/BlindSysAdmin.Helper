---
external help file: BlindSysAdmin.Helper-help.xml
Module Name: BlindSysAdmin.Helper
online version: 0.0.2
schema: 2.0.0
---

# Start-WinRmCim

## SYNOPSIS
Start WinRM service using CIM method

## SYNTAX

```
Start-WinRmCim [-Computer] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Attempts to start WinRM service of remote Windows computer using
Cim

## EXAMPLES

### EXAMPLE 1
```powershell
Start-WinRmCim -Computer 'SomeComputer01'
```
```output
Computer   : SomeComputer01
IsOnline   : TRUE
Service    : WinRM
Started    : Started
ReportDate : 2/24/2025 2:03:16 PM
```

Start WinRM Service on Computer 'SomeComputer01'

## PARAMETERS

### -Computer
Array of one or more computer names (string) to start WinRM service on

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, -ProgressAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]   Computer
## OUTPUTS

### System.PSObject   PSCustomObject that reports the results of the operation
## NOTES
Author: Aces4All00, The Blind SysAdmin

Date:   2025-02-24

## RELATED LINKS

[Online version: https://aces4all00.github.com/]()

[Online license: https://github.com/aces4all00/BlindSysAdmin.Helper/blob/main/LICENSE]()

[Online repository: https://github.com/aces4all00/BlindSysAdmin.Helper]()

