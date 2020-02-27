/**
 * webServer.js
 * date : 2020.02.27
 * 웹서버 구축
 */

let http = require('http');
let fs = require('fs');
let db = require('../begin/node_modules/oracledb');
let dbConf = require('./lib/dbConfig');

const hostName = 'localhost';
const port = 4000;

const server = http.createServer(function(req, resp){
	let url = req.url;
	
	//favicon 제어
	if(req.url == '/favicon.ico'){
		resp.writeHead(404);
		resp.end();
		return;
	}
	
	resp.statusCode=200; // 요청이 성공했다 (200)
	resp.setHeader('Content-type', 'text/html;charset=utf-8');
	//header 정보
	
	/*
	resp.write('<li>url : '+url);
	resp.write('<li>dirname : '+ __dirname);
	resp.write('<br/>방가~~~~~~~~');
	resp.end();
	//send와 비슷한 역할
	*/
	
	resp.write(fs.readFileSync(__dirname + url));
	resp.end();
	// end를 해주지 않으면 서버 요청하고 있는 상태 유지해서 불편
});
connect();

server.listen(port, hostName);
console.log('http://%s:%d 로 접속하세요.', hostName, port);

function connect(){
	db.getConnection(
			{
				user 		  : dbConf.user,
				password 	  : dbConf.password,
				connectString : dbConf.connectString
			}, 
			
			function(err, connection){
				if(err){
					console.log(err.message);
					return;
				}
				console.log('connection OK.....');
				let sql = "select * from member";
				connection.execute(sql, function(err2, result){
					console.log('row : '+result.rows);
					disCon(connection);
				});
			});
}

function disCon(conn){ // 일반메소드 disCon
	console.log('disconnection.....')
	conn.close(function(err){
		if(err){
			console.log(err.message);
		}
	});
}
