param(
    [string]$RemoteUrl
)

function Abort([string]$msg) {
    Write-Error $msg
    exit 1
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Abort 'git is not installed. Please install Git for Windows and run this script again.'
}

if (-not $RemoteUrl) {
    $RemoteUrl = Read-Host 'Enter GitHub remote URL (e.g. https://github.com/username/repo.git)'
}

if (-not $RemoteUrl) { Abort 'No remote URL provided.' }

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $scriptPath
Write-Host "Working directory: $(Get-Location)"

$inside = git rev-parse --is-inside-work-tree 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Initializing new git repository..."
    git init
} else {
    Write-Host "Repository already initialized."
}

git add .

$changes = git diff --cached --name-only
if ($changes) {
    git commit -m "Initial commit - Smart Exam Cell (add README, logo, fixes)"
    if ($LASTEXITCODE -ne 0) { Write-Host "Commit may have failed or already exists." }
} else {
    Write-Host "No changes to commit."
}

$existing = git remote get-url origin 2>$null
if ($existing) {
    Write-Host "Remote 'origin' already exists: $existing"
    $ans = Read-Host "Replace remote 'origin' with $RemoteUrl ? (y/N)"
    if ($ans -match '^[Yy]') {
        git remote remove origin
        git remote add origin $RemoteUrl
    } else {
        Write-Host "Keeping existing remote. Will attempt to push to it."
    }
} else {
    git remote add origin $RemoteUrl
}

git branch -M main

Write-Host "Pushing to $RemoteUrl (main)..."
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "Push successful."
} else {
    Write-Host "Push failed. If the remote contains commits you may need to pull or force push."
}
