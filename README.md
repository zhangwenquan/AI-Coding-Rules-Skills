# AI-Coding-Rules-Skills

共享 Trae IDE 的全局 Skills 和 Rules。

## 快速开始

### 新电脑安装

在 PowerShell 中运行：

```powershell
# 创建 .trae 目录（如果不存在）
mkdir $env:USERPROFILE\.trae -ErrorAction SilentlyContinue

# 进入目录
cd $env:USERPROFILE\.trae

# 初始化 git 并拉取
git init
git remote add origin https://github.com/zhangwenquan/AI-Coding-Rules-Skills.git
git fetch origin
git checkout -b main --track origin/main
```

或者一行命令：
```powershell
mkdir $env:USERPROFILE\.trae -ErrorAction SilentlyContinue; cd $env:USERPROFILE\.trae; git init; git remote add origin https://github.com/zhangwenquan/AI-Coding-Rules-Skills.git; git fetch origin; git checkout -b main --track origin/main
```

### 更新

```powershell
cd $env:USERPROFILE\.trae
git pull
```

## 目录结构

```
.trae/
├── builtin/global/skills/    # 全局 Skills
├── rules/                     # 全局 Rules
├── builtin_skills/            # 内置 Skills（可选）
├── argv.json                  # 本地配置（不提交）
└── extensions/                # 本地扩展（不提交）
```

## 安全说明

以下文件被 `.gitignore` 排除，不会被提交到仓库：
- `argv.json` - 本地配置
- `extensions/` - 本地安装的扩展
- `builtin/` - Trae 自动生成的内置文件

## 添加新的 Skill

1. 在 `.trae` 目录中创建或修改 skill
2. 提交到仓库：
```powershell
cd $env:USERPROFILE\.trae
git add .
git commit -m "添加新 skill"
git push
```
