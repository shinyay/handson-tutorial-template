#!/bin/bash

# Validate tutorial files
# Usage: ./validate.sh [docs-directory]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

DOCS_DIR="${1:-docs}"
ERRORS=0

echo "🔍 Validating tutorial files in $DOCS_DIR..."

# Check if docs directory exists
if [[ ! -d "$PROJECT_ROOT/$DOCS_DIR" ]]; then
    echo "❌ Error: Docs directory not found: $DOCS_DIR"
    exit 1
fi

# Function to validate a tutorial file
validate_tutorial() {
    local file="$1"
    local filename=$(basename "$file")
    local has_errors=0
    
    echo "📝 Validating: $filename"
    
    # Check required metadata fields
    local required_fields=("summary:" "id:" "categories:" "tags:" "status:" "authors:")
    
    for field in "${required_fields[@]}"; do
        if ! grep -q "^$field" "$file"; then
            echo "  ❌ Missing required field: $field"
            has_errors=1
        fi
    done
    
    # Check for valid status (only first occurrence)
    local status=$(grep "^status:" "$file" | head -1 | sed 's/^status: *//' | tr -d '\r')
    if [[ -n "$status" ]] && [[ ! "$status" =~ ^(Draft|Published|Hidden)$ ]]; then
        echo "  ❌ Invalid status: $status (must be Draft, Published, or Hidden)"
        has_errors=1
    fi
    
    # Check for valid ID format (only first occurrence)
    local id=$(grep "^id:" "$file" | head -1 | sed 's/^id: *//' | tr -d '\r')
    if [[ -n "$id" ]] && [[ ! "$id" =~ ^[a-z0-9-]+$ ]]; then
        echo "  ❌ Invalid ID format: $id (must be lowercase, numbers, and hyphens only)"
        has_errors=1
    fi
    
    # Check for duration fields in sections
    local section_count=$(grep -c "^## " "$file" || true)
    local duration_count=$(grep -c "^Duration:" "$file" || true)
    
    if [[ $section_count -gt 1 ]] && [[ $duration_count -eq 0 ]]; then
        echo "  ⚠️  Warning: No duration fields found (consider adding Duration: X to sections)"
    fi
    
    # Check for broken image links - simplified check
    local image_count=$(grep -c '](images/' "$file" 2>/dev/null || echo "0")
    if [[ $image_count -gt 0 ]]; then
        echo "  ℹ️  Found $image_count image references (manual validation recommended)"
    fi
    
    # Check for valid markdown structure
    if ! grep -q "^# " "$file"; then
        echo "  ❌ Missing main title (# Title)"
        has_errors=1
    fi
    
    if [[ $has_errors -eq 0 ]]; then
        echo "  ✅ Valid"
    else
        ERRORS=$((ERRORS + has_errors))
    fi
}

# Validate all markdown files
for file in "$PROJECT_ROOT/$DOCS_DIR"/*.md; do
    if [[ -f "$file" ]]; then
        validate_tutorial "$file"
    fi
done

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "✅ All tutorial files are valid!"
    exit 0
else
    echo "❌ Found $ERRORS validation errors"
    exit 1
fi