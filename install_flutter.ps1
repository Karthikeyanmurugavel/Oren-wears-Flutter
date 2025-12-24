$url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.38.3-stable.zip"
$zipPath = "$env:USERPROFILE\flutter.zip"
$extractPath = "$env:USERPROFILE"
$flutterBin = "$extractPath\flutter\bin"

Write-Host "Downloading Flutter using BITS..."
Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $zipPath

Write-Host "Extracting Flutter..."
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

Write-Host "Adding to PATH..."
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$flutterBin*") {
    $newPath = "$currentPath;$flutterBin"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    $env:Path += ";$flutterBin"
    Write-Host "Flutter added to PATH."
}
else {
    Write-Host "Flutter already in PATH."
    $env:Path += ";$flutterBin"
}

Write-Host "Verifying..."
flutter --version
