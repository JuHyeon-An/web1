/**
 * http://usejsdoc.org/
 */

let http = require('http');
let fs = require('fs');

const hostName = 'localhost';
const port = '4000';

const server = http.createServer(function (req, resp){
	let url = req.url;
	resp.statusCode=200;
	resp.setHeader('Content-type', 'text/html;charset=utf-8');
	resp.write(fs.readFileSync(__dirname + url));
	
	if(req.method == 'POST' && req.url == 'insert'){
		url = '/insert_result.html';
	}
	
	resp.end(fs.readFileSync(__dirname + url));
});


server.listen(port, hostName);
console.log('http://%s:%d 서버가 오픈~~~', hostName, port);