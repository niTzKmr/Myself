@echo off
REM GitHub Pages Deployment Verification Script for Windows

echo.
echo ================================================
echo   GitHub Pages Deployment Verification
echo ================================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo XXXX Node.js not found. Please install Node.js.
    exit /b 1
)
echo [OK] Node.js: checking...
node --version

REM Check npm
where npm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo XXXX npm not found.
    exit /b 1
)
echo [OK] npm installed

echo.
echo Checking project files...
echo ─────────────────────────────────────────────────

REM Check vite.config.js
findstr /M "base: '/'," vite.config.js >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [OK] vite.config.js: base path configured
) else (
    echo [WARN] vite.config.js: base path NOT configured
)

REM Check public/CNAME
if exist "public\CNAME" (
    echo [OK] public/CNAME exists
    type public\CNAME
) else (
    echo [ERROR] public/CNAME NOT found
)

REM Check public/.nojekyll
if exist "public\.nojekyll" (
    echo [OK] public/.nojekyll exists (Jekyll disabled)
) else (
    echo [WARN] public/.nojekyll NOT found
)

REM Check GitHub Actions workflow
if exist ".github\workflows\deploy.yml" (
    echo [OK] .github/workflows/deploy.yml exists
) else (
    echo [WARN] GitHub Actions workflow NOT found
)

echo.
echo Building project...
echo ─────────────────────────────────────────────────

call npm run build

if exist "dist" (
    echo [OK] Build successful: dist/ folder created
    
    echo.
    echo Checking dist/ folder contents...
    echo ─────────────────────────────────────────────────
    
    if exist "dist\index.html" (
        echo [OK] dist/index.html
    ) else (
        echo [ERROR] dist/index.html missing
    )
    
    if exist "dist\CNAME" (
        echo [OK] dist/CNAME:
        type dist\CNAME
    ) else (
        echo [ERROR] dist/CNAME missing - this will cause deployment issues!
    )
    
    if exist "dist\.nojekyll" (
        echo [OK] dist/.nojekyll
    ) else (
        echo [WARN] dist/.nojekyll missing
    )
    
    echo.
    echo Files in dist/:
    dir /B dist | find /V /C "" >nul && (
        dir /B dist | find /C /V "" && echo total files shown above
    )
    
) else (
    echo [ERROR] Build failed: dist/ folder not created
    exit /b 1
)

echo.
echo ================================================
echo   [OK] All checks passed! Ready to deploy.
echo ================================================
echo.
echo Next steps:
echo   1. git add .
echo   2. git commit -m "Setup GitHub Pages deployment"
echo   3. git push origin main
echo.
echo Watch deployment: https://github.com/YOUR_USERNAME/YOUR_REPO/actions
echo.
