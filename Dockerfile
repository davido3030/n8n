# Use official n8n image
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Set environment variables for Railway
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=America/New_York
ENV N8N_METRICS=true
ENV N8N_LOG_LEVEL=info

# Create necessary directories
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node
USER node

# Expose the port n8n runs on
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:5678/healthz || exit 1

# Use the default n8n entrypoint
CMD ["n8n", "start"]