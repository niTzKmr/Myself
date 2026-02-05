# GitHub Pages Deployment Guide

## ✅ Setup Completed

Your portfolio is now configured for automated GitHub Pages deployment with your custom domain **nitis.in**.

### What Was Configured

#### 1. **Vite Base Path** (`vite.config.js`)
- Set `base: '/'` for custom domain routing
- Ensures all assets load correctly from the domain root

#### 2. **Public Folder Structure** (`/public`)
- `CNAME` - Custom domain configuration
- `.nojekyll` - Disables GitHub Pages Jekyll processing

#### 3. **GitHub Actions Workflow** (`.github/workflows/deploy.yml`)
- Triggered automatically on **every push to main branch**
- Builds your React app with Vite
- Verifies CNAME file is included
- Deploys to `gh-pages` branch
- Preserves all existing files and redirects

#### 4. **NPM Scripts** (`package.json`)
```bash
npm run build          # Build for production
npm run deploy:verify  # Build & verify CNAME is included
npm run deploy         # Manual deployment with gh-pages
npm run clean          # Clean build artifacts
```

---

## 🚀 Deployment Process

### Automatic Deployment (Recommended)
```bash
# Simply push to main branch
git add .
git commit -m "Your changes"
git push origin main
```

✨ **GitHub Actions will automatically:**
1. Build your React app
2. Verify all files are correct
3. Deploy to gh-pages branch
4. Site updates at nitis.in within 30 seconds

### Manual Deployment (If Needed)
```bash
npm run deploy
```

---

## 📋 Troubleshooting Checklist

If you see a white screen or issues:

### 1. Verify Local Build First
```bash
npm run build
npm run preview
```
Check if the app works at `http://localhost:5173`

### 2. Check Deployment Verification
```bash
npm run deploy:verify
```
Should show:
- ✓ Build complete
- ✓ dist/ folder contents
- ✓ CNAME file with "nitis.in"

### 3. Check GitHub Actions
1. Go to: `https://github.com/YOUR_USERNAME/YOUR_REPO/actions`
2. Click the latest workflow run
3. Verify all steps passed (especially "Verify CNAME in dist")
4. Check logs if any step failed

### 4. Clear GitHub Pages Cache
1. Go to GitHub repo Settings > Pages
2. Verify:
   - **Source**: Deploy from a branch
   - **Branch**: gh-pages
   - **Folder**: / (root)
   - **Custom domain**: nitis.in

### 5. Browser Cache
- Hard refresh: `Ctrl+Shift+R` (Windows) or `Cmd+Shift+R` (Mac)
- Clear browser cache in DevTools

---

## 🔍 Common Issues & Solutions

### White Screen / 404 Error
**Cause:** Base path mismatch or missing build files

**Solution:**
```bash
npm run build
npm run deploy:verify
# Check dist/ contains index.html, CNAME, .nojekyll
```

### CNAME Not Deployed
**Cause:** File not in public/ folder

**Solution:** Verify `public/CNAME` exists with content "nitis.in"

### Assets Not Loading (404 on CSS/JS)
**Cause:** Incorrect base path or asset paths

**Solution:** Verify `vite.config.js` has `base: '/'`

### GitHub Actions Fails
**Solution:**
1. Check Actions logs in GitHub
2. Ensure all files are committed to main branch
3. Verify `public/CNAME` and `public/.nojekyll` exist

---

## 📁 Directory Structure

```
Portfolio/
├── public/                    # ← Files copied to dist on build
│   ├── CNAME                 # ← Custom domain
│   └── .nojekyll             # ← Disable Jekyll
├── src/                       # ← React source
│   ├── components/
│   ├── styles/
│   └── main.jsx
├── .github/
│   └── workflows/
│       └── deploy.yml        # ← Auto-deployment config
├── vite.config.js            # ← base: '/' configured
├── package.json
└── README.md
```

---

## ✨ Best Practices Going Forward

1. **Always commit public/ folder** - Contains CNAME & .nojekyll
2. **Push only to main branch** - Actions deploy automatically
3. **Test locally first** - Use `npm run preview` before pushing
4. **Check Actions dashboard** - Verify deployment succeeded
5. **Hard refresh browser** - Cache can delay updates

---

## 🔗 Useful Links

- [Vite Documentation](https://vitejs.dev/)
- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [React Router + GitHub Pages](https://create-react-app.dev/docs/deployment/#github-pages) (if you add routing)

---

## ⚠️ Important Notes

- **CNAME must be in `public/` folder**, not root, so it gets copied to dist/
- **Keep `.nojekyll`** empty - it disables Jekyll processing
- **Do NOT manually push to gh-pages branch** - Let GitHub Actions handle it
- **Custom domain DNS must point to GitHub Pages** - Verify in repo Settings > Pages

---

## 🎯 Summary

✅ Base path configured correctly  
✅ CNAME file properly placed  
✅ GitHub Actions auto-deploy enabled  
✅ Jekyll processing disabled  
✅ All source files excluded from publication  
✅ Zero configuration needed after first push

**Next step:** Push to main branch and watch it deploy! 🚀
