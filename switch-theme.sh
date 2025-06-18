#!/bin/bash

# Theme switcher script
echo "Current theme options:"
echo "1. Water.css (clean, modern)"
echo "2. Retro (terminal-style)"
echo ""
read -p "Choose theme (1 or 2): " choice

case $choice in
    1)
        echo "Switching to Water.css theme..."
        # Update site.json
        sed -i.bak 's/"theme": "[^"]*"/"theme": "water"/' _data/site.json
        # Update layouts to use Water.css
        sed -i.bak 's/layout: base\.njk/layout: base-water.njk/' _includes/post.njk
        sed -i.bak 's/layout: base\.njk/layout: base-water.njk/' _includes/page.njk
        echo "✅ Switched to Water.css theme"
        ;;
    2)
        echo "Switching to Retro theme..."
        # Update site.json
        sed -i.bak 's/"theme": "[^"]*"/"theme": "retro"/' _data/site.json
        # Update layouts to use retro theme
        sed -i.bak 's/layout: base-water\.njk/layout: base.njk/' _includes/post.njk
        sed -i.bak 's/layout: base-water\.njk/layout: base.njk/' _includes/page.njk
        echo "✅ Switched to Retro theme"
        ;;
    *)
        echo "❌ Invalid choice. Please run again and choose 1 or 2."
        exit 1
        ;;
esac

echo ""
echo "🔄 Rebuilding site..."
npm run build

echo ""
echo "🚀 Theme switch complete! Your blog is now using the selected theme."
echo "Run ./run.sh to start the development server."

