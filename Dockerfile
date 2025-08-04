# Use official n8n image
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Copy initialization scripts if needed
COPY init-data.sh /opt/
COPY setup-workflow-builder.sh /opt/

# Make scripts executable
RUN chmod +x /opt/init-data.sh /opt/setup-workflow-builder.sh

# Expose the port n8n runs on
EXPOSE 5678

# Use the default n8n entrypoint
CMD ["n8n"]