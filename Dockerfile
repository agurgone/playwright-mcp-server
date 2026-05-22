  FROM mcr.microsoft.com/playwright/mcp
  CMD node /app/cli.js --headless --browser chromium --no-sandbox --port ${PORT:-8931} --host 0.0.0.0
