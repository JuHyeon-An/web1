/**
 * web server test
 * date : 2020.02.26
 */

var express = require('../begin/node_modules/express');

// 웹 서버 생성
var app = express();

// 웹 서버 실행
app.listen(9998, function(){
	console.log('server running at http://127.0.0.1:9998');
});

app.use(function(req, resp){
	resp.send('<h1>하이~~~~~~~~~~~~</h1>');
});

