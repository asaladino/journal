$Folder = $env:JOURNAL_FOLDER;
$App = $env:JOURNAL_APP;
$Entry = '';

if ($Folder) {
    Write-Output "Opening $Folder";
    $Today = Get-Date
    $Year = $Today.Year
    $Month = $Today.Month.ToString().PadLeft(2, '0')
    $Day = $Today.Day.ToString().PadLeft(2, '0')
    $Filename = "$($Year)-$($Month)-$($Day)"
    
    if (-not (Test-Path "$($Folder)\$($Year)")) {
        Write-Output "Creating folder: $($Folder)\$($Year)"
        New-Item "$($Folder)\$($Year)" -ItemType "directory"
    }
    
    if (-not (Test-Path "$($Folder)\$($Year)\$($Month)")) {
        Write-Output "Creating folder: $($Folder)\$($Year)\$($Month)"
        New-Item "$($Folder)\$($Year)\$($Month)" -ItemType "directory"
    }
    $Entry = "$($Folder)\$($Year)\$($Month)\$($Filename).md";
    if (-not (Test-Path $Entry)) {
        Write-Output "Creating: $Entry"
        New-Item $Entry
    }
}
else {
    Write-Output "Create an environment variable `JOURNAL_FOLDER` and set it to your journal destination folder.";
}

if ($App) {
    Write-Output "Launching $App $Entry";
    start "$App";
}
else {
    Write-Output "Create an environment variable `JOURNAL_APP` and set it to the location of your journal app.";
}
