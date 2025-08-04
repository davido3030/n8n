# n8n Docker Compose Setup

This setup provides a complete n8n automation platform with PostgreSQL database backend.

## Quick Start

1. **Stop existing n8n containers:**
   ```bash
   docker stop n8n-automation n8n-mcp || true
   docker rm n8n-automation n8n-mcp || true
   ```

2. **Navigate to setup directory:**
   ```bash
   cd /Users/davidrabinovitch/n8n-setup
   ```

3. **Start the services:**
   ```bash
   docker-compose up -d
   ```

4. **Access n8n:**
   - Open your browser to: http://localhost:5678
   - Complete the initial setup with your desired credentials

## Features

- **PostgreSQL Database**: Persistent data storage with proper user permissions
- **Docker Volumes**: Persistent storage for database and n8n data
- **Health Checks**: Ensures PostgreSQL is ready before starting n8n
- **Environment Variables**: Secure configuration management

## Configuration

- Database credentials are configured in `.env` file
- n8n data is persisted in Docker volume `n8n_storage`
- PostgreSQL data is persisted in Docker volume `db_storage`

## Workflow Import

Once n8n is running:
1. Create your initial user account
2. Use the web interface to import workflows via JSON files
3. Or use the n8n CLI for bulk operations

## n8n Workflow Builder Integration

This setup includes the n8n Workflow Builder MCP Server for AI assistant integration.

### Setup Steps

1. **Get your n8n API key:**
   - Open http://localhost:5678
   - Complete initial setup if needed  
   - Go to Settings → API Keys
   - Create a new API key

2. **Configure the workflow builder:**
   ```bash
   # Edit the API key in the environment file
   nano .env.workflow-builder
   ```

3. **Test the connection:**
   ```bash
   ./setup-workflow-builder.sh
   ```

### Claude Desktop Integration

Copy the configuration from `claude-desktop-config.json` to your Claude Desktop config file:
- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`

### Available Tools

The workflow builder provides 15+ tools for complete n8n management:
- `list_workflows` - List all workflows
- `create_workflow` - Create new workflows
- `execute_workflow` - Run workflows manually
- `activate_workflow` / `deactivate_workflow` - Manage workflow state
- `list_executions` - Monitor workflow runs
- `generate_audit` - Security auditing
- And more...

### Example Usage

Test with the included example workflow:
```bash
# Load the test workflow (after API key setup)
cat test-workflow-example.json
```

## Troubleshooting

- Check logs: `docker-compose logs -f`
- Restart services: `docker-compose restart`
- Reset everything: `docker-compose down -v && docker-compose up -d`
- Test workflow builder: `./setup-workflow-builder.sh`