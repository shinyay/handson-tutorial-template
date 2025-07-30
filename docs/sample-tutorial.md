summary: Sample Codelabs Tutorial Template
id: sample-tutorial
categories: tutorial,getting-started
tags: codelabs,tutorial,template
status: Published
authors: Coding Agent
Feedback Link: https://github.com/shinyay/handson-tutorial-template

# Getting Started with Codelabs Tutorial Framework
<!-- ------------------------ -->
## Overview 
Duration: 5

### What You'll Learn
- How to create tutorials using Codelabs format
- How to convert Markdown to interactive HTML
- How to deploy tutorials using containers
- How to integrate with automation tools
- How to publish tutorials via GitHub Pages

### Prerequisites
This tutorial assumes you have:
- Basic knowledge of Markdown
- Docker installed (for containerization)
- Git and GitHub account (for publishing)
- Node.js and npm (for advanced features)

<!-- ------------------------ -->
## Setting Up Your Environment
Duration: 10

### Required Tools
To use this template effectively, you'll need:

**Core Tools:**
- [claat](https://github.com/googlecodelabs/tools/tree/master/claat) - Google's Codelabs command-line tool
- [Docker](https://www.docker.com/) - For containerization and deployment
- [Git](https://git-scm.com/) - For version control and publishing

**Optional Tools:**
- [Node.js](https://nodejs.org/) - For advanced site customization
- [Go](https://golang.org/) - To build claat from source

### Installation Commands
Install claat using Go:
```bash
go install github.com/googlecodelabs/tools/claat@latest
```

Or use our Docker image:
```bash
docker pull shinyay/claat
```

### Verify Installation
Check that claat is installed correctly:
```bash
claat version
```

<!-- ------------------------ -->
## Creating Your First Tutorial
Duration: 15

### Tutorial Structure
Each tutorial is a Markdown file with special metadata at the top:

```markdown
summary: Your tutorial summary
id: unique-tutorial-id
categories: category1,category2
tags: tag1,tag2,tag3
status: Published
authors: Your Name
Feedback Link: https://your-feedback-url
```

### Writing Content
Use standard Markdown syntax with these special features:

**Duration Tracking:**
Each section should include a duration:
```markdown
## Section Title
Duration: 5
```

**Code Blocks:**
Support multiple languages:
```javascript
console.log("Hello, Codelabs!");
```

```bash
echo "Command line examples"
```

**Callouts:**
Use positive and negative callouts:

Positive
: This is helpful information

Negative
: This is a warning or important note

### Images and Assets
Place images in the `images/` directory and reference them:
```markdown
![Description](images/sample-image.png)
```

<!-- ------------------------ -->
## Converting to HTML
Duration: 8

### Using claat Command
Convert your Markdown to HTML:
```bash
claat export docs/sample-tutorial.md
```

This creates a directory with HTML files ready for hosting.

### Using Docker
If you prefer Docker:
```bash
docker run --rm -v $(pwd):/app shinyay/claat export docs/sample-tutorial.md
```

### Serving Locally
Test your tutorial locally:
```bash
claat serve
```

Or with Docker:
```bash
docker run --rm -v $(pwd):/app -p 9090:9090 shinyay/claat serve -addr 0.0.0.0:9090
```

<!-- ------------------------ -->
## Automation and Scripts
Duration: 10

### Available Scripts
This template includes several automation scripts:

**Export Script** (`scripts/export.sh`):
```bash
./scripts/export.sh docs/sample-tutorial.md
```

**Serve Script** (`scripts/serve.sh`):
```bash
./scripts/serve.sh
```

**Build Script** (`scripts/build.sh`):
```bash
./scripts/build.sh
```

### Coding Agent Integration
For automated tutorial creation, use these entry points:

1. **Configuration File**: `config/tutorial-config.yaml`
2. **Template Directory**: `examples/`
3. **Automation Scripts**: `scripts/`
4. **Build Pipeline**: `.github/workflows/`

### Batch Processing
Process multiple tutorials:
```bash
./scripts/export-all.sh
```

<!-- ------------------------ -->
## Containerization and Deployment
Duration: 12

### Docker Build
Build a container with your tutorials:
```bash
docker build -t my-codelabs .
```

### Docker Compose
For development with live reload:
```bash
docker-compose up
```

### GitHub Pages
This template includes GitHub Actions for automatic deployment:

1. Push changes to the `main` branch
2. GitHub Actions builds and deploys to GitHub Pages
3. Your tutorials are available at `https://username.github.io/repository-name`

### Manual Deployment
Deploy to various platforms:

**Cloud Run:**
```bash
gcloud run deploy --image gcr.io/project/image --platform managed
```

**Kubernetes:**
```bash
kubectl apply -f k8s/
```

**App Engine:**
```bash
gcloud app deploy
```

<!-- ------------------------ -->
## Customization and Theming
Duration: 8

### Custom Styles
Modify the appearance by editing:
- `styles/custom.css` - Custom CSS
- `images/icons/` - Category icons
- `templates/` - HTML templates

### Branding
Update branding elements:
1. Replace logos in `images/`
2. Update colors in CSS
3. Modify footer links
4. Customize category icons

### Multiple Views
Support different tutorial collections:
```yaml
views:
  - id: getting-started
    title: Getting Started Tutorials
  - id: advanced
    title: Advanced Topics
```

<!-- ------------------------ -->
## Best Practices
Duration: 5

### Content Guidelines
- Keep sections focused and concise
- Include realistic time estimates
- Use clear, actionable instructions
- Test all code examples
- Include troubleshooting sections

### Organization
- Use descriptive tutorial IDs
- Organize by categories and tags
- Include proper metadata
- Version your content
- Maintain a content index

### Automation
- Use consistent naming conventions
- Implement validation scripts
- Set up automated testing
- Monitor deployment status
- Track user engagement

<!-- ------------------------ -->
## Troubleshooting
Duration: 3

### Common Issues

**claat not found:**
```bash
export PATH=$PATH:$(go env GOPATH)/bin
```

**Docker permission errors:**
```bash
sudo usermod -aG docker $USER
```

**Build failures:**
Check the tutorial metadata format and ensure all required fields are present.

**Deployment issues:**
Verify GitHub Pages is enabled in repository settings.

<!-- ------------------------ -->
## Next Steps
Duration: 2

Congratulations! You've completed the Codelabs Tutorial Framework tutorial.

### What's Next?
- Create your own tutorial using this template
- Explore advanced customization options
- Set up automated publishing workflows
- Integrate with your development pipeline
- Share your tutorials with the community

### Additional Resources
- [Google Codelabs Tools](https://github.com/googlecodelabs/tools)
- [Markdown Guide](https://www.markdownguide.org/)
- [Docker Documentation](https://docs.docker.com/)
- [GitHub Actions Guide](https://docs.github.com/en/actions)

### Feedback
Have questions or suggestions? Please open an issue in the [GitHub repository](https://github.com/shinyay/handson-tutorial-template).