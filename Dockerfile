FROM mcr.microsoft.com/playwright:v1.52.0-noble
RUN npm install -g @playwright/mcp@0.0.75
RUN apt-get update && apt-get install -y socat
CMD sh -c "npx @playwright/mcp --port 3000 --headless & sleep 3 && exec socat TCP-LISTEN:${PORT:-8080},fork,reuseaddr TCP:127.0.0.1:3000"
