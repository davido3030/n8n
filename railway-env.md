# Railway Environment Variables

Set these in your Railway dashboard under Environment Variables:

## Required Variables:
```
N8N_HOST=0.0.0.0
N8N_PORT=5678
N8N_PROTOCOL=http
GENERIC_TIMEZONE=America/New_York
N8N_METRICS=true
N8N_LOG_LEVEL=info
N8N_DISABLE_UI=false
```

## Optional for Database (Railway will auto-configure):
```
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=${{ DATABASE_HOST }}
DB_POSTGRESDB_PORT=${{ DATABASE_PORT }}
DB_POSTGRESDB_DATABASE=${{ DATABASE_NAME }}
DB_POSTGRESDB_USER=${{ DATABASE_USER }}
DB_POSTGRESDB_PASSWORD=${{ DATABASE_PASSWORD }}
```

## Service Settings:
- Port: 5678
- Health Check: /healthz
- Health Check Timeout: 60s