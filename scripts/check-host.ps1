$ErrorActionPreference = "Continue"

function Check-Command($name) {
  $command = Get-Command $name -ErrorAction SilentlyContinue
  if ($command) {
    Write-Host "[OK] $name -> $($command.Source)" -ForegroundColor Green
  } else {
    Write-Host "[FALTA] $name" -ForegroundColor Yellow
  }
}

Check-Command "docker"
Check-Command "code"
Check-Command "git"
docker --version
wsl --status

