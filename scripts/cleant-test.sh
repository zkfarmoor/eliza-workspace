#!/bin/bash

# Clean all build artifacts and dependencies
echo "🧹 Cleaning workspace..."

# Clean root level
rm -rf node_modules
rm -f pnpm-lock.yaml

# Clean packages
for pkg in packages/*; do
  if [ -d "$pkg" ]; then
    echo "Cleaning $pkg..."
    rm -rf "$pkg/node_modules"
    rm -rf "$pkg/dist"
    rm -rf "$pkg/.turbo"
  fi
done

# Clean docs
if [ -d "docs" ]; then
  echo "Cleaning docs..."
  rm -rf "docs/node_modules"
  rm -rf "docs/.vitepress/dist"
  rm -rf "docs/.vitepress/cache"
fi

echo "✨ Workspace cleaned!"