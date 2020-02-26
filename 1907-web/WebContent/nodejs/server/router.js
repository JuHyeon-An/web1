/**
 * router.js
 * date : 2020.02.26
 */

var express = require('../begin/node_modules/express');
var app = express();

app.use(express.static('public'));
app.all('/a', function(req, resp){
	resp.send("<h1>page A</h1>");
});

app.all('/b', function(req, resp){
	resp.send("<h1>page B</h1>");
});

app.all('/c', function(req, resp){
	resp.send("<h1>page C</h1>");
});

app.listen(9991, function(){
	console.log('127.0.0.1:9991/[a | b | c]')
});