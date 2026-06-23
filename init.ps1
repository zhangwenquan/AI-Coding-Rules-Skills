# Trae Skills & Rules 初始化脚本
# 用法: 在新电脑上运行此脚本
# 此脚本会将 .trae 目录变成一个 git 仓库，并拉取共享的 skills 和 rules

$ErrorActionPreference = "Stop"
$TraePath = Join-Path $env:USERPROFILE ".trae"
$RepoUrl = "https://github.com/zhangwenquan/AI-Coding-Rules-Skills.git"

Write-Host "=== Trae Skills & Rules 初始化 ===" -ForegroundColor Cyan

# 检查 git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "错误: 需要安装 Git" -ForegroundColor Red
    exit 1
}

# 确保 .trae 目录存在
if (-not (Test-Path $TraePath)) {
    New-Item -ItemType Directory -Path $TraePath -Force | Out-Null
}

Push-Location $TraePath

# 检查是否已经是 git 仓库
if (Test-Path ".git") {
    Write-Host "已是 git 仓库，拉取更新..." -ForegroundColor Yellow
    git pull
} else {
    Write-Host "初始化 git 仓库..." -ForegroundColor Yellow
    git init
    git remote add origin $RepoUrl
    git fetch origin
    git checkout -b main --track origin/main
}

Pop-Location

Write-Host ""
Write-Host "=== 完成 ===" -ForegroundColor Green
Write-Host "Skills 和 Rules 已同步到 $TraePath"
Write-Host ""
Write-Host "后续更新: 在 $TraePath 目录运行 'git pull'"
