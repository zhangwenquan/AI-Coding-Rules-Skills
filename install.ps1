# Trae Skills & Rules 安装/更新脚本
# 用法: ./install.ps1
# 功能: 将仓库中的 skills 和 rules 合并到 ~/.trae 目录（只覆盖同名文件，保留其他文件）

$ErrorActionPreference = "Stop"

$TraePath = Join-Path $env:USERPROFILE ".trae"
$RepoPath = $PSScriptRoot

Write-Host "=== Trae Skills & Rules Installer ===" -ForegroundColor Cyan
Write-Host "Repo: $RepoPath"
Write-Host "Target: $TraePath"
Write-Host ""

# 函数：递归合并目录（只覆盖同名文件，不删除目标中独有的文件）
function Merge-Directory {
    param(
        [string]$Source,
        [string]$Target
    )

    if (-not (Test-Path $Source)) {
        return
    }

    # 确保目标目录存在
    if (-not (Test-Path $Target)) {
        New-Item -ItemType Directory -Path $Target -Force | Out-Null
    }

    # 复制文件
    Get-ChildItem -Path $Source -File | ForEach-Object {
        $destFile = Join-Path $Target $_.Name
        Copy-Item -Path $_.FullName -Destination $destFile -Force
        Write-Host "  更新: $($_.Name)" -ForegroundColor DarkGray
    }

    # 递归处理子目录
    Get-ChildItem -Path $Source -Directory | ForEach-Object {
        $destDir = Join-Path $Target $_.Name
        Merge-Directory -Source $_.FullName -Target $destDir
    }
}

# 合并 .trae 目录下的所有内容
$SourceTrae = Join-Path $RepoPath ".trae"
if (Test-Path $SourceTrae) {
    Write-Host "合并 skills 和 rules..." -ForegroundColor Yellow
    Merge-Directory -Source $SourceTrae -Target $TraePath
} else {
    Write-Host "错误: 找不到 .trae 目录" -ForegroundColor Red
    exit 1
}

# 复制本安装脚本到 .trae 目录（方便后续更新）
$installScript = Join-Path $TraePath "install.ps1"
Copy-Item -Path $MyInvocation.MyCommand.Path -Destination $installScript -Force

Write-Host ""
Write-Host "=== 安装完成 ===" -ForegroundColor Green
Write-Host "重启 Trae 以应用更改"
Write-Host ""
Write-Host "后续更新方法:" -ForegroundColor Cyan
Write-Host "  cd `"$TraePath`"" -ForegroundColor DarkGray
Write-Host "  git pull" -ForegroundColor DarkGray
Write-Host "  ./install.ps1" -ForegroundColor DarkGray
