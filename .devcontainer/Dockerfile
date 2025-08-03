# Use Ubuntu as base image for better compatibility
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV GO_VERSION=1.21.5
ENV NODE_VERSION=20
ENV CLAAT_VERSION=latest

# Install basic packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    tree \
    jq \
    unzip \
    zip \
    shellcheck \
    && rm -rf /var/lib/apt/lists/*

# Install Go
RUN wget -O go.tar.gz "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" \
    && tar -C /usr/local -xzf go.tar.gz \
    && rm go.tar.gz

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get install -y nodejs

# Set up Go environment
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV GOBIN="/go/bin"

# Create Go directories with proper ownership
RUN mkdir -p /go/src /go/bin /go/pkg && chown -R vscode:vscode /go

# Install claat CLI tool
RUN go install github.com/googlecodelabs/tools/claat@${CLAAT_VERSION}

# Update PATH to include Go bin
ENV PATH="${GOBIN}:${PATH}"

# Install useful global npm packages for markdown/documentation work
RUN npm install -g \
    markdownlint-cli \
    prettier \
    http-server \
    live-server

# Create workspace directory
RUN mkdir -p /workspace

# Set up bash completion and history
RUN echo 'source /etc/bash_completion' >> /home/vscode/.bashrc \
    && echo 'export HISTFILE=/commandhistory/.bash_history' >> /home/vscode/.bashrc \
    && echo 'export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"' >> /home/vscode/.bashrc

# Add useful aliases
RUN echo 'alias ll="ls -alF"' >> /home/vscode/.bashrc \
    && echo 'alias la="ls -A"' >> /home/vscode/.bashrc \
    && echo 'alias l="ls -CF"' >> /home/vscode/.bashrc \
    && echo 'alias claat-export="claat export"' >> /home/vscode/.bashrc \
    && echo 'alias claat-serve="claat serve -addr 0.0.0.0:9090"' >> /home/vscode/.bashrc \
    && echo 'alias tutorial-serve="./scripts/serve.sh"' >> /home/vscode/.bashrc \
    && echo 'alias tutorial-export="./scripts/export.sh"' >> /home/vscode/.bashrc

# Set up Git configuration template
RUN echo '[user]' > /home/vscode/.gitconfig \
    && echo '  # name = Your Name' >> /home/vscode/.gitconfig \
    && echo '  # email = your.email@example.com' >> /home/vscode/.gitconfig \
    && echo '[init]' >> /home/vscode/.gitconfig \
    && echo '  defaultBranch = main' >> /home/vscode/.gitconfig \
    && echo '[pull]' >> /home/vscode/.gitconfig \
    && echo '  rebase = false' >> /home/vscode/.gitconfig

# Create command history directory
RUN mkdir -p /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R vscode:vscode /commandhistory

# Set ownership
RUN chown -R vscode:vscode /go /workspace /home/vscode

# Switch to vscode user for final setup
USER vscode

# Ensure PATH is set in user profile
RUN echo 'export PATH="/go/bin:/usr/local/go/bin:$PATH"' >> /home/vscode/.bashrc \
    && echo 'export GOPATH="/go"' >> /home/vscode/.bashrc \
    && echo 'export GOBIN="/go/bin"' >> /home/vscode/.bashrc

# Set working directory
WORKDIR /workspace

# Verify installations as vscode user
RUN go version \
    && node --version \
    && npm --version \
    && /go/bin/claat version

# Default command
CMD ["sleep", "infinity"]
