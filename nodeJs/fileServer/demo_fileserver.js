

var http = require('http');
var fs = require('fs');
var url = require('url');


http.createServer(function (req, res) {

  var q = url.parse(req.url, true);
  var filename = "." + q.pathname;  

  
  fs.readFile(filename, function(err, data) {
    if (err) {
     
      res.writeHead(404, {'Content-Type': 'text/html'});
      res.end("<h1>404 Not Found</h1>");
    } else {
      
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.end(data);  
    }
  });
}).listen(8085);
