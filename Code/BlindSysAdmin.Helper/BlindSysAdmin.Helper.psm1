Get-ChildItem -Path "$PSScriptRoot\Class" -Filter "*.ps1" | ForEach-Object {
    . $_.FullName
}

Get-ChildItem -Path "$PSScriptRoot\Private" -Filter "*.ps1" | ForEach-Object {
    . $_.FullName
}

$publicFunctionList = [System.Collections.Generic.List[System.String]]@()

Get-ChildItem -Path "$PSScriptRoot\Public" -Filter "*.ps1" | ForEach-Object {
    $publicFunctionList.Add($_.BaseName)
    . $_.FullName
}

Export-ModuleMember -Function $publicFunctionList