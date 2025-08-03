# Dev Container Configuration

This directory contains the development container configuration for the Google Codelabs Tutorial Development Environment.

## Files

- **`devcontainer.json`** - Main Dev Container configuration
- **`Dockerfile`** - Custom Docker image with claat CLI and development tools
- **`docker-compose.yml`** - Multi-container setup with nginx for serving tutorials
- **`post-create.sh`** - Post-creation script for environment setup

## Features

### Pre-installed Tools
- **claat CLI** - Google Codelabs command-line tool
- **Go** (latest) - For claat and Go development
- **Node.js** (LTS) - For npm packages and tooling
- **Git & GitHub CLI** - Version control and GitHub integration
- **Markdown tools** - markdownlint, prettier
- **Shell tools** - shellcheck, bash completion

### VS Code Extensions
- **GitHub Copilot & Copilot Chat** - AI-powered coding assistance
- **Markdown All in One** - Enhanced markdown editing
- **Markdown Lint** - Markdown linting and style checking
- **YAML Support** - For configuration files
- **Docker Support** - Container management
- **GitLens** - Enhanced Git integration
- **Shell Check** - Shell script linting
- **Live Server** - Local development server

### Port Forwarding
- **9090** - Claat development server
- **8080** - Nginx server for tutorial hosting
- **3000** - General development server

### Useful Aliases
- `claat-export` - Quick claat export command
- `claat-serve` - Start claat server on all interfaces
- `tutorial-serve` - Run the project's serve script
- `tutorial-export` - Run the project's export script

## Usage

1. **Open in Dev Container**: Use VS Code's "Reopen in Container" command
2. **Create tutorials**: Edit markdown files in the `docs/` directory
3. **Export tutorials**: Use `tutorial-export docs/your-tutorial.md`
4. **Serve tutorials**: Use `tutorial-serve` to start the development server
5. **View tutorials**: Open http://localhost:9090 in your browser

## Environment Variables

The container sets up the following environment:
- `GOPATH=/go` - Go workspace
- `GOBIN=/go/bin` - Go binaries
- Proper PATH configuration for all tools

## Volumes

- **Workspace** - Mounted as `/workspace` with cached consistency
- **Command history** - Persistent bash history across container rebuilds
- **Go modules** - Cached Go module downloads
- **Node modules** - Cached npm packages

## Networking

All containers are connected via the `tutorial-network` bridge network, allowing communication between the development container and nginx server.
