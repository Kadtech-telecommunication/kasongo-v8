# ============================================
# KASONGO V8 Project Generator
# ============================================

$Project = "KASONGO_V8"

# Create Project Root
New-Item -ItemType Directory -Path $Project -Force | Out-Null

# Root Files
@(
    "main.py",
    "config.py",
    "requirements.txt",
    "README.md"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\$_" -Force | Out-Null
}

# Folders
$folders = @(
    "core",
    "market",
    "strategies",
    "strategies\crt",
    "strategies\ict",
    "strategies\smc",
    "strategies\price_action",
    "strategies\supply_demand",
    "strategies\wyckoff",
    "analysis",
    "risk",
    "execution",
    "scanner",
    "backtesting",
    "learning",
    "journal",
    "alerts",
    "dashboard",
    "dashboard\templates",
    "dashboard\static",
    "database",
    "data",
    "data\history",
    "data\trades",
    "data\models",
    "data\settings",
    "logs",
    "tests"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path "$Project\$folder" -Force | Out-Null
}

# Python __init__.py files
$pythonPackages = @(
    "core",
    "market",
    "strategies",
    "strategies\crt",
    "strategies\ict",
    "strategies\smc",
    "strategies\price_action",
    "strategies\supply_demand",
    "strategies\wyckoff",
    "analysis",
    "risk",
    "execution",
    "scanner",
    "backtesting",
    "learning",
    "journal",
    "alerts",
    "dashboard",
    "database",
    "tests"
)

foreach ($pkg in $pythonPackages) {
    New-Item -ItemType File -Path "$Project\$pkg\__init__.py" -Force | Out-Null
}

# Core Files
$coreFiles = @(
    "application.py",
    "menu.py",
    "banner.py",
    "settings.py",
    "logger.py",
    "database.py",
    "constants.py",
    "utils.py"
)

foreach ($file in $coreFiles) {
    New-Item -ItemType File -Path "$Project\core\$file" -Force | Out-Null
}

# Market Files
$marketFiles = @(
    "mt5_connector.py",
    "symbols.py",
    "timeframes.py",
    "data_loader.py",
    "sessions.py"
)

foreach ($file in $marketFiles) {
    New-Item -ItemType File -Path "$Project\market\$file" -Force | Out-Null
}

# Strategy Files
New-Item -ItemType File -Path "$Project\strategies\base_strategy.py" -Force | Out-Null
New-Item -ItemType File -Path "$Project\strategies\strategy_loader.py" -Force | Out-Null

foreach ($strategy in @("crt","ict","smc","price_action","supply_demand","wyckoff")) {
    New-Item -ItemType File -Path "$Project\strategies\$strategy\engine.py" -Force | Out-Null
}

# Analysis Files
@(
    "market_structure.py",
    "trend.py",
    "liquidity.py",
    "order_blocks.py",
    "fair_value_gap.py",
    "support_resistance.py",
    "volatility.py"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\analysis\$_" -Force | Out-Null
}

# Risk Files
@(
    "account.py",
    "position_sizer.py",
    "risk_manager.py",
    "drawdown.py",
    "exposure.py"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\risk\$_" -Force | Out-Null
}

# Execution Files
@(
    "signals.py",
    "trade_executor.py",
    "trade_manager.py",
    "safety_manager.py"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\execution\$_" -Force | Out-Null
}

# Scanner
New-Item -ItemType File -Path "$Project\scanner\live_scanner.py" -Force | Out-Null
New-Item -ItemType File -Path "$Project\scanner\watchlist.py" -Force | Out-Null

# Backtesting
@(
    "engine.py",
    "simulator.py",
    "reports.py",
    "optimizer.py"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\backtesting\$_" -Force | Out-Null
}

# Learning
@(
    "learner.py",
    "analytics.py",
    "recommendations.py",
    "ai_coach.py"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\learning\$_" -Force | Out-Null
}

# Journal
New-Item -ItemType File -Path "$Project\journal\trade_logger.py" -Force | Out-Null
New-Item -ItemType File -Path "$Project\journal\performance.py" -Force | Out-Null

# Alerts
@(
    "telegram.py",
    "email.py",
    "notifications.py"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\alerts\$_" -Force | Out-Null
}

# Dashboard
@(
    "app.py",
    "api.py"
) | ForEach-Object {
    New-Item -ItemType File -Path "$Project\dashboard\$_" -Force | Out-Null
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "   KASONGO V8 Project Created Successfully" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Project Location: $Project"
Write-Host ""