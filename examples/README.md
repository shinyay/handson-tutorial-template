# Codelabs Tutorial Examples

This directory contains examples and templates for creating Codelabs tutorials.

## Files

### `tutorial-template.md`
A template file with placeholders that can be used to generate new tutorials programmatically. Replace the placeholders (marked with `{PLACEHOLDER}`) with actual content.

### Usage with Coding Agent

For automated tutorial generation, you can use this template with variable substitution:

```bash
# Copy template
cp examples/tutorial-template.md docs/my-new-tutorial.md

# Replace placeholders (example with sed)
sed -i 's/{TUTORIAL_ID}/my-new-tutorial/g' docs/my-new-tutorial.md
sed -i 's/{TUTORIAL_TITLE}/My New Tutorial/g' docs/my-new-tutorial.md
# ... continue for all placeholders
```

### Placeholders Reference

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{TUTORIAL_ID}` | Unique identifier | `my-tutorial` |
| `{TUTORIAL_TITLE}` | Display title | `My Amazing Tutorial` |
| `{TUTORIAL_SUMMARY}` | Brief description | `Learn to build amazing things` |
| `{CATEGORIES}` | Comma-separated categories | `web,javascript,tutorial` |
| `{TAGS}` | Comma-separated tags | `beginner,frontend,react` |
| `{STATUS}` | Publication status | `Published`, `Draft`, `Hidden` |
| `{AUTHORS}` | Author names | `John Doe, Jane Smith` |
| `{FEEDBACK_LINK}` | Feedback URL | `https://github.com/user/repo/issues` |
| `{*_DURATION}` | Section duration in minutes | `5`, `10`, `15` |
| `{*_CONTENT}` | Section-specific content | Markdown content |

## Automation Examples

### Script-based Generation
```bash
#!/bin/bash
# generate-tutorial.sh

TUTORIAL_ID="$1"
TUTORIAL_TITLE="$2"

cp examples/tutorial-template.md "docs/${TUTORIAL_ID}.md"
sed -i "s/{TUTORIAL_ID}/${TUTORIAL_ID}/g" "docs/${TUTORIAL_ID}.md"
sed -i "s/{TUTORIAL_TITLE}/${TUTORIAL_TITLE}/g" "docs/${TUTORIAL_ID}.md"
# Add more replacements as needed
```

### API Integration
For Coding Agent integration, expose these templates through configuration or API endpoints for programmatic tutorial creation.