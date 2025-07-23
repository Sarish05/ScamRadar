# 🚀 ScamRadar - Quick Deployment Overview

## 💰 **FREE Deployment Stack**

**Frontend**: Vercel → **Backend**: Render → **Database**: MongoDB Atlas

---

## ⚡ **Quick Start (45 minutes)**

### 1. **Prepare Code** (5 min)
```powershell
cd s:\ScamRadar
.\deploy.bat
```

### 2. **Setup Services** (15 min)
Get API keys from:
- [MongoDB Atlas](https://cloud.mongodb.com/) - Database
- [Google Gemini](https://makersuite.google.com/app/apikey) - AI
- [Cloudinary](https://cloudinary.com/) - File storage
- [Google OAuth](https://console.developers.google.com/) - Authentication

### 3. **Deploy Backend** (10 min)
1. Go to [render.com](https://render.com/)
2. Connect GitHub → ScamRadar repo
3. Root Directory: `Backend`
4. Add environment variables
5. Deploy

### 4. **Deploy Frontend** (10 min) 
1. Go to [vercel.com](https://vercel.com/)
2. Connect GitHub → ScamRadar repo  
3. Root Directory: `Frontend`
4. Add environment variables (with backend URL)
5. Deploy

### 5. **Connect & Test** (5 min)
Update URLs in both platforms and test the app!

---

## 📚 **Detailed Guides**

- **📖 Complete walkthrough**: [`docs/deployment-guide.md`](docs/deployment-guide.md)
- **🔑 API setup guide**: [`docs/services-setup.md`](docs/services-setup.md)

---

## 🎯 **Free Tier Limits**

| Service | Limit | Enough for |
|---------|-------|-----------|
| Vercel | 100GB/month | ~100k visitors |
| Render | 750 hours/month | Always-on app |
| MongoDB | 512MB storage | ~100k records |
| Cloudinary | 25GB/month | ~10k images |

**Total Cost: $0/month** 🎉

---

## ✅ **Success = Working App**

- ✅ Users can register/login
- ✅ Google OAuth works
- ✅ File uploads work  
- ✅ AI spam detection works
- ✅ Mobile responsive

**Your ScamRadar is now LIVE!** 🚀
