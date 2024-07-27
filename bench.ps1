Write-Host "Running Rust project..."
Set-Location -Path .\rust
$RustOutput = cargo run -r 2>&1
$RustTime = $RustOutput | Select-String "Elapsed time:" | ForEach-Object { $_.ToString() -replace 'Elapsed time: ([0-9.]+).*','$1' }

if ([string]::IsNullOrEmpty($RustTime)) {
    $RustTime = "Error: Time not found"
}

Write-Host "Running Go project..."
Set-Location -Path ..\golang
$GoOutput = go run main.go -ldflags="-s -w" 2>&1
$GoTime = $GoOutput | Select-String "Elapsed time:" | ForEach-Object { $_.ToString() -replace 'Elapsed time: ([0-9.]+).*','$1' }

if ([string]::IsNullOrEmpty($GoTime)) {
    $GoTime = "Error: Time not found"
}

Write-Host ("Project".PadRight(20) + "Execution Time (s)")
Write-Host ("Rust".PadRight(20) + $RustTime.PadRight(20))
Write-Host ("Go".PadRight(20) + $GoTime.PadRight(20))