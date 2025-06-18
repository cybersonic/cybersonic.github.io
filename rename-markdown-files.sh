#!/bin/bash

echo "🔄 Renaming all .markdown files to .md using git mv..."

# Find all .markdown files and rename them
find _posts -name "*.markdown" -type f | while read file; do
    # Get the new filename by replacing .markdown with .md
    new_file="${file%.markdown}.md"
    
    echo "📝 Renaming: $file -> $new_file"
    git mv "$file" "$new_file"
    
    if [ $? -eq 0 ]; then
        echo "✅ Successfully renamed: $file"
    else
        echo "❌ Failed to rename: $file"
    fi
done

echo ""
echo "🎉 Finished renaming files!"
echo ""
echo "📊 Summary:"
echo "   • Total .md files now: $(find _posts -name "*.md" | wc -l | tr -d ' ')"
echo "   • Remaining .markdown files: $(find _posts -name "*.markdown" | wc -l | tr -d ' ')"
echo ""
echo "🧪 Testing 11ty build..."
npx @11ty/eleventy --quiet

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 11ty build successful!"
    echo "🎯 You can now commit these changes with:"
    echo "   git commit -m 'Rename .markdown files to .md for 11ty compatibility'"
else
    echo ""
    echo "❌ 11ty build failed. Check the errors above."
fi

