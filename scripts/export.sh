#!/bin/bash

# Export Codelabs Tutorial from Markdown to HTML
# Usage: ./export.sh [markdown-file]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Default input file
INPUT_FILE="${1:-docs/sample-tutorial.md}"
OUTPUT_DIR="${2:-dist}"

echo "🚀 Exporting Codelabs tutorial..."
echo "📝 Input: $INPUT_FILE"
echo "📁 Output: $OUTPUT_DIR"

# Check if input file exists
if [[ ! -f "$PROJECT_ROOT/$INPUT_FILE" ]]; then
    echo "❌ Error: Input file '$INPUT_FILE' not found"
    exit 1
fi

# Create output directory
mkdir -p "$PROJECT_ROOT/$OUTPUT_DIR"

# Check if claat is available
if command -v claat &> /dev/null; then
    echo "📦 Using local claat installation"
    cd "$PROJECT_ROOT"
    claat export -o "$OUTPUT_DIR" "$INPUT_FILE"
else
    echo "🐳 Using Docker claat image"
    docker run --rm -v "$PROJECT_ROOT:/app" -w /app \
        shinyay/claat export -o "$OUTPUT_DIR" "$INPUT_FILE"
fi

echo "✅ Export completed successfully!"
echo "🌐 Tutorial available in: $OUTPUT_DIR"

# Get tutorial ID from the markdown file
TUTORIAL_ID=$(grep "^id:" "$PROJECT_ROOT/$INPUT_FILE" | cut -d' ' -f2 | tr -d '\r')
if [[ -n "$TUTORIAL_ID" ]]; then
    echo "🔗 Tutorial ID: $TUTORIAL_ID"
    echo "📂 HTML files: $OUTPUT_DIR/$TUTORIAL_ID/"
fi