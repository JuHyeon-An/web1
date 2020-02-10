<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hoising</title>
</head>
<body>
<h3>hoising</h3>
변수나 함수를 선언하기 전에 사용가능하도록
메모리에 미리 상주시킨다는 의미
<script>
// 변수의 hoising
irum = 'hong';
var irum;
console.log('irum : ', irum);

let age=0;
age = 18; // 사용전에 반드시 선언해야됨.
console.log('age : ', age);

a();

function a(){
	console.log('hoising된 함수');
}


f = function(){
	console.log('hoising되지 않은 함수');
}

f();

</script>
</body>
</html>