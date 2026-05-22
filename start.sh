#!/bin/bash
npx @playwright/mcp --port 3000 --headless &
sleep 3
node -e "
const http = require('http');
const PORT = process.env.PORT || 8080;
http.createServer((req, res) => {
  const opts = { hostname: 'localhost', port: 3000, path: req.url, method: req.method, headers: req.headers };
  const proxy = http.request(opts, (r) => {
    res.writeHead(r.statusCode, r.headers);
    r.pipe(res);
  });
  proxy.on('error', () => { res.writeHead(502); res.end(); });
  req.pipe(proxy);
}).listen(PORT, '0.0.0.0', () => console.log('Proxy on 0.0.0.0:' + PORT));
"
