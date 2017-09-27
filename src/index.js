var express = require('express');
var ip = require("ip");

// Constants
var PORT = 8080;

// App
var app = express();
app.get('/', function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.write(JSON.stringify(req.headers) + '\n');
  res.end('Hello world from ' + ip.address() + '\n');
  console.log(new Date().toISOString() + ' invoked...' + JSON.stringify(req.headers));
});

app.get('/health-check', function (req, res) {
  res.send('{"healthy": true}\n');
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
