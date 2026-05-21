FROM mcr.microsoft.com/playwright:v1.52.0-noble
RUN npm install -g @playwright/mcp@latest
CMD npx @playwright/mcp@latest --port ${PORT:-3000} --host 0.0.0.0 --headless
