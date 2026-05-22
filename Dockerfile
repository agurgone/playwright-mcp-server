FROM mcr.microsoft.com/playwright:v1.52.0-noble
RUN npm install -g @playwright/mcp@0.0.75
RUN echo 'const http=require("http"),PORT=process.env.PORT||8080;' > /proxy.js && \
    echo 'http.createServer((q,s)=>{' >> /proxy.js && \
    echo '  const x=http.request({hostname:"localhost",port:3000,path:q.url,method:q.method,headers:q.headers},r=>{' >> /proxy.js && \
    echo '    s.writeHead(r.statusCode,r.headers);r.pipe(s)});' >> /proxy.js && \
    echo '  x.on("error",()=>{s.writeHead(502);s.end()});q.pipe(x)' >> /proxy.js && \
    echo '}).listen(PORT,"0.0.0.0",()=>console.log("Proxy:"+PORT));' >> /proxy.js
CMD sh -c "npx @playwright/mcp --port 3000 --headless & sleep 3 && node /proxy.js"
