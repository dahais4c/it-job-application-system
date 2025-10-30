@echo off

:: 推送代码到GitHub脚本
echo 开始推送代码到GitHub...
echo.

:: 关联远程仓库
echo 关联GitHub仓库...
git remote add origin https://github.com/dahais4c/it-job-application-system.git
if %errorlevel% neq 0 (
    echo 错误：关联仓库失败。请确保Git已正确安装并配置环境变量。
    echo 或者尝试使用Git Bash运行此脚本。
    pause
    exit /b 1
)

echo 仓库关联成功！

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
echo 请在弹出的凭据窗口中输入您的GitHub用户名和个人访问令牌
git push -u origin main
if %errorlevel% neq 0 (
    echo 错误：推送失败。请检查网络连接和凭据是否正确。
    echo 提示：GitHub现在需要使用个人访问令牌(PAT)代替密码。
    pause
    exit /b 1
)

echo.
echo 代码推送成功！您的项目已成功上传到GitHub。
echo 可以访问 https://github.com/dahais4c/it-job-application-system 查看您的仓库。

pause