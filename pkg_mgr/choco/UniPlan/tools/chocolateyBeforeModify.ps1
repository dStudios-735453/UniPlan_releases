$ErrorActionPreference = 'Stop'

$processName = 'UniPlan'

if (Get-Process -Name $processName -ErrorAction SilentlyContinue) {
    Write-Output "Chocolatey: Closing running instances of $processName before package modification..."
    Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
}
