# BlindSysAdmin.Helper

CollectionHelper functions.

## Description

The BlindSysAdmin.Helper module is a collection functions I use with multiple tools.

## Current helps

### New-RandomPassword

Generates string of randomly generated characters.

### New-UniqueUserName

Adds string of characters to base username to help make it unique.

### Start-MinRMCim

Uses `CIM` to start `WinRM` (`WSMan`) service on remote Windows computers.

### Stop-WinRMCin

Uses `CIM` to stop `WinRM` (`WSMan`) service on remote Windows computers.

### Test-IsWindows

Simple test to check is PowerShell is running on Windows. Useful for cross platform scripts that may run on computers with older versions of PowerShell.

## Upcoming changes

2025-02-24: I am in the process of reviewing, organizing, and updating scripts I've written in PowerShell, and other languages, over the last 3 decades or so. Where it makes sense, I will be moving helper functions (and other scripted tools) that multiple other module depend on here &mdash; or somewhere similar. This module will mostly contain platform independent and cross platform helpers. Platform specific helpers will be collected in (or moved to) platform specific modules.