# Codelabs Tutorial Framework Template

A robust, reusable template repository for building and publishing interactive tutorials with Google Codelabs, designed for seamless Coding Agent integration.

![Codelabs](https://img.shields.io/badge/Codelabs-Ready-blue)
![Docker](https://img.shields.io/badge/Docker-Supported-blue)
![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Auto%20Deploy-green)
![Coding Agent](https://img.shields.io/badge/Coding%20Agent-Compatible-orange)

## 🎯 Overview

This template provides everything you need to create, build, and deploy interactive coding tutorials using Google's Codelabs format. It supports multiple deployment options and includes automation scripts perfect for Coding Agent integration.

### ✨ Key Features

- 📝 **Markdown-based Tutorial Authoring** - Write tutorials in familiar Markdown format
- 🔄 **Automated HTML Conversion** - Convert Markdown to interactive Codelabs HTML
- 🐳 **Containerized Deployment** - Docker support for easy hosting
- 🚀 **GitHub Pages Integration** - Automatic deployment via GitHub Actions
- 🤖 **Coding Agent Ready** - Clear automation entry points and scripting
- 📊 **Tutorial Management** - Support for categories, tags, authors, and metadata
- 🎨 **Customizable Themes** - Adaptable styling and branding

## 🚀 Quick Start

### Prerequisites

- [Git](https://git-scm.com/) for version control
- [Docker](https://www.docker.com/) for containerization (optional)
- [Go](https://golang.org/) for claat installation (optional)

### 1. Use This Template

Click the "Use this template" button on GitHub or clone this repository:

```bash
git clone https://github.com/shinyay/handson-tutorial-template.git
cd handson-tutorial-template
```

### 2. Install claat (Option A: Go)

```bash
go install github.com/googlecodelabs/tools/claat@latest
```

### 2. Use Docker (Option B: Recommended)

No installation required! Scripts will use the Docker image automatically.

### 3. Create Your First Tutorial

Edit the sample tutorial or create a new one:

```bash
cp docs/sample-tutorial.md docs/my-tutorial.md
# Edit docs/my-tutorial.md with your content
```

### 4. Export to HTML

```bash
./scripts/export.sh docs/my-tutorial.md
```

### 5. Serve Locally

```bash
./scripts/serve.sh
```

Visit `http://localhost:9090` to see your tutorial!

## 📁 Project Structure

```
handson-tutorial-template/
├── docs/                    # Markdown tutorial files
│   └── sample-tutorial.md   # Example tutorial
├── images/                  # Tutorial assets and images
│   └── icons/              # Category icons
├── scripts/                # Automation scripts
│   ├── export.sh           # Export Markdown to HTML
│   ├── export-all.sh       # Export all tutorials
│   ├── serve.sh            # Local development server
│   └── build.sh            # Docker build script
├── examples/               # Template examples
│   ├── tutorial-template.md # Tutorial template with placeholders
│   └── README.md           # Example documentation
├── config/                 # Configuration files
│   └── tutorial-config.yaml # Tutorial configuration template
├── docker/                 # Docker configuration
│   └── nginx.conf          # Nginx configuration
├── .github/workflows/      # GitHub Actions
│   └── deploy.yml          # Auto-deployment workflow
├── Dockerfile              # Container definition
├── docker-compose.yml      # Development environment
└── README.md              # This file
```

## 📝 Writing Tutorials

### Tutorial Format

Each tutorial is a Markdown file with special metadata at the top:

```markdown
summary: Your tutorial summary
id: unique-tutorial-id
categories: category1,category2
tags: tag1,tag2,tag3
status: Published
authors: Your Name
Feedback Link: https://your-feedback-url

# Tutorial Title
<!-- ------------------------ -->
## Section Title
Duration: 5

Your content here...
```

### Special Features

**Duration Tracking:**
```markdown
## Section Title
Duration: 10
```

**Callout Boxes:**
```markdown
Positive
: This is helpful information

Negative
: This is a warning
```

**Code Blocks:**
```markdown
```bash
echo "Hello, Codelabs!"
```

### Images and Assets

Place images in the `images/` directory and reference them:

```markdown
![Description](images/your-image.png)
```

## 🛠 Available Scripts

### Export Scripts

```bash
# Export single tutorial
./scripts/export.sh docs/tutorial.md

# Export all tutorials
./scripts/export-all.sh

# Custom output directory
./scripts/export.sh docs/tutorial.md custom-output/
```

### Development Server

```bash
# Start local server (default port 9090)
./scripts/serve.sh

# Custom port
./scripts/serve.sh 8080

# Custom codelabs directory
./scripts/serve.sh 9090 custom-dist/
```

### Docker Build

```bash
# Build Docker image
./scripts/build.sh

# Custom image name and tag
./scripts/build.sh my-codelabs latest

# Run built container
docker run -p 8080:8080 my-codelabs:latest
```

## 🐳 Docker Usage

### Development with Docker Compose

```bash
# Start development environment
docker-compose up

# Export tutorials and serve
docker-compose run export-tutorials
docker-compose up codelabs-dev

# Production build
docker-compose --profile production up codelabs-prod
```

### Manual Docker Commands

```bash
# Export tutorials
docker run --rm -v $(pwd):/app shinyay/claat export docs/sample-tutorial.md

# Serve tutorials
docker run --rm -v $(pwd):/app -p 9090:9090 shinyay/claat serve -addr 0.0.0.0:9090
```

## 🚀 Deployment Options

### GitHub Pages (Automatic)

1. Enable GitHub Pages in repository settings
2. Push to the `main` branch
3. GitHub Actions automatically builds and deploys

### Cloud Run

```bash
# Build and push to Container Registry
gcloud builds submit --tag gcr.io/PROJECT-ID/codelabs

# Deploy to Cloud Run
gcloud run deploy --image gcr.io/PROJECT-ID/codelabs --platform managed
```

### Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/
```

### App Engine

```bash
# Deploy to App Engine
gcloud app deploy
```

## 🤖 Coding Agent Integration

This template is designed for seamless Coding Agent automation:

### Entry Points

1. **Configuration**: `config/tutorial-config.yaml`
2. **Templates**: `examples/tutorial-template.md`
3. **Scripts**: `scripts/` directory
4. **Automation**: `.github/workflows/`

### Automation Scripts

```bash
# Programmatic tutorial creation
./scripts/create-tutorial.sh "My Tutorial" "my-tutorial" "tutorial,demo"

# Batch processing
./scripts/export-all.sh

# Automated deployment
./scripts/build.sh && docker push my-registry/codelabs
```

### API Integration

The template supports programmatic tutorial generation through:

- **Template substitution** using `examples/tutorial-template.md`
- **Configuration-driven builds** via `config/tutorial-config.yaml`
- **Scripted automation** through shell scripts
- **CI/CD integration** with GitHub Actions

### Example Coding Agent Usage

```python
# Python example for Coding Agent
import subprocess
import yaml

# Load configuration
with open('config/tutorial-config.yaml') as f:
    config = yaml.safe_load(f)

# Generate tutorial from template
subprocess.run(['./scripts/create-tutorial.sh', 
               config['tutorial']['title'],
               config['tutorial']['id']])

# Export to HTML
subprocess.run(['./scripts/export.sh', f"docs/{config['tutorial']['id']}.md"])

# Deploy
subprocess.run(['./scripts/build.sh'])
```

## 🎨 Customization

### Styling

- Modify CSS in generated HTML
- Update category icons in `images/icons/`
- Customize Docker nginx configuration

### Branding

- Replace logos and images
- Update footer links in templates
- Modify color schemes

### Categories and Tags

Add custom categories by:
1. Using them in tutorial metadata
2. Adding corresponding icons to `images/icons/`
3. Updating styles if needed

## 📊 Tutorial Metadata

### Required Fields

- `summary` - Brief description
- `id` - Unique identifier (used for URLs)
- `categories` - Comma-separated categories
- `tags` - Comma-separated tags
- `status` - Published, Draft, or Hidden
- `authors` - Author name(s)

### Optional Fields

- `Feedback Link` - URL for feedback
- Custom metadata for specific use cases

## 🔧 Configuration

### Environment Variables

- `PORT` - Server port (default: 8080 for Docker, 9090 for claat)
- `CODELABS_DIR` - Directory containing exported tutorials

### Build Arguments

- `TUTORIAL_ID` - Specific tutorial to build (Docker)

## 🐛 Troubleshooting

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
- Check tutorial metadata format
- Ensure all required fields are present
- Verify Markdown syntax

**Deployment issues:**
- Confirm GitHub Pages is enabled
- Check GitHub Actions logs
- Verify repository permissions

### Debug Mode

Enable verbose output:
```bash
DEBUG=true ./scripts/export.sh docs/tutorial.md
```

## 📚 Examples

See the `examples/` directory for:
- Tutorial templates with placeholders
- Configuration examples
- Automation scripts
- Integration patterns

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Google Codelabs Tools](https://github.com/googlecodelabs/tools)
- [claat](https://github.com/googlecodelabs/tools/tree/master/claat)
- Original inspiration from [shinyay/codelabs-getting-started](https://github.com/shinyay/codelabs-getting-started)

## 📞 Support

- 📖 [Documentation](https://github.com/shinyay/handson-tutorial-template/wiki)
- 🐛 [Issue Tracker](https://github.com/shinyay/handson-tutorial-template/issues)
- 💬 [Discussions](https://github.com/shinyay/handson-tutorial-template/discussions)

---

**Ready to create amazing tutorials? Start with our [sample tutorial](docs/sample-tutorial.md) and customize from there!** 🚀