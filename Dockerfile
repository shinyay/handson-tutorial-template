# Multi-stage build for Codelabs Tutorial site
FROM nginx:alpine

# Set build arguments
ARG TUTORIAL_ID=sample-tutorial

# Copy configuration
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf.template

# Copy built tutorials
COPY dist/ /usr/share/nginx/html/

# Create a simple index if none exists
RUN if [ ! -f /usr/share/nginx/html/index.html ]; then \
    echo '<!DOCTYPE html><html><head><title>Codelabs Tutorials</title></head><body><h1>Welcome to Codelabs Tutorials</h1><p>Your tutorials will appear here after building.</p></body></html>' > /usr/share/nginx/html/index.html; \
    fi

# Environment variables
ENV PORT=8080
ENV HOST=0.0.0.0

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/ || exit 1

# Start nginx
CMD ["sh", "-c", "envsubst '$$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]