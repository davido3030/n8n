#!/bin/bash

# n8n startup script for Railway
set -e

echo "🚀 Starting n8n on Railway..."
echo "Environment variables:"
echo "N8N_HOST: $N8N_HOST"
echo "N8N_PORT: $N8N_PORT"
echo "PORT: $PORT"

# Ensure .n8n directory exists
mkdir -p /home/node/.n8n

# Initialize n8n if needed
if [ ! -f /home/node/.n8n/config ]; then
    echo "🔧 Initializing n8n configuration..."
    n8n init
fi

# Start n8n
echo "▶️ Starting n8n server..."
exec n8n start