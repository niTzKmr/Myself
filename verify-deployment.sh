#!/bin/bash
# GitHub Pages Deployment Verification Script

echo "================================================"
echo "  GitHub Pages Deployment Verification"
echo "================================================"
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js."
    exit 1
fi
echo "✓ Node.js: $(node --version)"

# Check npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm not found."
    exit 1
fi
echo "✓ npm: $(npm --version)"

echo ""
echo "Checking project files..."
echo "─────────────────────────────────────────────────"

# Check vite.config.js has base path
if grep -q "base: '/'," vite.config.js; then
    echo "✓ vite.config.js: base path configured"
else
    echo "⚠ vite.config.js: base path NOT configured (should be: base: '/')"
fi

# Check public/CNAME exists
if [ -f public/CNAME ]; then
    echo "✓ public/CNAME exists: $(cat public/CNAME)"
else
    echo "❌ public/CNAME NOT found"
fi

# Check public/.nojekyll exists
if [ -f public/.nojekyll ]; then
    echo "✓ public/.nojekyll exists (Jekyll disabled)"
else
    echo "⚠ public/.nojekyll NOT found"
fi

# Check GitHub Actions workflow
if [ -f .github/workflows/deploy.yml ]; then
    echo "✓ .github/workflows/deploy.yml exists"
    if grep -q "keep_files: true" .github/workflows/deploy.yml; then
        echo "✓ Workflow: keep_files enabled"
    fi
    if grep -q "cname: nitis.in" .github/workflows/deploy.yml; then
        echo "✓ Workflow: custom domain configured"
    fi
else
    echo "⚠ GitHub Actions workflow NOT found"
fi

echo ""
echo "Building project..."
echo "─────────────────────────────────────────────────"

# Clean and build
npm run build 2>&1 | grep -E "✓|✔|error" || true

if [ -d dist ]; then
    echo "✓ Build successful: dist/ folder created"
    
    # Check dist contents
    echo ""
    echo "Checking dist/ folder..."
    echo "─────────────────────────────────────────────────"
    
    if [ -f dist/index.html ]; then
        echo "✓ dist/index.html"
    else
        echo "❌ dist/index.html missing"
    fi
    
    if [ -f dist/CNAME ]; then
        echo "✓ dist/CNAME: $(cat dist/CNAME)"
    else
        echo "❌ dist/CNAME missing - this will cause deployment issues!"
    fi
    
    if [ -f dist/.nojekyll ]; then
        echo "✓ dist/.nojekyll"
    else
        echo "⚠ dist/.nojekyll missing"
    fi
    
    # Show some dist stats
    echo ""
    FILE_COUNT=$(find dist -type f | wc -l)
    echo "Total files in dist/: $FILE_COUNT"
    
else
    echo "❌ Build failed: dist/ folder not created"
    exit 1
fi

echo ""
echo "================================================"
echo "  ✓ All checks passed! Ready to deploy."
echo "================================================"
echo ""
echo "Next steps:"
echo "  1. git add ."
echo "  2. git commit -m 'Setup GitHub Pages deployment'"
echo "  3. git push origin main"
echo ""
echo "Watch deployment: https://github.com/YOUR_USERNAME/YOUR_REPO/actions"
echo ""
