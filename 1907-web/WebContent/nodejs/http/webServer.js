/**
 * webServer.js date : 2020.02.27 웹서버 구축
 */
let http = require('http');
let fs = require('fs');
let db = require('../begin/node_modules/oracledb');
let dbConf = require('./lib/dbConfig');
const hostName = 'localhost';
const port = 4000;

const server = http.createServer(function(req, resp) { // 서버 연결
   let url = req.url;
   // 파비콘 제어
   if (req.url == '/favicon.ico') {
      resp.writeHead(404);
      resp.end();
      return;
   }
   resp.statusCode = 200;
   resp.setHeader('Content-type', 'text/html;charset=utf-8');
   /*
    * resp.write('<li>url :' + url); resp.write('<li>dirname :' +
    * __dirname); resp.write('<br/>방가...방가...'); resp.end();
    */

   resp.write(fs.readFileSync(__dirname + url));
   resp.end();
});

server.listen(port, hostName);
console.log('http://%s:%d 로 접속하세요', hostName, port);

connect();

function connect() {
	let conn;
   db.getConnection({
      user : dbConf.user,
      password : dbConf.password,
      connectString : dbConf.connectString

   }, function(err, connection) {
      if (err) {
         console.log(err.message);
         return;
      }
      conn=connection;
      console.log('연결 완료');
      
      let sql = "select * from member";
      connection.execute(sql, function(err2,result) {
         console.log('row: ' + result.rows);
      });
   }); // db 연결을 위한 환경, 에러-성공 처리
   disCon(connection);
}

function disCon(connection){ // 일반메소드 disCon
	connection.close(function(err){
		if(err){
			console.log(err.message);
		}
	});
}