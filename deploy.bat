@echo off
REM ScamRadar Deployment Script for Windows
REM This script helps automate the deployment process

echo 🚀 ScamRadar Deployment Script
echo ================================

REM Check if we're in the right directory
if not exist "README.md" (
    echo ❌ Please run this script from the ScamRadar root directory
    exit /b 1
)

if not exist "Backend" (
    echo ❌ Backend directory not found
    exit /b 1
)

if not exist "Frontend" (
    echo ❌ Frontend directory not found
    exit /b 1
)

echo ✅ Starting deployment preparation...

REM Step 1: Install Backend Dependencies
echo.
echo 📦 Installing Backend Dependencies...
cd Backend
call npm install
if %ERRORLEVEL% neq 0 (
    echo ❌ Failed to install backend dependencies
    exit /b 1
)
echo ✅ Backend dependencies installed successfully

REM Step 2: Install Frontend Dependencies
echo.
echo 📦 Installing Frontend Dependencies...
cd ..\Frontend
call npm install
if %ERRORLEVEL% neq 0 (
    echo ❌ Failed to install frontend dependencies
    exit /b 1
)
echo ✅ Frontend dependencies installed successfully

REM Step 3: Build Frontend
echo.
echo 🏗️ Building Frontend...
call npm run build
if %ERRORLEVEL% neq 0 (
    echo ❌ Frontend build failed
    exit /b 1
)
echo ✅ Frontend built successfully

REM Step 4: Git preparation
echo.
echo 📝 Preparing Git repository...
cd ..
git add .
git commit -m "Prepare for deployment: Add production configs and build assets"
git push origin main
echo ✅ Code pushed to GitHub

echo.
echo 🎉 Deployment Preparation Complete!
echo.
echo Next Steps:
echo 1. 🔗 Deploy Backend to Render: https://render.com/
echo 2. 🌐 Deploy Frontend to Vercel: https://vercel.com/
echo 3. 🔑 Configure environment variables on both platforms
echo 4. 🧪 Test your deployed application
echo.
echo 📚 Check the docs/ folder for detailed deployment guides

pause
