#!/bin/bash

# Full installation script
echo "📦 Installing dependencies..."

# Check Node.js version
required_version="22.6.0"
current_version=$(node -v | cut -d'v' -f2)

if [ "$(printf '%s\n' "$required_version" "$current_version" | sort -V | head -n1)" != "$required_version" ]; then 
    echo "❌ Error: Node.js version must be $required_version or higher"
    exit 1
fi

# Install root dependencies
pnpm install

# Install Playwright dependencies where needed
echo "🎭 Installing Playwright dependencies..."
pnpm playwright:install

echo "✅ Installation complete!"