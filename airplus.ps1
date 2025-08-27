param(
    [string]$command
)

if ($command -eq "deploy") {
    Write-Host "Connecting to Linux server and executing deploy.sh..."
    ssh malekipourdev@airplus.local "cd ~/projects/airplus && ./deploy.sh"
    Write-Host "Deployment finished."
} else {
    Write-Host "Unknown command: $command"
    Write-Host "Available commands: deploy"
}

