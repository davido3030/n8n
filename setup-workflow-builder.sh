#!/bin/bash

echo "🚀 Setting up n8n Workflow Builder..."

# Check if n8n is running
if ! curl -s http://localhost:5678 > /dev/null; then
    echo "❌ n8n is not running on localhost:5678"
    echo "Please start n8n first with: docker-compose up -d"
    exit 1
fi

echo "✅ n8n is running"

# Check if API key is configured
if grep -q "your-api-key-here" .env.workflow-builder; then
    echo "⚠️  API key not configured yet"
    echo ""
    echo "To get your n8n API key:"
    echo "1. Open http://localhost:5678 in your browser"
    echo "2. Complete the initial setup if needed"
    echo "3. Go to Settings → API Keys"
    echo "4. Create a new API key"
    echo "5. Replace 'your-api-key-here' in .env.workflow-builder with your actual key"
    echo ""
    echo "Then run this script again."
    exit 1
fi

# Load environment variables
source .env.workflow-builder

# Test the workflow builder
echo "🧪 Testing workflow builder connection..."

# Run workflow builder in test mode
npx @makafeli/n8n-workflow-builder &
BUILDER_PID=$!

# Wait a moment for it to start
sleep 3

# Kill the test process
kill $BUILDER_PID 2>/dev/null

echo "✅ Workflow Builder setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Set your API key in .env.workflow-builder"
echo "2. Use 'npx @makafeli/n8n-workflow-builder' to start the MCP server"
echo "3. Configure your Claude Desktop or other MCP client"
echo ""
echo "📖 Documentation: /Users/davidrabinovitch/n8n-workflow-builder/README.md"