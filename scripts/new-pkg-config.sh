#!/bin/bash

echo "🔧 Configuring packages for turborepo..."

# Configure eliza-core root package.json
echo "Configuring eliza-core root package.json..."
cd packages/eliza-core || exit

# Update package.json build scripts
if [ -f "package.json" ]; then
    # Create temporary file
    jq '.scripts = {
        "preinstall": "npx only-allow pnpm",
        "build": "turbo run build --filter=\"packages/**\"",
        "setup-playwright": "cd packages/plugin-node && npx playwright install-deps && npx playwright install",
        "dev": "turbo run dev --parallel",
        "lint": "turbo run lint",
        "clean": "turbo run clean && rm -rf node_modules"
    }' package.json > temp.json && mv temp.json package.json
fi

# Create turbo.json if it doesn't exist
if [ ! -f "turbo.json" ]; then
    cat > turbo.json << 'EOF'
{
    "$schema": "https://turbo.build/schema.json",
    "tasks": {
        "build": {
            "dependsOn": ["^build"],
            "outputs": ["dist/**"]
        },
        "dev": {
            "cache": false,
            "persistent": true
        },
        "lint": {},
        "clean": {
            "cache": false
        }
    }
}
EOF
fi

# Function to add tsup config to a package
add_tsup_config() {
    local package_dir=$1
    if [ ! -f "$package_dir/tsup.config.ts" ]; then
        cat > "$package_dir/tsup.config.ts" << 'EOF'
import { defineConfig } from "tsup";

export default defineConfig({
    entry: ["src/index.ts"],
    outDir: "dist",
    sourcemap: true,
    clean: true,
    format: ["esm"],
    external: [
        "fs",
        "path",
        "http",
        "https",
        "@reflink/reflink",
        "@node-llama-cpp",
        "agentkeepalive",
        "better-sqlite3"
    ],
});
EOF
    fi
}

# Configure core packages
for pkg in packages/eliza-core/packages/*; do
    if [ -d "$pkg" ]; then
        echo "Configuring $pkg..."
        add_tsup_config "$pkg"
        
        # Update package.json build script
        if [ -f "$pkg/package.json" ]; then
            jq '.scripts.build = "tsup"' "$pkg/package.json" > temp.json && mv temp.json "$pkg/package.json"
            
            # Add tsup as dev dependency if not present
            if ! jq -e '.devDependencies.tsup' "$pkg/package.json" > /dev/null; then
                jq '.devDependencies = (.devDependencies // {}) + {"tsup": "^8.0.0"}' "$pkg/package.json" > temp.json && mv temp.json "$pkg/package.json"
            fi
        fi
    fi
done

# Return to root
cd ../../

echo "✅ Package configuration complete"