# 🚀 Quick Setup Guide

## Step 1: Set Up Supabase Database (5 minutes)

1. Go to your Supabase dashboard
2. Open **SQL Editor** 
3. Copy all SQL from `supabase-setup.sql`
4. Paste and run it
5. Done! Tables are created with security enabled

## Step 2: Update Credentials in index.html

Open `index.html` and find this line (around line 630):

```javascript
const SUPABASE_URL = 'https://eqriubzbiwuqfbpyadgg.supabase.co';
const SUPABASE_KEY = 'sb_publishable_i14N0wt_LPRK_82WLa4u7A_Fzl8HUf-';
```

This is **already set with your credentials**. No changes needed!

## Step 3: Test Locally (Optional)

```bash
cd ace-field-evidence
npx http-server
# Open http://localhost:8080
```

## Step 4: Push to GitHub

```bash
# If you haven't set up GitHub yet:
# 1. Create new repo: https://github.com/new
# 2. Copy the repo URL

# Then run:
git remote add origin https://github.com/YOUR_USERNAME/ace-field-evidence.git
git branch -M main
git push -u origin main
```

## Step 5: Deploy to Vercel

### Option A: Via Dashboard (Easiest)

1. Go to [vercel.com](https://vercel.com)
2. Click **"Add New..." → "Project"**
3. Select your GitHub repo
4. Click **"Deploy"** (no env vars needed!)
5. Get your live URL

### Option B: Via CLI

```bash
npm i -g vercel
vercel
# Follow prompts - link to your GitHub repo
```

## Step 6: Create Test Accounts

Once deployed, test with 3 email accounts:

1. **Open the app URL**
2. Enter email address
3. Check inbox for 6-digit code
4. Login and create test projects:
   - Kilifi, Kenya: -3.63, 39.85
   - Ashanti, Ghana: 6.69, -1.62
   - Niger Delta, Nigeria: 4.82, 6.97

## Step 7: Share the Link

Your app is now live! Share:
- Production URL: `https://your-project.vercel.app`
- GitHub repo: `https://github.com/YOUR_USERNAME/ace-field-evidence`

---

## Troubleshooting

### "Supabase connection failed"
- Check your credentials in `index.html` are correct
- Verify database tables were created in SQL editor

### "Auth not working"
- Make sure Supabase Auth is enabled
- Check that email provider is configured

### "Map not showing"
- Verify Leaflet CDN is loaded (check browser console)
- Ensure projects have valid latitude/longitude

### Need help?
- Supabase Docs: https://supabase.com/docs
- Vercel Docs: https://vercel.com/docs
- Leaflet Docs: https://leafletjs.com

---

**You're all set! Your production MRV platform is ready.** 🎉
