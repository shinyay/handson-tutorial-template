#!/bin/bash

# Build Docker image for Codelabs tutorials
# Usage: ./build.sh [image-name] [tag]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

IMAGE_NAME="${1:-codelabs-tutorial}"
TAG="${2:-latest}"

echo "🚀 Building Docker image for Codelabs tutorials..."
echo "🏷️  Image: $IMAGE_NAME:$TAG"

# First, export all tutorials
echo "📝 Exporting tutorials..."
"$SCRIPT_DIR/export-all.sh"

# Build Docker image
echo "🐳 Building Docker image..."
cd "$PROJECT_ROOT"
docker build -t "$IMAGE_NAME:$TAG" .

echo "✅ Docker image built successfully!"
echo "🏷️  Image: $IMAGE_NAME:$TAG"

# Show usage instructions
echo ""
echo "📋 Usage instructions:"
echo "   Run container: docker run -p 8080:8080 $IMAGE_NAME:$TAG"
echo "   Access at: http://localhost:8080"