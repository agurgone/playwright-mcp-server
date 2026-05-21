FROM mcr.microsoft.com/playwright:v1.52.0-noble
RUN npm install -g @playwright/mcp@latest
EXPOSE 3000
CMD ["npx", "@playwright/mcp@latest", "--port", "3000", "--headless"]
