Write-Host "======================================="
Write-Host "     KASONGO V8 INSTALLER"
Write-Host "======================================="

& ".\scripts\01_create_structure.ps1"
& ".\scripts\02_create_files.ps1"
& ".\scripts\03_generate_boilerplate.ps1"
& ".\scripts\04_setup_environment.ps1"
& ".\scripts\05_build_database.ps1"
& ".\scripts\06_install_plugins.ps1"
& ".\scripts\07_verify_installation.ps1"

Write-Host ""
Write-Host "KASONGO V8 installation completed successfully."