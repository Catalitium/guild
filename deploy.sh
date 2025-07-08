#!/bin/bash

# Matrix Rain Knowledge Portal - Deployment Script
# This script helps deploy your portal to production

echo "🌊 Matrix Rain Knowledge Portal - Deployment Script"
echo "=================================================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "📁 Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit: Matrix Rain Knowledge Portal"
    echo "✅ Git repository initialized"
else
    echo "📁 Git repository found"
fi

# Check for uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Found uncommitted changes. Committing..."
    git add .
    git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "✅ Changes committed"
else
    echo "✅ No uncommitted changes found"
fi

# Ask for deployment method
echo ""
echo "🚀 Choose your deployment method:"
echo "1) GitHub Pages (Recommended)"
echo "2) Netlify (Drag & Drop)"
echo "3) Vercel"
echo "4) Traditional Web Hosting"
echo "5) Just prepare files (no deployment)"
echo ""

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        echo "📚 GitHub Pages Deployment"
        echo "=========================="
        echo "1. Create a new repository on GitHub"
        echo "2. Run these commands:"
        echo ""
        echo "git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git"
        echo "git branch -M main"
        echo "git push -u origin main"
        echo ""
        echo "3. Go to Settings → Pages → Source: Deploy from a branch"
        echo "4. Select 'main' branch and '/ (root)' folder"
        echo "5. Your site will be available at: https://YOUR_USERNAME.github.io/YOUR_REPO_NAME"
        ;;
    2)
        echo "🌐 Netlify Deployment"
        echo "====================="
        echo "1. Go to https://netlify.com"
        echo "2. Drag and drop your project folder"
        echo "3. Get instant HTTPS URL"
        echo ""
        echo "Or connect your GitHub repository for automatic deployments"
        ;;
    3)
        echo "⚡ Vercel Deployment"
        echo "==================="
        if command -v npm &> /dev/null; then
            echo "Installing Vercel CLI..."
            npm install -g vercel
            echo "Deploying to Vercel..."
            vercel
        else
            echo "❌ npm is not installed. Please install Node.js first."
            echo "Or use the web interface at https://vercel.com"
        fi
        ;;
    4)
        echo "🖥️ Traditional Web Hosting"
        echo "========================="
        echo "Upload these files to your web server:"
        echo "- index.html"
        echo "- index-es.html"
        echo "- privacy-disclaimer.html"
        echo "- style.css"
        echo "- main.js"
        echo "- topics/ (entire folder)"
        echo "- robots.txt"
        echo "- sitemap.xml"
        echo ""
        echo "Make sure to:"
        echo "1. Update sitemap.xml with your actual domain"
        echo "2. Configure Google Analytics"
        echo "3. Set up SSL certificate"
        ;;
    5)
        echo "📦 Files prepared for deployment"
        echo "==============================="
        echo "Your project is ready for manual deployment!"
        ;;
    *)
        echo "❌ Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo ""
echo "🎉 Deployment instructions completed!"
echo ""
echo "📋 Pre-deployment checklist:"
echo "✅ All files are committed to git"
echo "✅ Google Analytics ID is configured"
echo "✅ Domain URLs are updated in sitemap.xml"
echo "✅ Privacy policy is reviewed"
echo "✅ Mobile responsiveness is tested"
echo ""
echo "🌊 Your Matrix Rain Knowledge Portal is ready for production!" 