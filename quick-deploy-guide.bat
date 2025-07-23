@echo off
REM Quick Deployment Guide for Vercel + Render
REM Run this after completing the deployment preparation

echo.
echo 🚀 ScamRadar - Vercel + Render Deployment Guide
echo ===============================================
echo.

echo 📋 Deployment Order:
echo 1. Backend to Render (get URL first)
echo 2. Frontend to Vercel (using backend URL)
echo 3. Update backend with frontend URL
echo 4. Test integration
echo.

echo 🔗 STEP 1: Deploy Backend to Render
echo -------------------------------------
echo 1. Go to: https://render.com/
echo 2. Sign up with GitHub
echo 3. New ^> Web Service
echo 4. Connect your ScamRadar repository
echo 5. Configure:
echo    - Name: scamradar-backend
echo    - Root Directory: Backend
echo    - Build Command: npm install
echo    - Start Command: npm start
echo 6. Add environment variables (see docs/external-services-setup-detailed.md)
echo 7. Deploy and get your URL (e.g., https://scamradar-backend.onrender.com)
echo.

pause

echo.
echo 🌐 STEP 2: Deploy Frontend to Vercel
echo ------------------------------------
echo 1. Go to: https://vercel.com/
echo 2. Sign up with GitHub
echo 3. New Project ^> Import from GitHub
echo 4. Select ScamRadar repository
echo 5. Configure:
echo    - Framework: Vite
echo    - Root Directory: Frontend
echo    - Build Command: npm run build
echo    - Output Directory: dist
echo 6. Add environment variables:
echo    - VITE_API_BASE_URL: [Your Render backend URL]
echo    - VITE_GOOGLE_CLIENT_ID: [Your Google OAuth Client ID]
echo    - VITE_APP_NAME: ScamRadar
echo    - VITE_APP_VERSION: 1.0.0
echo 7. Deploy and get your URL (e.g., https://scamradar.vercel.app)
echo.

pause

echo.
echo 🔄 STEP 3: Update Backend Configuration
echo --------------------------------------
echo 1. Go back to your Render service dashboard
echo 2. Navigate to Environment tab
echo 3. Update FRONTEND_URL with your Vercel URL
echo 4. Update GOOGLE_CALLBACK_URL with your Render URL + /api/auth/google/callback
echo 5. Service will auto-redeploy
echo.

pause

echo.
echo 🔑 STEP 4: Update Google OAuth Settings
echo ---------------------------------------
echo 1. Go to: https://console.developers.google.com/
echo 2. Select your ScamRadar project
echo 3. Go to Credentials ^> OAuth 2.0 Client IDs
echo 4. Edit your client
echo 5. Update Authorized JavaScript origins:
echo    - Add your Vercel URL
echo 6. Update Authorized redirect URIs:
echo    - Add your Render URL + /api/auth/google/callback
echo 7. Save changes
echo.

pause

echo.
echo 🧪 STEP 5: Test Your Deployment
echo -------------------------------
echo 1. Open your Vercel frontend URL
echo 2. Check browser console for errors
echo 3. Test user registration
echo 4. Test Google OAuth login
echo 5. Test file upload functionality
echo 6. Test spam analysis features
echo.

echo 📚 For detailed guides, check the docs/ folder:
echo - docs/deployment-guide.md (Complete step-by-step guide)
echo - docs/services-setup.md (API keys and external services)
echo.

echo 🎉 Deployment Complete!
echo Your ScamRadar app should now be live and functional.
echo.

pause
