var url = require('url');

var adr = 'https://www.example.com:8080/path/to/file?name=JohnDoe&age=30&country=USA';

var q = url.parse(adr, true);


console.log('Protocol: ' + q.protocol);      
console.log('Host: ' + q.host);             
console.log('Hostname: ' + q.hostname);      
console.log('Port: ' + q.port);              
console.log('Pathname: ' + q.pathname);     
console.log('Search: ' + q.search);          
console.log('Query: ' + JSON.stringify(q.query)); 
console.log('Name Parameter: ' + q.query.name);  
console.log('Age Parameter: ' + q.query.age);   
console.log('Country Parameter: ' + q.query.country); 
