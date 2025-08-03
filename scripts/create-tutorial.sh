#!/bin/bash

# Create a new tutorial from template
# Usage: ./create-tutorial.sh "Tutorial Title" "tutorial-id" "category1,category2"

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

TITLE="${1:-New Tutorial}"
ID="${2:-new-tutorial}"
CATEGORIES="${3:-tutorial}"
TAGS="${4:-codelabs,tutorial}"
AUTHOR="${5:-$(git config user.name || echo 'Tutorial Author')}"

echo "🚀 Creating new tutorial..."
echo "📝 Title: $TITLE"
echo "🆔 ID: $ID"
echo "📂 Categories: $CATEGORIES"

# Create tutorial file from template
TUTORIAL_FILE="$PROJECT_ROOT/docs/$ID.md"

if [[ -f "$TUTORIAL_FILE" ]]; then
    echo "❌ Error: Tutorial file already exists: $TUTORIAL_FILE"
    exit 1
fi

# Copy template and replace placeholders
cp "$PROJECT_ROOT/examples/tutorial-template.md" "$TUTORIAL_FILE"

# Replace placeholders
sed -i.bak "s/{TUTORIAL_ID}/$ID/g" "$TUTORIAL_FILE"
sed -i.bak "s/{TUTORIAL_TITLE}/$TITLE/g" "$TUTORIAL_FILE"
sed -i.bak "s/{TUTORIAL_SUMMARY}/Learn $TITLE step by step/g" "$TUTORIAL_FILE"
sed -i.bak "s/{CATEGORIES}/$CATEGORIES/g" "$TUTORIAL_FILE"
sed -i.bak "s/{TAGS}/$TAGS/g" "$TUTORIAL_FILE"
sed -i.bak "s/{STATUS}/Draft/g" "$TUTORIAL_FILE"
sed -i.bak "s/{AUTHORS}/$AUTHOR/g" "$TUTORIAL_FILE"
sed -i.bak "s|{FEEDBACK_LINK}|https://github.com/shinyay/handson-tutorial-template/issues|g" "$TUTORIAL_FILE"

# Replace duration placeholders
sed -i.bak "s/{OVERVIEW_DURATION}/5/g" "$TUTORIAL_FILE"
sed -i.bak "s/{SETUP_DURATION}/10/g" "$TUTORIAL_FILE"
sed -i.bak "s/{IMPLEMENTATION_DURATION}/15/g" "$TUTORIAL_FILE"
sed -i.bak "s/{TESTING_DURATION}/5/g" "$TUTORIAL_FILE"
sed -i.bak "s/{DEPLOYMENT_DURATION}/8/g" "$TUTORIAL_FILE"
sed -i.bak "s/{CONCLUSION_DURATION}/2/g" "$TUTORIAL_FILE"

# Replace content placeholders with default content
sed -i.bak "s/{LEARNING_OBJECTIVES}/- How to use this tutorial framework/g" "$TUTORIAL_FILE"
sed -i.bak "s/{PREREQUISITES}/- Basic understanding of the topic/g" "$TUTORIAL_FILE"
sed -i.bak "s/{SETUP_INSTRUCTIONS}/Follow these steps to set up your environment for this tutorial./g" "$TUTORIAL_FILE"
sed -i.bak "s/{INSTALLATION_STEPS}/Installation commands go here/g" "$TUTORIAL_FILE"
sed -i.bak "s/{STEP1_TITLE}/Initial Setup/g" "$TUTORIAL_FILE"
sed -i.bak "s/{STEP1_CONTENT}/Configure your initial environment and settings./g" "$TUTORIAL_FILE"
sed -i.bak "s/{STEP2_TITLE}/Main Implementation/g" "$TUTORIAL_FILE"
sed -i.bak "s/{STEP2_CONTENT}/Implement the core functionality of your project./g" "$TUTORIAL_FILE"
sed -i.bak "s/{STEP3_TITLE}/Integration/g" "$TUTORIAL_FILE"
sed -i.bak "s/{STEP3_CONTENT}/Integrate all components and test the solution./g" "$TUTORIAL_FILE"
sed -i.bak "s/{TESTING_INSTRUCTIONS}/Testing commands go here/g" "$TUTORIAL_FILE"
sed -i.bak "s/{VALIDATION_STEPS}/1. Verify functionality/g" "$TUTORIAL_FILE"
sed -i.bak "s/{BUILD_INSTRUCTIONS}/Build commands go here/g" "$TUTORIAL_FILE"
sed -i.bak "s/{DEPLOYMENT_STEPS}/1. Prepare deployment/g" "$TUTORIAL_FILE"
sed -i.bak "s/{ACCOMPLISHMENTS}/- Successfully completed the tutorial/g" "$TUTORIAL_FILE"
sed -i.bak "s/{NEXT_STEPS}/- Explore advanced features/g" "$TUTORIAL_FILE"
sed -i.bak "s/{RESOURCES}/- Related Documentation/g" "$TUTORIAL_FILE"

# Remove backup file
rm -f "$TUTORIAL_FILE.bak"

echo "✅ Tutorial created successfully!"
echo "📁 File: $TUTORIAL_FILE"
echo ""
echo "📋 Next steps:"
echo "   1. Edit the tutorial content: $TUTORIAL_FILE"
echo "   2. Export to HTML: ./scripts/export.sh docs/$ID.md"
echo "   3. Serve locally: ./scripts/serve.sh"