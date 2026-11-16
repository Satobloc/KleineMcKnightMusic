# Hyperflirt recursive audio inventory
# Scans D:\HYPERFLIRT and writes reports to your Documents folder.
# It does not modify, move, rename, or open the audio files.

$Root = "D:\HYPERFLIRT"
$OutputFolder = [Environment]::GetFolderPath("MyDocuments")

if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
    throw "Cannot find the source folder: $Root"
}
if (-not (Test-Path -LiteralPath $OutputFolder -PathType Container)) {
    New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
}

$AudioExtensions = @(
    ".wav", ".wave", ".aif", ".aiff", ".flac", ".ogg", ".opus",
    ".mp3", ".m4a", ".aac", ".wma", ".ape", ".alac"
)
$ArchiveExtensions = @(".zip", ".7z", ".rar", ".tar", ".gz")

Write-Host "Scanning $Root ..."
$allFiles = Get-ChildItem -LiteralPath $Root -Recurse -File -Force -ErrorAction SilentlyContinue

$audio = $allFiles | Where-Object {
    $AudioExtensions -contains $_.Extension.ToLowerInvariant()
} | ForEach-Object {
    $relative = $_.FullName.Substring($Root.TrimEnd('\').Length).TrimStart('\')
    [PSCustomObject]@{
        RelativePath = $relative
        Folder       = $_.DirectoryName
        Filename     = $_.Name
        Extension    = $_.Extension.ToLowerInvariant()
        SizeBytes    = $_.Length
        SizeMB       = [math]::Round($_.Length / 1MB, 3)
        Modified     = $_.LastWriteTime
    }
} | Sort-Object RelativePath

$archives = $allFiles | Where-Object {
    $ArchiveExtensions -contains $_.Extension.ToLowerInvariant()
} | ForEach-Object {
    $relative = $_.FullName.Substring($Root.TrimEnd('\').Length).TrimStart('\')
    [PSCustomObject]@{
        RelativePath = $relative
        Filename     = $_.Name
        Extension    = $_.Extension.ToLowerInvariant()
        SizeBytes    = $_.Length
        SizeMB       = [math]::Round($_.Length / 1MB, 3)
        Modified     = $_.LastWriteTime
    }
} | Sort-Object RelativePath

$folderSummary = $audio | Group-Object Folder | ForEach-Object {
    $totalBytes = ($_.Group | Measure-Object -Property SizeBytes -Sum).Sum
    [PSCustomObject]@{
        Folder       = $_.Name
        AudioFiles   = $_.Count
        TotalSizeMB  = [math]::Round($totalBytes / 1MB, 2)
        Extensions   = (($_.Group | Group-Object Extension | Sort-Object Name | ForEach-Object {
            "$($_.Name):$($_.Count)"
        }) -join "; ")
    }
} | Sort-Object Folder

$audioPath = Join-Path $OutputFolder "Hyperflirt_Audio_Inventory.csv"
$folderPath = Join-Path $OutputFolder "Hyperflirt_Folder_Summary.csv"
$archivePath = Join-Path $OutputFolder "Hyperflirt_Archive_Inventory.csv"

$audio | Export-Csv -LiteralPath $audioPath -NoTypeInformation -Encoding UTF8
$folderSummary | Export-Csv -LiteralPath $folderPath -NoTypeInformation -Encoding UTF8
$archives | Export-Csv -LiteralPath $archivePath -NoTypeInformation -Encoding UTF8

$totalMB = [math]::Round((($audio | Measure-Object -Property SizeBytes -Sum).Sum) / 1MB, 2)

Write-Host ""
Write-Host "COMPLETE"
Write-Host "Audio files: $($audio.Count)"
Write-Host "Audio size:  $totalMB MB"
Write-Host "Folders:     $($folderSummary.Count)"
Write-Host "Archives:    $($archives.Count)"
Write-Host ""
Write-Host "Reports saved to:"
Write-Host $audioPath
Write-Host $folderPath
Write-Host $archivePath
