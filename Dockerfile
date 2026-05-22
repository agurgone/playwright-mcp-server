FROM mcr.microsoft.com/playwright:v1.52.0-noble
RUN npm install -g @playwright/mcp@0.0.75
CMD npx @playwright/mcp --port ${PORT:-3000} --host 0.0.0.0 --headless
