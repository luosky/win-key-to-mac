<#
  setup-repo.ps1 — initialize git and publish win-key-to-mac to GitHub.

  Requirements:
    - git        (https://git-scm.com/)
    - gh         (https://cli.github.com/)  — for the automatic repo creation

  Usage (run from inside the win-key-to-mac/ folder):
    powershell -ExecutionPolicy Bypass -File tools/setup-repo.ps1

  If `gh` is authenticated (gh auth login), the repo is created and pushed
  automatically. Otherwise the script sets up the local commit and prints the
  manual commands to publish yourself.
#>

$ErrorActionPreference = "Stop"
$repoName = "win-key-to-mac"
$commitMsg = "Initial commit: win-key-to-mac v1.0.0"

function Require-Command($name) {
    if (-not (Get-Command $name -ErrorAction SilentlyContinue)) {
        Write-Host "✗ '$name' was not found on PATH. Please install it and re-run." -ForegroundColor Red
        return $false
    }
    return $true
}

Write-Host "==> win-key-to-mac · GitHub publish helper" -ForegroundColor Cyan

if (-not (Require-Command git)) { exit 1 }

# 1. Initialize the repository (skip if already a repo)
if (-not (Test-Path .git)) {
    Write-Host "==> git init" -ForegroundColor Cyan
    git init -q
} else {
    Write-Host "==> git repo already initialized, reusing it." -ForegroundColor Yellow
}

# 2. Stage everything and commit
Write-Host "==> git add . && git commit" -ForegroundColor Cyan
git add .
$status = git status --porcelain
if ($status) {
    git commit -q -m $commitMsg
    Write-Host "    committed." -ForegroundColor Green
} else {
    Write-Host "    nothing new to commit." -ForegroundColor Yellow
}

git branch -M main

# 3. Try to publish via GitHub CLI
if (Require-Command gh) {
    $auth = & gh auth status 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "==> gh repo create $repoName --public --push" -ForegroundColor Cyan
        & gh repo create $repoName --public --source=. --remote=origin --push
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Published! https://github.com/$(gh api user --jq .login)/$repoName" -ForegroundColor Green
            exit 0
        } else {
            Write-Host "  gh repo create failed; falling back to manual steps." -ForegroundColor Yellow
        }
    } else {
        Write-Host "  gh is installed but not authenticated. Run 'gh auth login' or use the manual steps below." -ForegroundColor Yellow
    }
} else {
    Write-Host "  GitHub CLI (gh) not found — using manual steps." -ForegroundColor Yellow
}

# 4. Manual fallback
Write-Host ""
Write-Host "==> Manual publish steps:" -ForegroundColor Cyan
Write-Host "   1. Create a repo named '$repoName' at https://github.com/new (do NOT add a README)."
Write-Host "   2. Run these commands:"
Write-Host "        git remote add origin https://github.com/<your-username>/$repoName.git" -ForegroundColor White
Write-Host "        git push -u origin main" -ForegroundColor White
