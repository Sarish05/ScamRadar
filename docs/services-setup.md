# 🔑 External Services Setup Guide
## MongoDB Atlas • Google Gemini • Cloudinary • Google OAuth

## 🗄️ MongoDB Atlas Setup (Database)

### Step 1: Create Account
1. Go to **https://cloud.mongodb.com/**
2. Click **"Try Free"**
3. Sign up with Google/GitHub (recommended)
4. Complete verification

### Step 2: Create Organization & Project
1. Create organization: "ScamRadar"
2. Create project: "ScamRadar-Production"

### Step 3: Create Cluster
1. Click **"Build a Database"**
2. Choose **"M0 Sandbox"** (FREE)
3. Provider: **AWS** (recommended)
4. Region: Choose closest to your users
5. Cluster Name: `ScamRadar-Cluster`
6. Click **"Create"**

### Step 4: Create Database User
1. Go to **"Database Access"** (left sidebar)
2. Click **"Add New Database User"**
3. Authentication Method: **Password**
4. Username: `scamradar-app`
5. Password: Generate secure password (save it!)
6. Database User Privileges: **"Read and write to any database"**
7. Click **"Add User"**

### Step 5: Configure Network Access
1. Go to **"Network Access"** (left sidebar)
2. Click **"Add IP Address"**
3. Click **"Allow Access from Anywhere"** (0.0.0.0/0)
4. Comment: "Render Backend Access"
5. Click **"Confirm"**

### Step 6: Get Connection String
1. Go to **"Databases"** (left sidebar)
2. Click **"Connect"** on your cluster
3. Choose **"Connect your application"**
4. Driver: **Node.js**, Version: **4.1 or later**
5. Copy connection string:
   ```
   mongodb+srv://scamradar-app:<password>@scamradar-cluster.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```
6. Replace `<password>` with your user password
7. Add database name: `scamradarDB`
   ```
   mongodb+srv://scamradar-app:<password>@scamradar-cluster.xxxxx.mongodb.net/scamradarDB?retryWrites=true&w=majority
   ```

---

## 🤖 Google Gemini AI Setup

### Step 1: Get API Key
1. Go to **https://makersuite.google.com/app/apikey**
2. Sign in with your Google account
3. Click **"Create API Key"**
4. Copy the API key (starts with `AIza...`)

### Step 2: Enable Billing (Optional)
- Free tier: 60 requests per minute
- For production: Enable billing for higher limits

---

## ☁️ Cloudinary Setup (File Storage)

### Step 1: Create Account
1. Go to **https://cloudinary.com/**
2. Click **"Sign Up Free"**
3. Fill out the form or sign up with Google
4. Verify your email

### Step 2: Get Credentials
1. Go to your **Dashboard**
2. Copy these values:
   - **Cloud Name** (e.g., `dxxxxx`)
   - **API Key** (e.g., `123456789012345`)
   - **API Secret** (e.g., `abcdefghijklmnopqrstuvwxyz`)

### Step 3: Configure Settings (Optional)
1. Go to **Settings** → **Upload**
2. Enable **"Use filename as Public ID"** for better file management

---

## 🔐 Google OAuth Setup

### Step 1: Create Project
1. Go to **https://console.developers.google.com/**
2. Click **"Select a project"** → **"New Project"**
3. Project name: `ScamRadar`
4. Click **"Create"**

### Step 2: Enable APIs
1. Go to **"Library"** (left sidebar)
2. Search for **"Google+ API"**
3. Click on it and click **"Enable"**

### Step 3: Configure OAuth Consent Screen
1. Go to **"OAuth consent screen"** (left sidebar)
2. Choose **"External"** → **"Create"**
3. Fill out required fields:
   - App name: `ScamRadar`
   - User support email: Your email
   - Developer contact: Your email
4. Click **"Save and Continue"**
5. Skip "Scopes" → **"Save and Continue"**
6. Skip "Test users" → **"Save and Continue"**

