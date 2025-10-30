# Git、GitHub和Trae代码管理完全指南

## 1. 配置Git环境变量（如果Git已安装但命令无法识别）

如果您已安装Git但在命令行中无法使用，请按照以下步骤配置环境变量：

1. 找到Git的安装路径（通常是 `C:\Program Files\Git\bin` 或 `C:\Program Files (x86)\Git\bin`）
2. 右键点击"此电脑" -> "属性" -> "高级系统设置" -> "环境变量"
3. 在"系统变量"中找到"Path"，点击"编辑"
4. 点击"新建"，添加Git的bin目录路径
5. 同样添加Git的cmd目录（通常是 `C:\Program Files\Git\cmd`）
6. 点击"确定"保存所有设置
7. 关闭所有命令行窗口，重新打开一个新的命令提示符或PowerShell

## 2. 验证Git安装

```bash
git --version
```

如果成功显示版本信息，则Git已正确安装和配置。

## 3. 配置Git用户信息

```bash
git config --global user.name "Your Name"  # 替换为您的GitHub用户名
git config --global user.email "your.email@example.com"  # 替换为您的GitHub邮箱
```

## 4. 初始化本地仓库（针对已有项目）

请在命令提示符或PowerShell中执行以下命令：

```bash
cd c:\Users\kj\Desktop\th
git init
git status  # 查看当前项目状态
git add .   # 添加所有文件到暂存区
git commit -m "Initial commit: IT岗位求职记录系统"  # 提交到本地仓库
```

## 5. 关联GitHub远程仓库

```bash
# 关联您已创建的GitHub仓库
git remote add origin https://github.com/YOUR_USERNAME/it-job-application-system.git  # 请替换YOUR_USERNAME为您的GitHub用户名

# 验证远程仓库设置
git remote -v
```

## 6. 推送到GitHub

```bash
# 首次推送，设置上游分支
git push -u origin main

# 推送时会提示输入GitHub用户名和密码或令牌
# 现在GitHub推荐使用个人访问令牌(Personal Access Token)作为密码
```

## 7. 生成个人访问令牌（PAT）

由于GitHub不再支持密码认证，建议创建个人访问令牌：

1. 登录GitHub
2. 点击右上角头像 -> Settings -> Developer settings -> Personal access tokens -> Tokens (classic)
3. 点击"Generate new token" -> "Generate new token (classic)"
4. 输入描述，选择适当的过期时间，勾选所需权限（至少需要repo权限）
5. 点击"Generate token"
6. 复制生成的令牌并保存（只显示一次）

## 8. 常见Git操作指南

### 克隆仓库
```bash
git clone https://github.com/YOUR_USERNAME/it-job-application-system.git
```

### 拉取更新
```bash
git pull origin main
```

### 推送新更改
```bash
git add .
git commit -m "描述您的更改"
git push origin main
```

### 查看提交历史
```bash
git log
```

## 9. 使用Git Bash

如果PowerShell仍然有问题，您可以使用Git自带的Git Bash：

1. 在开始菜单中搜索并打开"Git Bash"
2. 在Git Bash中执行上述所有命令

## 10. 项目文件说明

本项目已包含：
- 完整的Spring Boot后端代码
- 前端HTML页面
- 标准的.gitignore文件
- 详细的README.md文档
- 数据库配置文件

请确保在推送前已正确配置application.properties文件中的数据库连接信息，避免泄露敏感信息。

## 11. 使用Trae进行代码管理

Trae是一个强大的IDE，可以帮助您更高效地管理代码：

### 11.1 克隆仓库到Trae

1. 在Trae中点击"File" > "Clone Repository"
2. 输入仓库URL：`https://github.com/dahais4c/it-job-application-system.git`
3. 选择本地克隆路径
4. 点击"Clone"完成操作

### 11.2 使用Trae进行日常开发

- **拉取最新代码**：点击工具栏的"Pull"按钮或使用快捷键
- **提交更改**：
  1. 在Git面板中选择要提交的文件
  2. 输入提交信息
  3. 点击"Commit"按钮
- **推送代码**：点击工具栏的"Push"按钮
- **创建分支**：在Git面板中点击"Branches" > "New Branch"
- **合并分支**：在Git面板中选择目标分支，点击"Merge into Current Branch"

### 11.3 使用Trae解决合并冲突

当出现合并冲突时，Trae提供了直观的冲突解决界面：
1. 在有冲突的文件上右键点击
2. 选择"Resolve Conflicts"
3. 使用提供的界面选择保留哪一部分代码
4. 解决所有冲突后，标记文件为已解决
5. 提交合并结果

### 11.4 Trae中的Git操作快捷键

- **查看Git面板**：通常是Alt+9或点击左侧边栏的Git图标
- **提交更改**：Ctrl+K或Cmd+K
- **拉取代码**：Ctrl+T或Cmd+T
- **推送代码**：Ctrl+Shift+K或Cmd+Shift+K

## 12. 团队协作最佳实践

### 分支管理策略

1. **main分支**：用于生产环境的稳定代码
2. **develop分支**：用于开发整合，包含最新功能
3. **feature分支**：用于开发新功能
4. **bugfix分支**：用于修复bug

### 代码审查流程

1. 创建新分支进行开发
2. 完成开发后，在GitHub上创建Pull Request
3. 邀请团队成员进行代码审查
4. 审查通过后，合并到目标分支
5. 删除已完成的功能分支

### 提交信息规范

推荐使用以下格式的提交信息：

```
类型: 简短描述

详细描述（可选）

相关任务编号（可选）
```

其中类型可以是：
- feat: 新功能
- fix: 修复bug
- docs: 文档更新
- style: 代码风格调整
- refactor: 代码重构
- test: 测试相关
- chore: 构建过程或辅助工具变动

## 13. 常见问题解决

### 无法识别git命令
- 检查Git是否正确安装
- 确认环境变量配置正确
- 尝试使用Git Bash而不是PowerShell

### 推送失败提示权限错误
- 确保个人访问令牌有`repo`权限
- 检查远程仓库URL是否正确
- 验证GitHub用户名和令牌是否正确

### 合并冲突
- 使用`git status`查看冲突文件
- 在Trae中使用冲突解决工具解决冲突
- 解决后提交合并结果