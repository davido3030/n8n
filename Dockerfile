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

# Expose the port n8n runs on
EXPOSE 5678

# Use the default n8n entrypoint
CMD ["n8n", "start"]