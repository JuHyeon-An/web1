/**
 * webServer.js
 * date : 2020.02.27
 * 웹서버 구축
 */

let db = require('../begin/node_modules/oracledb');
let dbConf = require('./lib/dbConfig');
db.autoCommit = true;

let http = require('http');
let express = require('../begin/node_modules/express');
let bodyParser = require('../begin/node_modules/body-parser');

const hostName = 'localhost';
const port = 4000;

// db 연결 하기위한 함수들 정의
var config = {
	user: dbConf.user,
	password: dbConf.password,
	connectString: dbConf.connectString
}

var app = express();

/* app이 가지고 있는 engine:브라우징 될 문서를 어떤 모듈을 사용해서 표시해줄것인지
	html 문서형태의 작업은 ejs 모듈을 사용해서 렌더링 하겠다는 의미
	(select.ejs 를 html 타입으로 렌더링)
 */
app.engine('html', require('../begin/node_modules/ejs').renderFile);

// css와 lib 폴더를 정적경로로 만들기
app.use(express.static(__dirname + '/css'));
app.use(express.static(__dirname + '/lib'));

// url에 한글 등이 들어왔을때 처리
app.use(bodyParser.urlencoded({ extended: true }));

// express가 커버 (favicon 컨트롤 등)
var server = http.createServer(app);
var conn; // db connection object


function connect() {
	db.getConnection(config, function (err, connection) {
		/* callback함수를 통해서 (첫번째 매개변수 : 에러가 났을때, 두번째 : 연결이 됐을때)
		 */
		if (err) {
			console.log('connection fail...' + err);
		} else {
			console.log('connection success');
			conn = connection;
			// dbConn.getConn 과 같음
			// 연결정보가 두번째 매개변수 connection에 들어감 -> 연결정보를 conn에 저장 
		}
	})
}
connect();

app.post('/insert', function (req, resp) {
	// post 타입의 insert가 들어오면
	//req  : 요청정보
	//resp : 응답정보
	let findStr = req.body.findStr;
	resp.render(__dirname + '/insert_form.ejs', { 'findStr': findStr });

})

app.post('/insertR', function (req, resp) {
	let msg = "회원정보가 정상적으로 추가되었습니다.";
	let param = [
		req.body.mId, req.body.mName,
		req.body.rDate, req.body.grade
	];
	let findStr = req.body.findStr;
	let sql = "insert into member(mId, mName, rDate, grade)"
		+ " values(:mId, :mName, :rDate, :grade)";
	conn.execute(sql, param, function (err, data) {
		if (err) msg = err;
		else {
			resp.render(__dirname + '/insert_result.ejs', { 'msg': msg , 'findStr':findStr});
		}
	})
})

app.post('/modify', function (req, resp) {
	let param = [req.body.mId];
	let findStr = req.body.findStr;
	let sql = "select mId, mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade"
			  + " from member"
			  + " where mId = :mId";
	conn.execute(sql, param, function(err, data){
		if(err) {
			console.log(err);	
		}else {
			resp.render(__dirname+'/modify_form.ejs', 
			{'data' : data, 'findStr' : findStr});
		}
	})
})

app.post('/modifyR', function (req, resp) {
	let msg = "회원 정보가 정상적으로 수정되었습니다."
	let param = [req.body.mName, req.body.rDate, req.body.grade, req.body.mId]
	let findStr = req.body.findStr;
	let sql = "update member set mName = :mName, rDate = :rDate, grade = :grade where mId = :mId";

	conn.execute(sql, param, function(err, data){
		if (err) msg = err;
		else {
			resp.render(__dirname + '/modify_result.ejs',
				{ 'msg': msg , 'findStr': findStr});
		}
	})
})

app.post('/deleteR', function (req, resp) {
	let param = [req.body.mId];
	let msg = "자료가 정상적으로 삭제되었습니다.";
	let sql = "delete from member where mId=:mId";

	conn.execute(sql, param, function (err, data) {
		if (err) msg = err;
		else {
			resp.render(__dirname + '/delete_result.ejs',
				{ 'msg': msg, 'findStr': req.body.findStr }
			);
		}
	})
})

app.post('/view', function (req, resp) {
	let mId = req.body.mId;
	// hidden 태그로 넘어온 값
	let sql = "select mId, mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade"
		+ " from member where mId=:mId";
	conn.execute(sql, [mId], function (err, data) {
		console.log(data);
		resp.render(__dirname + '/view.ejs',
			{ 'data': data, 'findStr': req.body.findStr });
		//body에 있는 findStr을 가져와서 view에 던져줌
	})
})

app.all('/', function (req, resp) {
	/* 페이지 정보가 없이 단순히 도메인 정보만 들어온 경우
	 * ex) www.naver.com (뒤에 /modify 같은 정보 없이)
	 post 타입, get 타입 모두 처리하겠다 -> all
		  상단에 기술하면 오류발생 가능성 있음 
	 */
	select(req, resp);
})

app.all('/select', function (req, resp) {
	select(req, resp);
})

/*
<select가 불려지는 시점>
1. 페이지가 없는 상태에서 도메인만 가지고 호출 (폼이 X)
2. 메소드가 get 혹은 post로 적용돼서 /select 로 들어왔을 때 (폼이 O)
=> form이 있는 경우와 없는 경우 나눠서 처리
*/

// hoising 처리되도록 함수형으로 선언
function select(req, resp) {
	let findStr = '';
	// 폼의 히든태그에 저장해놓은 값을 findStr에 넣을 것

	if (req.method == 'POST') {
		findStr = req.body.findStr;
		// 폼태그에 있었던 문자열을 findStr에 대입
		// get타입으로 넘어왔다면 : /select?findStr=abc
		// JSP 코드 : request.getParameter("findStr");
	}

	let sql = "select mId, mName, to_char(rDate, 'rrrr-mm-dd') rdate, grade"
		+ " from member"
		+ " where lower(mId) like :id or lower(mname) like :id"
		+ " order by mname asc";
	// JDBC 랑 다른점 : ? (물음표) 대신에 :(콜론) 변수명

	conn.execute(sql, ["%" + findStr + "%"], function (err, data) {
		// parameter는 무조건 배열타입 [] 으로 넘어감
		if (err) {
			console.log(err);
		} else {
			//console.log(data);
			resp.render(__dirname + '/select.ejs',
				{ 'data': data, 'findStr': findStr })
			// <% %> 안에서 처리할 것


			/*resp.render 는 표시될 페이지를 던지는 것
			첫번째 파라미터 : 던져질 페이지
			두번째 파라미터 : select.ejs에 던져질 데이터 (json타입)
			*/
		}
	});

}


server.listen(port, hostName);
console.log('http://%s:%d 로 접속하세요.', hostName, port);


function disCon(conn) { // 일반메소드 disCon
	console.log('disconnection.....');
	conn.close(function (err) {
		if (err) {
			console.log(err.message);
		}
	});
}
