# ============================================================
# KASONGO V8
# Part 2 - Create Project Files
# ============================================================

$ErrorActionPreference = "Stop"

$ProjectName = "KASONGO_V8"

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " KASONGO V8 - Creating Project Files" -ForegroundColor Yellow
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

# ------------------------------------------------------------
# Root Files
# ------------------------------------------------------------

$RootFiles = @(
    "main.py",
    "README.md",
    "requirements.txt",
    "LICENSE",
    "VERSION",
    ".gitignore"
)

foreach ($file in $RootFiles) {

    $path = Join-Path $ProjectName $file

    if (!(Test-Path $path)) {
        New-Item -ItemType File -Path $path | Out-Null
    }

    Write-Host "[OK] $file"
}

# ------------------------------------------------------------
# Python Packages (__init__.py)
# ------------------------------------------------------------

$Packages = @(
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
    "kasongo\learning",
    "kasongo\backtesting",
    "kasongo\journal",
    "kasongo\alerts",
    "kasongo\dashboard",
    "kasongo\ai",
    "kasongo\plugins",
    "kasongo\utils",
    "tests"
)

foreach ($pkg in $Packages) {

    $init = Join-Path $ProjectName ($pkg + "\__init__.py")

    if (!(Test-Path $init)) {
        New-Item -ItemType File -Path $init | Out-Null
    }

    Write-Host "[OK] $pkg\__init__.py"
}

# ------------------------------------------------------------
# Helper Function
# ------------------------------------------------------------

function Create-Files {

    param(
        [string]$Folder,
        [string[]]$Files
    )

    foreach ($file in $Files) {

        $path = Join-Path $ProjectName "$Folder\$file"

        if (!(Test-Path $path)) {
            New-Item -ItemType File -Path $path | Out-Null
        }

        Write-Host "[OK] $Folder\$file"
    }
}

# ------------------------------------------------------------
# Config
# ------------------------------------------------------------

Create-Files "kasongo\config" @(
    "app.py",
    "broker.py",
    "market.py",
    "risk.py",
    "strategy.py",
    "dashboard.py",
    "telegram.py",
    "learning.py",
    "backtesting.py",
    "logging.py"
)

# ------------------------------------------------------------
# Core
# ------------------------------------------------------------

Create-Files "kasongo\core" @(
    "application.py",
    "banner.py",
    "database.py",
    "exceptions.py",
    "logger.py",
    "menu.py",
    "router.py",
    "settings.py"
)

Create-Files "kasongo\core\commands" @(
    "live.py",
    "paper.py",
    "backtest.py",
    "strategy.py",
    "learning.py",
    "journal.py",
    "analytics.py",
    "settings.py"
)

# ------------------------------------------------------------
# Market
# ------------------------------------------------------------

Create-Files "kasongo\market" @(
    "mt5_connector.py",
    "account.py",
    "symbols.py",
    "timeframes.py",
    "sessions.py",
    "data_loader.py"
)

# ------------------------------------------------------------
# Analysis
# ------------------------------------------------------------

Create-Files "kasongo\analysis" @(
    "trend.py",
    "market_structure.py",
    "bos.py",
    "choch.py",
    "liquidity.py",
    "order_blocks.py",
    "fair_value_gap.py",
    "support_resistance.py",
    "volatility.py"
)

# ------------------------------------------------------------
# Strategies
# ------------------------------------------------------------

Create-Files "kasongo\strategies" @(
    "base_strategy.py",
    "strategy_loader.py"
)

$StrategyModules = @(
    "crt",
    "ict",
    "smc",
    "price_action",
    "supply_demand",
    "wyckoff"
)

foreach ($module in $StrategyModules) {
    Create-Files "kasongo\strategies\$module" @(
        "engine.py",
        "config.py"
    )
}

# ------------------------------------------------------------
# Risk
# ------------------------------------------------------------

Create-Files "kasongo\risk" @(
    "account.py",
    "position_sizer.py",
    "risk_manager.py",
    "drawdown.py",
    "exposure.py"
)

# ------------------------------------------------------------
# Execution
# ------------------------------------------------------------

Create-Files "kasongo\execution" @(
    "signals.py",
    "trade_executor.py",
    "trade_manager.py",
    "safety_manager.py"
)

# ------------------------------------------------------------
# Scanner
# ------------------------------------------------------------

Create-Files "kasongo\scanner" @(
    "live_scanner.py",
    "watchlist.py"
)

# ------------------------------------------------------------
# Backtesting
# ------------------------------------------------------------

Create-Files "kasongo\backtesting" @(
    "engine.py",
    "simulator.py",
    "optimizer.py",
    "reports.py"
)

# ------------------------------------------------------------
# Learning
# ------------------------------------------------------------

Create-Files "kasongo\learning" @(
    "learner.py",
    "analytics.py",
    "recommendations.py",
    "ai_coach.py"
)

# ------------------------------------------------------------
# Journal
# ------------------------------------------------------------

Create-Files "kasongo\journal" @(
    "trade_logger.py",
    "performance.py"
)

# ------------------------------------------------------------
# Alerts
# ------------------------------------------------------------

Create-Files "kasongo\alerts" @(
    "telegram.py",
    "email.py",
    "notifications.py"
)

# ------------------------------------------------------------
# Dashboard
# ------------------------------------------------------------

Create-Files "kasongo\dashboard" @(
    "app.py",
    "api.py"
)

# ------------------------------------------------------------
# AI
# ------------------------------------------------------------

Create-Files "kasongo\ai" @(
    "models.py",
    "predictor.py",
    "optimizer.py",
    "trainer.py"
)

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " Project Files Created Successfully" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green