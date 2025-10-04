@echo off
echo 🚀 Chef AI - Copy to GitHub Repository
echo.

REM Check if target directory exists
if not exist "..\chef-ai-backend" (
    echo ❌ Error: chef-ai-backend directory not found!
    echo Please clone your GitHub repository first:
    echo git clone https://github.com/yourusername/chef-ai-backend.git
    pause
    exit /b 1
)

echo ✅ Copying files to GitHub repository...

REM Copy source files
echo 📁 Copying src/ folder...
xcopy /E /I /Y src "..\chef-ai-backend\src"

REM Copy platform files
echo 📁 Copying android/ folder...
xcopy /E /I /Y android "..\chef-ai-backend\android"

echo 📁 Copying ios/ folder...
xcopy /E /I /Y ios "..\chef-ai-backend\ios"

REM Copy configuration files
echo 📄 Copying configuration files...
copy /Y App.tsx "..\chef-ai-backend\"
copy /Y package.json "..\chef-ai-backend\"
copy /Y babel.config.js "..\chef-ai-backend\"
copy /Y metro.config.js "..\chef-ai-backend\"
copy /Y index.js "..\chef-ai-backend\"

REM Copy documentation files
echo 📄 Copying documentation...
copy /Y *.md "..\chef-ai-backend\"

REM Copy test files
echo 📄 Copying test files...
copy /Y *.html "..\chef-ai-backend\"

echo.
echo ✅ Files copied successfully!
echo.
echo Next steps:
echo 1. Navigate to your repository: cd ..\chef-ai-backend
echo 2. Add files to git: git add .
echo 3. Commit changes: git commit -m "Initial Chef AI app"
echo 4. Push to GitHub: git push origin main
echo.
echo 🎉 Your Chef AI app will then sync to Lovable!
echo.
pause
