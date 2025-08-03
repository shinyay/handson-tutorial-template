#!/bin/bash

# Post-create script for dev container setup
echo "🚀 Setting up Google Codelabs Tutorial Development Environment..."

# Make scripts executable
echo "📝 Making scripts executable..."
chmod +x /workspace/scripts/*.sh

# Install Go dependencies if go.mod exists
if [ -f "/workspace/go.mod" ]; then
    echo "📦 Installing Go dependencies..."
    cd /workspace && go mod download
fi

# Install npm dependencies if package.json exists
if [ -f "/workspace/package.json" ]; then
    echo "📦 Installing npm dependencies..."
    cd /workspace && npm install
fi

# Verify claat installation
echo "🔍 Verifying claat installation..."
if command -v claat &> /dev/null; then
    echo "✅ claat is installed: $(claat version)"
else
    echo "❌ claat is not installed"
fi

# Create sample tutorial if it doesn't exist
if [ ! -f "/workspace/docs/sample-tutorial.md" ]; then
    echo "📄 Creating sample tutorial..."
    mkdir -p /workspace/docs
    cp /workspace/examples/tutorial-template.md /workspace/docs/sample-tutorial.md
fi

# Set up Git hooks (optional)
if [ -d "/workspace/.git" ]; then
    echo "🔧 Setting up Git hooks..."
    mkdir -p /workspace/.git/hooks
    
    # Pre-commit hook to validate tutorials
    cat > /workspace/.git/hooks/pre-commit << 'EOF'
#!/bin/bash
echo "Validating tutorials before commit..."
if [ -f "/workspace/scripts/validate.sh" ]; then
    /workspace/scripts/validate.sh
fi
EOF
    chmod +x /workspace/.git/hooks/pre-commit
fi

# Display helpful information
echo ""
echo "🎉 Setup complete!"
echo ""
echo "📚 Google Codelabs Tutorial Development Environment"
echo "=================================================="
echo ""
echo "📖 Available commands:"
echo "  • claat export <file>     - Export markdown to codelab format"
echo "  • claat serve             - Start development server"
echo "  • tutorial-export         - Run export script"
echo "  • tutorial-serve          - Run serve script"
echo ""
echo "🔗 Useful URLs (when servers are running):"
echo "  • Claat Server: http://localhost:9090"
echo "  • Nginx Server: http://localhost:8080"
echo ""
echo "📁 Key directories:"
echo "  • /workspace/docs/        - Tutorial markdown files"
echo "  • /workspace/examples/    - Example templates"
echo "  • /workspace/scripts/     - Build and utility scripts"
echo "  • /workspace/config/      - Configuration files"
echo ""
echo "🚀 Get started:"
echo "  1. Edit or create tutorials in /workspace/docs/"
echo "  2. Run 'tutorial-export docs/your-tutorial.md' to export"
echo "  3. Run 'tutorial-serve' to start the development server"
echo ""
echo "Happy coding! 🎯"
