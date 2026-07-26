$ErrorActionPreference = "Stop"

$root = "kasongo_v8"

$folders = @(
    "",
    "kasongo",
    "kasongo\core",
    "kasongo\market",
    "kasongo\analysis",
    "kasongo\strategies",
    "kasongo\strategies\crt",
    "kasongo\strategies\ict",
    "kasongo\strategies\smc",
    "kasongo\strategies\price_action",
    "kasongo\strategies\supply_demand",
    "kasongo\strategies\wyckoff",
    "kasongo\ai",
    "kasongo\signals",
    "kasongo\risk",
    "kasongo\execution",
    "kasongo\scanner",
    "kasongo\learning",
    "kasongo\backtesting",
    "kasongo\analytics",
    "kasongo\notifications",
    "kasongo\dashboard",
    "kasongo\api",
    "kasongo\journal",
    "kasongo\database",
    "kasongo\auth",
    "kasongo\subscriptions",
    "kasongo\utils",
    "tests",
    "docs",
    "logs",
    "data"
)

foreach ($folder in $folders) {
    $path = Join-Path $root $folder
    New-Item -ItemType Directory -Force -Path $path | Out-Null
}

Write-Host ""
Write-Host "========================================="
Write-Host "     KASONGO V8 STRUCTURE CREATED"
Write-Host "========================================="
Write-Host "Location: $(Resolve-Path $root)"
