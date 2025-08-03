#!/bin/bash

# Build and export all tutorials
# Usage: ./export-all.sh [output-dir]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

OUTPUT_DIR="${1:-dist}"

echo "🚀 Exporting all Codelabs tutorials..."
echo "📁 Output directory: $OUTPUT_DIR"

# Clean output directory
rm -rf "$PROJECT_ROOT/$OUTPUT_DIR"
mkdir -p "$PROJECT_ROOT/$OUTPUT_DIR"

# Find all markdown files in docs directory
TUTORIAL_COUNT=0
for file in "$PROJECT_ROOT/docs"/*.md; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        echo "📝 Processing: $filename"
        
        # Use the export script for each file
        "$SCRIPT_DIR/export.sh" "docs/$filename" "$OUTPUT_DIR"
        
        ((TUTORIAL_COUNT++))
    fi
done

echo "✅ Exported $TUTORIAL_COUNT tutorials to $OUTPUT_DIR"

# Create an index file listing all tutorials
echo "📄 Creating tutorial index..."
cat > "$PROJECT_ROOT/$OUTPUT_DIR/index.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codelabs Tutorials</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; margin: 40px; }
        .header { text-align: center; margin-bottom: 40px; }
        .tutorials { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; }
        .tutorial-card { border: 1px solid #ddd; border-radius: 8px; padding: 20px; text-decoration: none; color: inherit; }
        .tutorial-card:hover { box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .tutorial-title { font-size: 1.2em; font-weight: bold; margin-bottom: 10px; }
        .tutorial-meta { color: #666; font-size: 0.9em; }
    </style>
</head>
<body>
    <div class="header">
        <h1>📚 Codelabs Tutorials</h1>
        <p>Interactive tutorials and hands-on coding experiences</p>
    </div>
    <div class="tutorials">
EOF

# Add links to each tutorial
for dir in "$PROJECT_ROOT/$OUTPUT_DIR"/*/; do
    if [[ -d "$dir" ]]; then
        tutorial_id=$(basename "$dir")
        if [[ "$tutorial_id" != "index.html" ]]; then
            echo "        <a href=\"$tutorial_id/\" class=\"tutorial-card\">" >> "$PROJECT_ROOT/$OUTPUT_DIR/index.html"
            echo "            <div class=\"tutorial-title\">$tutorial_id</div>" >> "$PROJECT_ROOT/$OUTPUT_DIR/index.html"
            echo "            <div class=\"tutorial-meta\">Interactive Tutorial</div>" >> "$PROJECT_ROOT/$OUTPUT_DIR/index.html"
            echo "        </a>" >> "$PROJECT_ROOT/$OUTPUT_DIR/index.html"
        fi
    fi
done

cat >> "$PROJECT_ROOT/$OUTPUT_DIR/index.html" << EOF
    </div>
</body>
</html>
EOF

echo "🔗 Tutorial index created at $OUTPUT_DIR/index.html"
echo "🎉 All tutorials exported successfully!"