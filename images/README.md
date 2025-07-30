# Tutorial Images

This directory contains images and assets used in tutorials.

## Directory Structure

```
images/
├── icons/          # Category and tag icons
├── logos/          # Brand logos and headers
├── screenshots/    # Tutorial screenshots
└── diagrams/       # Architecture and flow diagrams
```

## Image Guidelines

### File Formats
- **Screenshots**: PNG for clear text and UI elements
- **Photos**: JPEG for photographs and complex images
- **Icons**: SVG for scalable vector graphics
- **Diagrams**: SVG or PNG for technical diagrams

### Naming Conventions
- Use descriptive, lowercase names with hyphens
- Include context: `tutorial-name-step-number.png`
- For icons: `category-name.svg`

### Size Recommendations
- **Screenshots**: Maximum 1200px wide
- **Icons**: 64x64px or scalable SVG
- **Hero images**: 1200x630px for social sharing
- **Inline images**: 800px wide maximum

### Optimization
- Compress images for web delivery
- Use appropriate quality settings (80-90% for JPEG)
- Consider WebP format for modern browsers

## Usage in Tutorials

Reference images in your Markdown files:

```markdown
![Alt text](images/screenshot-example.png)
```

For better accessibility, always include descriptive alt text:

```markdown
![Dashboard showing three metrics cards with user count, revenue, and conversion rate](images/dashboard-overview.png)
```

## Adding New Images

1. Place images in the appropriate subdirectory
2. Use descriptive filenames
3. Optimize for web delivery
4. Update this README if adding new categories
5. Test image links in your tutorials

## Attribution

If using external images, ensure proper licensing and attribution:

```markdown
![Description](images/external-image.png)
*Image credit: [Source Name](https://example.com) (License)*
```