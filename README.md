# ACE Field Evidence - Digital MRV Platform

A production-ready Digital Measurement, Reporting, and Verification (MRV) platform for carbon projects with real-time data collection, GPS mapping, and cryptographic data integrity verification.

## Features

✅ **Real Authentication** - Passwordless login with email OTP (Supabase)
✅ **User Projects** - Create unlimited carbon project locations
✅ **Data Recording** - Enter measurements (carbon stock, trees, soil depth, biomass)
✅ **Interactive Map** - Leaflet.js with GPS project locations
✅ **Data Integrity** - SHA-256 hash chain verification for tamper-proofing
✅ **Glassmorphic UI** - Modern design with light/dark theme support
✅ **Role-Based Access** - Field Team, Verifier, Developer, Admin roles

## Architecture

- **Frontend**: Vanilla HTML/CSS/JavaScript (no build step)
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth with email OTP
- **Maps**: Leaflet.js + OpenStreetMap
- **Deployment**: Vercel (static site)

## Setup Instructions

### 1. Supabase Setup

1. Go to [supabase.com](https://supabase.com)
2. Create a new project
3. Get your credentials from Settings → API:
   - Project URL: `https://xxxxx.supabase.co`
   - Anon Public Key: `sb_publishable_...`

4. Open the SQL Editor and run the contents of `supabase-setup.sql`:
   - Creates `projects` and `records` tables
   - Sets up Row Level Security (RLS)
   - Enables authentication

### 2. Configure Credentials

Update the credentials in `index.html`:

```javascript
const SUPABASE_URL = 'https://your-project.supabase.co';
const SUPABASE_KEY = 'your-anon-key-here';
```

### 3. GitHub + Vercel Deployment

```bash
# Initialize git
git init
git add .
git commit -m "Initial commit: ACE Field Evidence"

# Push to GitHub
git remote add origin https://github.com/YOUR_USERNAME/ace-field-evidence.git
git branch -M main
git push -u origin main
```

Then on Vercel:
1. Go to [vercel.com](https://vercel.com)
2. Click "New Project"
3. Select your GitHub repo
4. Deploy (no build step needed!)

## Usage

### Create a Test Account

1. Open the app at `https://your-vercel-url.vercel.app`
2. Enter your email
3. Check your inbox for the verification code
4. Enter the 6-digit code to login

### Create a Project

1. Click "Projects" in the sidebar
2. Click "+ New Project"
3. Fill in:
   - **Project Name**: e.g., "Kilifi Coastal Restoration"
   - **Latitude/Longitude**: GPS coordinates
   - **Description**: Project details
4. Click "Create Project"

### Record Measurements

1. Click "Records" in the sidebar
2. Click "+ New Record"
3. Select a project
4. Choose measurement type (Carbon Stock, Tree Count, etc.)
5. Enter the value and notes
6. Click "Save Record"

### View Map

1. Click "Map" in the sidebar
2. See all your projects with GPS markers
3. Pan/zoom to explore locations

### Verify Data Integrity

1. Click "Data Integrity" in the sidebar
2. See SHA-256 hashes for all records
3. All records are cryptographically verified

## Project Locations (Examples)

- **Kilifi, Kenya**: -3.63, 39.85
- **Ashanti, Ghana**: 6.69, -1.62
- **Niger Delta, Nigeria**: 4.82, 6.97

## Tech Stack

| Technology | Purpose |
|-----------|---------|
| HTML/CSS/JS | Frontend (no framework) |
| Supabase | Backend + Auth + Database |
| Leaflet.js | Interactive maps |
| OpenStreetMap | Map tiles |
| Web Crypto API | SHA-256 hashing |
| Vercel | Hosting |

## File Structure

```
ace-field-evidence/
├── index.html              # Main application
├── supabase-setup.sql      # Database schema
├── package.json            # Node config
├── vercel.json             # Vercel config
├── .gitignore              # Git ignore
└── README.md               # This file
```

## Environment Variables

No environment variables needed! Credentials are embedded in `index.html` (public key is safe to share).

## Performance

- Zero JavaScript frameworks = ultra-fast
- Static site deployment = instant loads
- Lazy-loaded Leaflet maps = efficient
- Minimal CSS = fast rendering

## Security Features

- ✅ Email OTP authentication (no passwords)
- ✅ Row-Level Security (RLS) on all tables
- ✅ SHA-256 hash chains for data integrity
- ✅ User isolation (can only see own data)
- ✅ HTTPS enforcement on Vercel

## Roadmap

- [ ] Offline data collection
- [ ] Image attachments to records
- [ ] Data export (CSV/PDF)
- [ ] Admin dashboard
- [ ] Real-time collaboration
- [ ] Mobile app (React Native)

## Support

Need help? Check:
1. Supabase Docs: https://supabase.com/docs
2. Leaflet Docs: https://leafletjs.com/
3. Vercel Docs: https://vercel.com/docs

## License

MIT - Feel free to use this for your projects!

---

**Built with ❤️ for the African Carbon Exchange**
