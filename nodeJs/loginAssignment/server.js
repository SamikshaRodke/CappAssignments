const http = require('http');
const url = require('url');
const fs = require('fs');


const validUsername = 'user';
const validPassword = 'password';

http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url, true);

  // Handle login form submission
  if (parsedUrl.pathname === '/login' && req.method === 'POST') {
    let body = '';
    req.on('data', chunk => body += chunk);
    req.on('end', () => {
      const data = new URLSearchParams(body);
      if (data.get('username') === validUsername && data.get('password') === validPassword) {
        res.writeHead(302, { 'Location': '/welcome' });
        res.end();
      } else {
        res.end('<h1>Login Failed!</h1>');
      }
    });

  // Serve login page
  } else if (parsedUrl.pathname === '/') {
    fs.readFile('login.html', 'utf8', (err, data) => {
      if (err) return res.end('<h1>Error</h1>');
      res.end(data);
    });

  // Serve welcome page
} else if (parsedUrl.pathname === '/welcome') {
  fs.readFile('welcome.html', 'utf8', (err, data) => {
    if (err) return res.end('<h1>Error</h1>');
    res.end(data);
  });




  } else {
    res.end('<h1>Page Not Found</h1>');
  }
}).listen(3002, () => {
  console.log('Server running at http://localhost:3002');
});
