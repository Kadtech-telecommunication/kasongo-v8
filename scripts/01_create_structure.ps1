# ============================================================
# KASONGO V8
# Part 1 - Create Project Structure
# ============================================================

$ErrorActionPreference = "Stop"

$ProjectName = "KASONGO_V8"

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " KASONGO V8 - Creating Project Structure" -ForegroundColor Yellow
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

# Create Project Root
if (!(Test-Path $ProjectName)) {
    New-Item -ItemType Directory -Path $ProjectName | Out-Null
    Write-Host "[OK] Project Root Created"
}
else {
    Write-Host "[OK] Project Root Already Exists"
}

# Main Package
$PackageFolders = @(
    "kasongo",
    "kasongo\config",
    "kasongo\core",
    "kasongo\core\commands",
    "kasongo\market",
    "kasongo\analysis",
    "kasongo\strategies",
    "kasongo\strategies\crt",
    "kasongo\strategies\ict",
    "kasongo\strategies\smc",
    "kasongo\strategies\price_action",
    "kasongo\strategies\supply_demand",
    "kasongo\strategies\wyckoff",
    "kasongo\risk",
    "kasongo\execution",
    "kasongo\scanner",
    "kasongo\backtesting",
    "kasongo\learning",
    "kasongo\journal",
    "kasongo\alerts",
    "kasongo\dashboard",
    "kasongo\dashboard\templates",
    "kasongo\dashboard\static",
    "kasongo\ai",
    "kasongo\plugins",
    "kasongo\utils"
)

foreach ($folder in $PackageFolders) {

    $path = Join-Path $ProjectName $folder

    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
    }

    Write-Host "[OK] $folder"
}

# Root Project Folders
$RootFolders = @(
    "data",
    "data\history",
    "data\trades",
    "data\models",
    "database",
    "docs",
    "logs",
    "tests",
    "resources",
    "resources\icons",
    "resources\images",
    "resources\sounds",
    "resources\themes",
    "profiles",
    "profiles\default",
    "profiles\aggressive",
    "profiles\conservative",
    "profiles\scalper",
    "profiles\swing",
    "scripts"
)

foreach ($folder in $RootFolders) {

    $path = Join-Path $ProjectName $folder

    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
    }

    Write-Host "[OK] $folder"
}

Write-Host ""
Write-Host "==============================================" -ForegroundColor Green
Write-Host " Project Structure Created Successfully" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""