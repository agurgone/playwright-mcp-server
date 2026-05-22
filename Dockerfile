FROM mcr.microsoft.com/playwright:v1.52.0-noble
RUN npm install -g @playwright/mcp@0.0.75
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
