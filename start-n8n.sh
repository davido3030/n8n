#!/bin/bash

# n8n startup script for Railway
set -e

echo "🚀 Starting n8n on Railway..."
echo "Debug: Environment variables:"
echo "N8N_HOST: ${N8N_HOST:-not set}"
echo "N8N_PORT: ${N8N_PORT:-not set}"  
echo "PORT: ${PORT:-not set}"
echo "NODE_ENV: ${NODE_ENV:-not set}"
echo "PWD: $(pwd)"
echo "USER: $(whoami)"

# Ensure .n8n directory exists and has correct permissions
echo "🔧 Setting up n8n directory..."
mkdir -p /home/node/.n8n
ls -la /home/node/ || true

# Start n8n with verbose logging
echo "▶️ Starting n8n server..."
echo "Command: n8n start"

# Run n8n start directly with error handling
n8n start 2>&1 | tee /tmp/n8n.log || {
    echo "❌ n8n failed to start!"
    echo "Last 50 lines of log:"
    tail -50 /tmp/n8n.log || true
    exit 1
}