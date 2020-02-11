<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setInterval</title>
<style>
body{
  font-family: '둥근모꼴';
}

#frame{
border : 2px solid black;
width : 280px;
height : 100px;
background-color:blue;
color : white;
border-radius:20px;
}

#date{
  height : 20px;
  padding : 10px;
  font-size : 20px;
  color:yellow;
  
}
#time{
  width : 100px;
  font-size : 45px;
  padding : 8px;
  margin-left:55px;
}

</style>
</head>
<body>
<h1>setInterval을 사용한 시계</h1>
<div id = 'frame'>
<div id='date'></div>
<div id='time'></div>
</div>
<script>
let dt = document.getElementById('date');
let tm = document.getElementById('time');

let weeks = ['일', '월', '화', '수', '목', '금', '토'];
let func = function(){	
	let now = new Date();
	let year = now.getFullYear();
	let month = now.getMonth()+1; //0~11월
	let week = now.getDay();
	let day = now.getDate();
	let hour = now.getHours();
	let min = now.getMinutes();
	let sec = now.getSeconds();
	
	//시분초 2자리로
	hour = hour<10? '0'+hour : hour;
	min = min<10? '0'+min : min;
	sec = sec<10? '0'+sec : sec;
	
	let d = `\${year} 년 \${month}월 \${day}일 (\${weeks[week]}) `;
	let t = `\${hour}:\${min}:\${sec}`;
	
	dt.innerHTML = d;
	tm.innerHTML = t;
}

setInterval(func, 1000);
// 1초에 한번씩 func 함수 호출

</script>
</body>
</html>