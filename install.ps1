# YAM — Yet Another Manager
# Windows One-Command Installer (PowerShell)
#
# Usage:
#   irm https://raw.githubusercontent.com/MillenniumEarl/YAM/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

$repo    = "MillenniumEarl/YAM"
$apiUrl  = "https://api.github.com/repos/$repo/releases/latest"
$appName = "YAM"

# ── Banner ────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "  ██╗   ██╗ █████╗ ███╗   ███╗" -ForegroundColor Cyan
Write-Host "  ╚██╗ ██╔╝██╔══██╗████╗ ████║" -ForegroundColor Cyan
Write-Host "   ╚████╔╝ ███████║██╔████╔██║" -ForegroundColor Cyan
Write-Host "    ╚██╔╝  ██╔══██║██║╚██╔╝██║" -ForegroundColor Cyan
Write-Host "     ██║   ██║  ██║██║ ╚═╝ ██║" -ForegroundColor Cyan
Write-Host "     ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Yet Another Manager — F95Zone Game Updater" -ForegroundColor White
Write-Host "  github.com/$repo" -ForegroundColor DarkGray
Write-Host ""

# ── Fetch latest release info ─────────────────────────────────────────────────

Write-Host "[1/3] " -NoNewline -ForegroundColor DarkGray
Write-Host "Fetching latest release..." -ForegroundColor White

try {
    $release = Invoke-RestMethod -Uri $apiUrl -Headers @{ "User-Agent" = "YAM-Installer" }
} catch {
    Write-Host "[!] Could not reach GitHub API. Check your internet connection." -ForegroundColor Red
    exit 1
}

$version = $release.tag_name
Write-Host "      Found: $appName $version" -ForegroundColor Green

# Find Windows installer asset
$asset = $release.assets | Where-Object { $_.name -match "\.exe$" -and $_.name -notmatch "Setup" } | Select-Object -First 1
if (-not $asset) {
    $asset = $release.assets | Where-Object { $_.name -match "Setup.*\.exe$" -or $_.name -match "\.exe$" } | Select-Object -First 1
}

if (-not $asset) {
    Write-Host "[!] No Windows installer found in release $version." -ForegroundColor Red
    Write-Host "    Please download manually from: https://github.com/$repo/releases/latest" -ForegroundColor Yellow
    exit 1
}

$downloadUrl = $asset.browser_download_url
$installerName = $asset.name

# ── Download ──────────────────────────────────────────────────────────────────

$tempDir  = [System.IO.Path]::GetTempPath()
$destFile = Join-Path $tempDir $installerName

Write-Host ""
Write-Host "[2/3] " -NoNewline -ForegroundColor DarkGray
Write-Host "Downloading $installerName..." -ForegroundColor White
Write-Host "      From: $downloadUrl" -ForegroundColor DarkGray

try {
    $webClient = New-Object System.Net.WebClient
    $webClient.Headers.Add("User-Agent", "YAM-Installer")
    
    # Progress tracking
    $downloadComplete = $false
    $webClient.DownloadProgressChanged += {
        param($s, $e)
        $pct = $e.ProgressPercentage
        $recv = [math]::Round($e.BytesReceived / 1MB, 1)
        $total = [math]::Round($e.TotalBytesToReceive / 1MB, 1)
        Write-Host "`r      $pct% ($recv MB / $total MB)   " -NoNewline -ForegroundColor Cyan
    }
    $webClient.DownloadFileCompleted += { $downloadComplete = $true }
    $webClient.DownloadFileAsync([Uri]$downloadUrl, $destFile)
    
    while (-not $downloadComplete) { Start-Sleep -Milliseconds 200 }
    Write-Host ""
    Write-Host "      Downloaded to: $destFile" -ForegroundColor Green
} catch {
    # Fallback: simple download
    Write-Host "      (Switching to simple download...)" -ForegroundColor DarkGray
    Invoke-WebRequest -Uri $downloadUrl -OutFile $destFile -UseBasicParsing
    Write-Host "      Downloaded." -ForegroundColor Green
}

# ── Install ───────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "[3/3] " -NoNewline -ForegroundColor DarkGray
Write-Host "Launching installer..." -ForegroundColor White
Write-Host "      Follow the on-screen prompts." -ForegroundColor DarkGray
Write-Host ""

Start-Process -FilePath $destFile -Wait

# ── Done ──────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "  ✓ YAM $version installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "  Get started:" -ForegroundColor White
Write-Host "    • Launch YAM from the Start Menu or Desktop shortcut" -ForegroundColor DarkGray
Write-Host "    • Log in with your F95Zone account" -ForegroundColor DarkGray
Write-Host "    • Add games via folder or F95Zone URL" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Docs & support: https://github.com/$repo" -ForegroundColor DarkGray
Write-Host ""

# Cleanup
Remove-Item $destFile -ErrorAction SilentlyContinue
