@echo off

:: 设置命令行编码为UTF-8
chcp 65001 > nul

:: 推送代码到GitHub脚本
echo 开始推送代码到GitHub...
echo.

:: 检查Git是否已安装
where git > nul 2> nul
if %errorlevel% neq 0 (
    echo 错误：未找到Git。请确保Git已正确安装。
    echo 安装完成后，请将Git的bin目录添加到系统环境变量Path中。
    echo 通常路径为：C:\Program Files\Git\bin 和 C:\Program Files\Git\cmd
    pause
    exit /b 1
)

echo Git已正确安装！

:: 检查是否已关联远程仓库
git remote | findstr "origin" > nul 2> nul
if %errorlevel% equ 0 (
    echo 远程仓库origin已存在，正在更新...
    git remote set-url origin https://github.com/dahais4c/it-job-application-system.git
    if %errorlevel% neq 0 (
        echo 警告：更新远程仓库URL失败，但将继续尝试推送。
    ) else (
        echo 远程仓库URL更新成功！
    )
) else (
    echo 关联GitHub仓库...
    git remote add origin https://github.com/dahais4c/it-job-application-system.git
    if %errorlevel% neq 0 (
        echo 错误：关联仓库失败。
        echo 解决方案：
        echo 1. 确保Git环境变量配置正确
        echo 2. 尝试使用Git Bash运行此脚本
        echo 3. 检查GitHub仓库URL是否正确
        pause
        exit /b 1
    )
    
    echo 仓库关联成功！
)

echo.
echo 设置主分支名称...
git branch -M main
if %errorlevel% neq 0 (
    echo 错误：设置分支名称失败。
    pause
    exit /b 1
)

echo 分支设置成功！

echo.
echo 推送代码到GitHub...
echo 重要提示：GitHub现在需要使用个人访问令牌(PAT)代替密码！
echo 如何生成个人访问令牌：
echo 1. 登录GitHub，点击右上角头像 -> Settings -> Developer settings

echo 2. 点击Personal access tokens -> Tokens (classic)
echo 3. 点击Generate new token -> Generate new token (classic)
echo 4. 输入描述，选择适当的过期时间
echo 5. 勾选repo权限（至少需要这个权限）
echo 6. 点击Generate token，然后复制生成的令牌
echo 7. 在下面的凭据提示中，用户名输入您的GitHub用户名
echo 8. 密码输入刚才复制的个人访问令牌
echo.
echo 正在推送代码，请准备输入凭据...

:: 使用Git推送代码
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo 错误：推送失败。可能的原因：
    echo 1. 凭据错误 - 请确保使用正确的GitHub用户名和个人访问令牌
    echo 2. 网络连接问题 - 请检查网络连接
    echo 3. 仓库权限问题 - 请确认您有权限访问该仓库
    echo.
    echo 推荐解决方案：
    echo 1. 打开Git Bash（开始菜单搜索Git Bash）
    echo 2. 在Git Bash中执行：cd c:\Users\kj\Desktop\th
    echo 3. 然后执行：git push -u origin main
    echo 4. 在Git Bash中输入凭据更可靠
    echo.
    echo 或者使用以下方式手动推送：
    echo 1. 打开浏览器访问 https://github.com/dahais4c/it-job-application-system
    echo 2. 按照GitHub的网页指引上传文件
    pause
    exit /b 1
)

echo.
echo 代码推送成功！您的项目已成功上传到GitHub。
echo.
echo 接下来您可以：
echo 1. 访问 https://github.com/dahais4c/it-job-application-system 查看您的仓库

echo 2. 在Trae IDE中克隆此仓库进行管理：
echo    - 点击File > Clone Repository
echo    - 输入仓库URL：https://github.com/dahais4c/it-job-application-system.git
echo    - 选择本地路径并点击Clone
echo 3. 使用标准Git命令进行后续操作：
echo    - git pull origin main  # 拉取最新代码

echo    - git add .  # 添加新更改

echo    - git commit -m "描述更改"  # 提交更改

echo    - git push origin main  # 推送更改
echo.
echo 任务完成！

pause