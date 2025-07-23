# 🚀 ScamRadar: Complete Deployment Guide
## Vercel (Frontend) + Render (Backend) + MongoDB Atlas

**Total Cost: FREE** 🎉

---

## 📋 Quick Overview

**What we're deploying:**
- **Frontend**: React + Vite → Vercel
- **Backend**: Node.js + Express → Render  
- **Database**: MongoDB → Atlas (free tier)
- **File Storage**: Cloudinary (free tier)
- **AI**: Google Gemini (free tier)

**Time needed**: ~45 minutes total

---

# 🌐 PART 1: FRONTEND DEPLOYMENT ON VERCEL

## Step 1: Create Vercel Account

### 1.1 Sign Up
1. Go to **https://vercel.com/**
2. Click **"Sign Up"**
3. Choose **"Continue with GitHub"** (recommended)
4. Authorize Vercel to access your GitHub account
5. Complete your profile setup

### 1.2 Verify Account
1. Check your email for verification link
2. Click the verification link
3. Your Vercel dashboard should now be accessible

## Step 2: Prepare Frontend for Deployment

### 2.1 Test Local Build
```powershell
cd s:\ScamRadar\Frontend
npm install
npm run build
```

### 2.2 Create Production Environment File
1. Copy `.env.production.example` to `.env.production`
2. Update the backend URL (you'll get this after deploying backend):
```env
VITE_API_BASE_URL=https://scamradar-backend.onrender.com
VITE_GOOGLE_CLIENT_ID=your_google_client_id
VITE_APP_NAME=ScamRadar
VITE_APP_VERSION=1.0.0
```

## Step 3: Deploy Frontend to Vercel

### 3.1 Connect Repository
1. In Vercel dashboard, click **"New Project"**
2. Click **"Import Git Repository"**
3. Find your **ScamRadar** repository
4. Click **"Import"**

### 3.2 Configure Project Settings
**Framework Preset**: Vite  
**Root Directory**: `Frontend`  
**Build Command**: `npm run build`  
**Output Directory**: `dist`  
**Install Command**: `npm install`

### 3.3 Add Environment Variables
Before deploying, click **"Environment Variables"**:

| Name | Value |
|------|-------|
| `VITE_API_BASE_URL` | `https://scamradar-backend.onrender.com` |
| `VITE_GOOGLE_CLIENT_ID` | Your Google OAuth Client ID |
| `VITE_APP_NAME` | `ScamRadar` |
| `VITE_APP_VERSION` | `1.0.0` |

### 3.4 Deploy
1. Click **"Deploy"**
2. Wait for build to complete (2-3 minutes)
3. You'll get a URL like: `https://scamradar-abc123.vercel.app`

### 3.5 Configure Custom Domain (Optional)
1. Go to **Settings** → **Domains**
2. Add your custom domain
3. Update DNS records as instructed

---

# 🔗 PART 2: BACKEND DEPLOYMENT ON RENDER

## Step 1: Create Render Account

### 1.1 Sign Up
1. Go to **https://render.com/**
2. Click **"Get Started"**
3. Choose **"Sign up with GitHub"** (recommended)
4. Authorize Render to access your GitHub account
5. Complete your profile setup

### 1.2 Verify Account
1. Check email for verification
2. Verify your account
3. Access Render dashboard

## Step 2: Deploy Backend to Render

### 2.1 Create New Web Service
1. In Render dashboard, click **"New +"**
2. Select **"Web Service"**
3. Choose **"Build and deploy from a Git repository"**
4. Click **"Connect"** next to GitHub

### 2.2 Select Repository
1. Find your **ScamRadar** repository
2. Click **"Connect"**

### 2.3 Configure Service Settings

**Basic Settings:**
- **Name**: `scamradar-backend`
- **Region**: Choose closest to your users
- **Branch**: `main`
- **Root Directory**: `Backend`
- **Runtime**: `Node`

**Build & Deploy:**
- **Build Command**: `npm install`
- **Start Command**: `npm start`

**Advanced Settings:**
- **Auto-Deploy**: `Yes` (recommended)

### 2.4 Add Environment Variables

Click **"Advanced"** → **"Add Environment Variable"**:

| Name | Value |
|------|-------|
| `NODE_ENV` | `production` |
| `PORT` | `10000` |
| `MONGO_URL` | Your MongoDB Atlas connection string |
| `FRONTEND_URL` | `https://your-frontend.vercel.app` |
| `GEMINI_API_KEY` | Your Google Gemini API key |
| `CLOUDINARY_CLOUD_NAME` | Your Cloudinary cloud name |
| `CLOUDINARY_API_KEY` | Your Cloudinary API key |
| `CLOUDINARY_API_SECRET` | Your Cloudinary API secret |
| `GOOGLE_CLIENT_ID` | Your Google OAuth Client ID |
| `GOOGLE_CLIENT_SECRET` | Your Google OAuth Client Secret |
| `GOOGLE_CALLBACK_URL` | `https://your-backend.onrender.com/api/auth/google/callback` |
| `JWT_SECRET` | A secure random string (min 32 characters) |

### 2.5 Deploy
1. Click **"Create Web Service"**
2. Wait for deployment (5-10 minutes)
3. You'll get a URL like: `https://scamradar-backend.onrender.com`

---

# 🔗 PART 3: CONNECT FRONTEND AND BACKEND

## Step 1: Update Frontend Environment Variables

1. Go to your Vercel project dashboard
2. Navigate to **Settings** → **Environment Variables**
3. Update `VITE_API_BASE_URL` with your Render backend URL:
   ```
   VITE_API_BASE_URL=https://scamradar-backend.onrender.com
   ```
4. Click **"Save"**

## Step 2: Update Backend Environment Variables

1. Go to your Render service dashboard
2. Navigate to **Environment**
3. Update `FRONTEND_URL` with your Vercel frontend URL:
   ```
   FRONTEND_URL=https://scamradar-abc123.vercel.app
   ```
4. Update `GOOGLE_CALLBACK_URL`:
   ```
   GOOGLE_CALLBACK_URL=https://scamradar-backend.onrender.com/api/auth/google/callback
   ```
5. Click **"Save Changes"**

## Step 3: Redeploy Both Services

### Redeploy Frontend (Vercel):
1. Go to Vercel dashboard
2. Click **"Deployments"**
3. Click **"Redeploy"** on latest deployment

### Redeploy Backend (Render):
1. Render automatically redeploys when environment variables change
2. Or manually trigger via **"Manual Deploy"** → **"Deploy latest commit"**

---

# 🧪 PART 4: TESTING DEPLOYMENT

## Step 1: Test Backend API

1. Open: `https://your-backend.onrender.com/`
2. Should see a response (not 404)
3. Test auth endpoint: `https://your-backend.onrender.com/api/auth/`

## Step 2: Test Frontend

1. Open: `https://your-frontend.vercel.app/`
2. Check browser console for errors
3. Test user registration/login
4. Test file upload functionality

## Step 3: Test Integration

1. Try creating an account
2. Test Google OAuth login
3. Upload a file for analysis
4. Check if API calls work

---

# 🔧 TROUBLESHOOTING

## Common Issues & Solutions

### ❌ **CORS Error**
**Problem**: Frontend can't connect to backend  
**Solution**: Check `FRONTEND_URL` in Render environment variables

### ❌ **MongoDB Connection Failed**
**Problem**: Backend can't connect to database  
**Solution**: 
1. Check MongoDB Atlas IP whitelist (use 0.0.0.0/0)
2. Verify connection string format
3. Ensure database user permissions

### ❌ **Google OAuth Not Working**
**Problem**: OAuth redirect fails  
**Solution**: 
1. Update Google Console redirect URLs:
   - `https://your-backend.onrender.com/api/auth/google/callback`
2. Check Google OAuth credentials in environment variables

### ❌ **Build Fails on Vercel**
**Problem**: Frontend build errors  
**Solution**: 
1. Check Node.js version compatibility
2. Verify all dependencies in package.json
3. Test build locally first

### ❌ **Render Service Won't Start**
**Problem**: Backend deployment fails  
**Solution**: 
1. Check Render logs for error details
2. Verify start command: `npm start`
3. Ensure package.json has correct scripts

---

# 📊 Free Tier Limits

| Service | Free Tier Limit | Notes |
|---------|----------------|-------|
| **Vercel** | 100GB bandwidth/month | More than enough for most apps |
| **Render** | 750 hours/month | ~1 month of continuous running |
| **MongoDB Atlas** | 512MB storage | Good for development/small apps |
| **Cloudinary** | 25GB storage + bandwidth | Generous for image/file storage |

---

# 🎉 Success!

If everything is working:
- ✅ Frontend loads at your Vercel URL
- ✅ Backend responds at your Render URL
- ✅ Users can register/login
- ✅ File uploads work
- ✅ AI analysis functions
- ✅ No CORS or connection errors

**Your ScamRadar app is now live and production-ready!**

---

# 🚀 Next Steps

1. **Custom Domain**: Point your domain to Vercel
2. **Monitoring**: Set up error tracking with Sentry
3. **Analytics**: Add Google Analytics
4. **Performance**: Monitor with Render's built-in metrics
5. **Backup**: Ensure MongoDB Atlas backups are enabled

**Estimated Total Deployment Time: 45 minutes**

> 💡 **Tip**: Follow this guide step by step. Don't skip ahead - each step builds on the previous one!
