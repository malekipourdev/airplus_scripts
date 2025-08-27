# نصب و راه‌اندازی airplus CLI برای کاربر ویندوز

Write-Host ">>> Installing Airplus CLI..."

# مسیر پروفایل PowerShell کاربر
$profilePath = $PROFILE

# مطمئن شو پروفایل وجود داره
if (-Not (Test-Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force | Out-Null
}

# مسیر اسکریپت اصلی airplus.ps1
$scriptPath = "$PSScriptRoot\airplus.ps1"

# محتوای function رو تو پروفایل اضافه کن (اگر قبلا نبود)
$functionDef = "function airplus { param(`$cmd) & `"$scriptPath`" `$cmd }"
if (-Not (Get-Content $profilePath | Select-String "function airplus")) {
    Add-Content -Path $profilePath -Value $functionDef
    Write-Host "Airplus function added to profile."
} else {
    Write-Host "Airplus function already exists in profile."
}

Write-Host ">>> Installation complete. Restart PowerShell and run: airplus deploy"
