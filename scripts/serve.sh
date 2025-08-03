#!/bin/bash

# Serve Codelabs Tutorial locally
# Usage: ./serve.sh [port]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

PORT="${1:-9090}"
CODELABS_DIR="${2:-dist}"

echo "🚀 Starting Codelabs server..."
echo "🌐 Port: $PORT"
echo "📁 Serving from: $CODELABS_DIR"

cd "$PROJECT_ROOT"

# Check if claat is available
if command -v claat &> /dev/null; then
    echo "📦 Using local claat installation"
    claat serve -addr "0.0.0.0:$PORT" -codelabs-dir "$CODELABS_DIR"
else
    echo "🐳 Using Docker claat image"
    docker run --rm -it \
        -v "$PROJECT_ROOT:/app" \
        -w /app \
        -p "$PORT:$PORT" \
        shinyay/claat serve -addr "0.0.0.0:$PORT" -codelabs-dir "$CODELABS_DIR"
fi