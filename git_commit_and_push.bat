@echo off

:: 初始化Git仓库脚本
echo 开始初始化Git仓库...
echo.

:: 检查是否已在Git仓库中
if exist .git (
    echo 仓库已初始化！
) else (
    echo 初始化新仓库...
    git init
    if %errorlevel% neq 0 (
        echo 错误：Git未正确安装或未配置环境变量。请参考git_github_setup_guide.md
        pause
        exit /b 1
    )
    echo 仓库初始化成功！
)

echo.
echo 配置用户信息（请手动执行以下命令）：
echo git config --global user.name "您的GitHub用户名"
echo git config --global user.email "您的GitHub邮箱"
echo.

:: 添加文件到暂存区
echo 添加文件到暂存区...
git add .
if %errorlevel% neq 0 (
    echo 错误：添加文件失败。
    pause
    exit /b 1
)

echo 暂存成功！

echo.
:: 提交到本地仓库
echo 提交到本地仓库...
git commit -m "Initial commit: IT岗位求职记录系统"
if %errorlevel% neq 0 (
    echo 错误：提交失败。
    pause
    exit /b 1
)

echo 提交成功！

echo.
:: 提示关联远程仓库
echo 请手动执行以下命令关联GitHub仓库：
echo git remote add origin https://github.com/您的GitHub用户名/it-job-application-system.git
echo.
echo 然后执行推送：
echo git push -u origin main
echo.
echo 注意：首次推送时需要输入GitHub用户名和个人访问令牌。
echo 请参考git_github_setup_guide.md了解如何生成个人访问令牌。

echo.
echo Git初始化完成！请按提示操作完成GitHub推送。
pause