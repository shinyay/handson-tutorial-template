# Quick Start Guide

Get up and running with the Codelabs Tutorial Framework in 5 minutes!

## 1. Clone or Use Template
```bash
git clone https://github.com/shinyay/handson-tutorial-template.git
cd handson-tutorial-template
```

## 2. Create Your First Tutorial
```bash
./scripts/create-tutorial.sh "My First Tutorial" "my-first-tutorial" "beginner,tutorial"
```

## 3. Export to HTML
```bash
./scripts/export.sh docs/my-first-tutorial.md
```

## 4. Serve Locally
```bash
./scripts/serve.sh
```
Open http://localhost:9090 in your browser!

## 5. Deploy with Docker
```bash
./scripts/build.sh
docker run -p 8080:8080 codelabs-tutorial:latest
```
Open http://localhost:8080 in your browser!

## What's Next?
- Edit your tutorial in `docs/my-first-tutorial.md`
- Add images to `images/` directory
- Enable GitHub Pages for automatic deployment
- Integrate with your automation tools

## Need Help?
- Check the comprehensive [README.md](README.md)
- Review the [sample tutorial](docs/sample-tutorial.md)
- See [IMPLEMENTATION.md](IMPLEMENTATION.md) for technical details