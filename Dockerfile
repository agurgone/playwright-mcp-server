FROM mcr.microsoft.com/playwright/mcp

CMD node /app/cli.js \
  --headless \
  --browser chromium \
  --no-sandbox \
  --host 0.0.0.0 \
  --port ${PORT:-8931} \
  --allowed-hosts '*'
