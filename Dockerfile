FROM mcr.microsoft.com/playwright:v1.52.0-noble
RUN npm install -g @playwright/mcp@next
CMD npx @playwright/mcp --headless --browser chromium --no-sandbox --port ${PORT:-8931} --host 0.0.0.0