### Step 4: Create OAuth Credentials
1. Go to **"Credentials"** (left sidebar)
2. Click **"Create Credentials"** → **"OAuth 2.0 Client IDs"**
3. Application type: **"Web application"**
4. Name: `ScamRadar Web Client`

5. **Authorized JavaScript origins**:
   ```
   http://localhost:3000
   https://your-frontend.vercel.app
   ```

6. **Authorized redirect URIs**:
   ```
   http://localhost:5000/api/auth/google/callback
   https://your-backend.onrender.com/api/auth/google/callback
   ```

7. Click **"Create"**
8. Copy **Client ID** and **Client Secret**

---

## 🎵 AssemblyAI Setup (Optional - Audio Analysis)

### Step 1: Create Account
1. Go to **https://www.assemblyai.com/**
2. Click **"Sign Up"**
3. Complete registration

### Step 2: Get API Key
1. Go to your **Dashboard**
2. Copy the **API Key**
3. Free tier: 5 hours of audio per month

---

## 📧 Gmail SMTP Setup (Optional - Email Notifications)

### Step 1: Enable 2-Factor Authentication
1. Go to **Google Account Settings**
2. Security → **2-Step Verification**
3. Enable it if not already enabled

### Step 2: Generate App Password
1. Go to **Google Account Settings**
2. Security → **2-Step Verification** → **App passwords**
3. Select app: **"Mail"**
4. Select device: **"Other (Custom name)"**
5. Name: `ScamRadar Backend`
6. Click **"Generate"**
7. Copy the 16-character password

---

# 🔄 Environment Variables Summary

After setting up all services, you'll have these environment variables:

## Backend (.env for Render)
```env
# Database
MONGO_URL=mongodb+srv://scamradar-app:<password>@scamradar-cluster.xxxxx.mongodb.net/scamradarDB?retryWrites=true&w=majority

# Server
NODE_ENV=production
PORT=10000
FRONTEND_URL=https://your-frontend.vercel.app

# APIs
GEMINI_API_KEY=AIza...
ASSEMBLYAI_API_KEY=your_assemblyai_key (optional)

# Cloudinary
CLOUDINARY_CLOUD_NAME=dxxxxx
CLOUDINARY_API_KEY=123456789012345
CLOUDINARY_API_SECRET=abcdefghijklmnopqrstuvwxyz

# Google OAuth
GOOGLE_CLIENT_ID=123456789-abcdefg.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=GOCSPX-xxxxxxxxxxxxxxxxxxxxx
GOOGLE_CALLBACK_URL=https://your-backend.onrender.com/api/auth/google/callback

# Security
JWT_SECRET=your_super_secure_random_string_min_32_chars

# Email (optional)
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your_16_char_app_password
```

## Frontend (.env for Vercel)
```env
VITE_API_BASE_URL=https://your-backend.onrender.com
VITE_GOOGLE_CLIENT_ID=123456789-abcdefg.apps.googleusercontent.com
VITE_APP_NAME=ScamRadar
VITE_APP_VERSION=1.0.0
```

---

# ⚠️ Important Notes

1. **Never commit real API keys** to your repository
2. **Use strong passwords** for all services
3. **Enable 2FA** where available
4. **Keep API keys secure** and rotate them periodically
5. **Monitor usage** to stay within free tier limits

---

# 💰 Free Tier Limits Summary

| Service | Free Limit | Upgrade Cost |
|---------|-----------|--------------|
| MongoDB Atlas | 512MB storage | $9/month (2GB) |
| Google Gemini | 60 req/min | Pay-per-use |
| Cloudinary | 25GB storage + bandwidth | $89/month |
| Google OAuth | Unlimited | Free |
| AssemblyAI | 5 hours audio/month | $0.37/hour |
| Gmail SMTP | 500 emails/day | Free |

**Total Monthly Cost: $0** (within free tiers)
