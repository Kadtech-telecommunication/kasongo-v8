$ErrorActionPreference = "Stop"

$root = "kasongo_v8"

# Root files
$files = @{
    "app.py" = ""
    "main.py" = ""
    "config.py" = ""
    "requirements.txt" = ""
    "README.md" = "# KASONGO V8`n`nAn Intelligent Multi-Strategy Trading Platform."
    ".env.example" = ""
    ".gitignore" = @"
__pycache__/
*.pyc
*.pyo
*.pyd
.env
.venv/
venv/
logs/
data/
.pytest_cache/
.vscode/
.idea/
"@
    "LICENSE" = ""
}

foreach ($file in $files.Keys) {
    $path = Join-Path $root $file
    Set-Content -Path $path -Value $files[$file] -Encoding UTF8
}

# Create __init__.py in every package
Get-ChildItem -Path (Join-Path $root "kasongo") -Directory -Recurse | ForEach-Object {
    New-Item -ItemType File -Force -Path (Join-Path $_.FullName "__init__.py") | Out-Null
}

New-Item -ItemType File -Force -Path (Join-Path $root "kasongo\__init__.py") | Out-Null

Write-Host ""
Write-Host "========================================="
Write-Host "   FOUNDATION FILES CREATED"
Write-Host "========================================="
