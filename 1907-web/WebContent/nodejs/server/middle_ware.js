/**
 * middle_ware
 */

var express = require('../begin/node_modules/express');
var app = express();

app.use(function(req, resp, next){
	console.log('first');
	next(); // 다음 use를 사용해라
});

app.use(function(req, resp, next){
	console.log('second');
	next(); // 다음 use를 사용
});

app.use(function(req, resp, next){
	resp.send("<h1>Hello Middleware!!!</h1>")
});

app.listen(9995, function(){
	console.log("방가~~~~~~~url:127.0.0.1:9995");
});