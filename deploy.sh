#!/bin/bash

# ScamRadar Deployment Script
# This script helps automate the deployment process

echo "🚀 ScamRadar Deployment Script"
echo "================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if we're in the right directory
if [ ! -f "README.md" ] || [ ! -d "Backend" ] || [ ! -d "Frontend" ]; then
    print_error "Please run this script from the ScamRadar root directory"
    exit 1
fi

print_status "Starting deployment preparation..."

# Step 1: Install dependencies
echo ""
echo "📦 Installing Backend Dependencies..."
cd Backend
npm install
if [ $? -eq 0 ]; then
    print_status "Backend dependencies installed successfully"
else
    print_error "Failed to install backend dependencies"
    exit 1
fi

echo ""
echo "📦 Installing Frontend Dependencies..."
cd ../Frontend
npm install
if [ $? -eq 0 ]; then
    print_status "Frontend dependencies installed successfully"
else
    print_error "Failed to install frontend dependencies"
    exit 1
fi

# Step 2: Build Frontend
echo ""
echo "🏗️  Building Frontend..."
npm run build
if [ $? -eq 0 ]; then
    print_status "Frontend built successfully"
else
    print_error "Frontend build failed"
    exit 1
fi

# Step 3: Test Backend
echo ""
echo "🧪 Testing Backend..."
cd ../Backend
npm start &
BACKEND_PID=$!
sleep 5

# Test if backend is running
if curl -f http://localhost:5000/ > /dev/null 2>&1; then
    print_status "Backend is running correctly"
    kill $BACKEND_PID
else
    print_warning "Backend test failed - check your configuration"
    kill $BACKEND_PID
fi

# Step 4: Git preparation
echo ""
echo "📝 Preparing Git repository..."
cd ..
git add .
git commit -m "Prepare for deployment: Add production configs and build assets"
git push origin main
print_status "Code pushed to GitHub"

echo ""
echo "🎉 Deployment Preparation Complete!"
echo ""
echo "Next Steps:"
echo "1. 🔗 Deploy Backend to Railway: https://railway.app/"
echo "2. 🌐 Deploy Frontend to Vercel: https://vercel.com/"
echo "3. 🔑 Configure environment variables on both platforms"
echo "4. 🧪 Test your deployed application"
echo ""
echo "📚 Check the docs/ folder for detailed deployment guides"
