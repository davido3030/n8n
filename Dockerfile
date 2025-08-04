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
ENV N8N_DISABLE_UI=false
ENV N8N_BASIC_AUTH_ACTIVE=false

# Railway-specific environment
ENV PORT=5678
ENV NODE_ENV=production

# Create necessary directories and set permissions
USER root
RUN mkdir -p /home/node/.n8n && \
    mkdir -p /home/node/.n8n/nodes && \
    chown -R node:node /home/node && \
    chmod -R 755 /home/node/.n8n

# Copy startup script
COPY start-n8n.sh /usr/local/bin/start-n8n.sh
RUN chmod +x /usr/local/bin/start-n8n.sh

# Switch back to node user
USER node

# Expose the port n8n runs on
EXPOSE 5678

# Remove problematic healthcheck for now
# Railway will handle health checking via HTTP requests

# Use startup script
CMD ["/usr/local/bin/start-n8n.sh"]