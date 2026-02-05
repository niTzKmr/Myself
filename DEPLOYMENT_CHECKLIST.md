# 🚀 Deployment Checklist - Ready to Deploy

## Pre-Deployment Checklist (Do This Now)

- [ ] Review changes made:
  - [ ] `vite.config.js` has `base: '/'`
  - [ ] `public/CNAME` exists with "nitis.in"
  - [ ] `public/.nojekyll` exists (empty file)
  - [ ] `.github/workflows/deploy.yml` has CNAME verification

- [ ] Test locally (Windows):
  ```bash
  npm run build
  npm run deploy:verify
  ```
  Should see: `✓ CNAME file verified`

- [ ] If all tests pass, proceed with deployment

---

## Deployment Steps (Copy & Paste)

### Step 1: Stage Changes
```bash
git add .
```

### Step 2: Commit
```bash
git commit -m "feat: configure GitHub Pages auto-deployment with custom domain

- Add Vite base path configuration
- Move CNAME to public folder for dist inclusion
- Add .nojekyll file
- Update GitHub Actions with CNAME verification
- Add deployment verification scripts"
```

### Step 3: Push to Main
```bash
git push origin main
```

---

## Post-Deployment (Watch It Deploy)

### Step 1: Monitor GitHub Actions (2-3 minutes)
```
https://github.com/YOUR_USERNAME/YOUR_REPO/actions
```

Click the latest run and verify:
- ✅ Checkout
- ✅ Use Node.js
- ✅ Install dependencies
- ✅ Build
- ✅ Verify CNAME in dist (MUST BE GREEN)
- ✅ Deploy to GitHub Pages

### Step 2: Visit Your Site
```
https://nitis.in
```

You should see your portfolio!

### Step 3: Verify in Browser
- [ ] Page loads without white screen
- [ ] All CSS styles applied correctly
- [ ] All images load
- [ ] Navigation works
- [ ] Hard refresh: `Ctrl+Shift+R`

---

## If Issues Occur

### White Screen / 404
```bash
# Check local build
npm run build
npm run preview

# Compare with Actions logs
# GitHub Repo → Actions → Latest Run → Logs
```

### Deployment Still Failing
1. Go to `.github/workflows/deploy.yml` in editor
2. Check if changes were pushed: `git log --oneline | head -5`
3. Verify: `git ls-files | grep -E "public/CNAME|vite.config"`

### Custom Domain Not Working
1. GitHub Repo Settings → Pages
2. Verify "Custom domain" set to: `nitis.in`
3. Verify DNS points to GitHub Pages (check registrar)

---

## Important Reminders

⚠️ **Critical Files - Do NOT Delete:**
- `public/CNAME` - Must exist for custom domain
- `public/.nojekyll` - Disables Jekyll processing
- `.github/workflows/deploy.yml` - Auto-deployment config

✅ **Best Practices Going Forward:**
- Always push to `main` branch (Actions auto-deploys)
- Test with `npm run preview` before pushing
- Check GitHub Actions after each push
- Never manually push to `gh-pages` branch

---

## Success Indicators

When deployment is complete, you should see:

```
✓ GitHub Actions: All steps pass (green checkmarks)
✓ Website: https://nitis.in loads without errors
✓ Browser console: No 404 errors
✓ Assets: CSS, JS, images all load
✓ CNAME resolved: Check DNS works correctly
```

---

## Future Deployments

**From now on, deployment is automatic:**

```bash
# Make code changes
# ...

# Push to main
git add .
git commit -m "Your message"
git push origin main

# Done! GitHub Actions deploys automatically
# No manual steps needed
```

---

## Quick Reference

| What | Where |
|------|-------|
| Monitor Deployment | `https://github.com/YOUR_USERNAME/YOUR_REPO/actions` |
| View Live Site | `https://nitis.in` |
| Configuration | `vite.config.js`, `.github/workflows/deploy.yml` |
| Documentation | `DEPLOYMENT_GUIDE.md` (detailed guide) |

---

## Ready?

✅ All systems ready for deployment
✅ Zero configuration needed after first push
✅ Automatic deployments on every push to main

**Let's deploy!** 🚀

Run these three commands:
```bash
git add .
git commit -m "Setup GitHub Pages automation"
git push origin main
```

Then watch it deploy at your GitHub Actions page.

Good luck! 🎉
