<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>var_let</title>
</head>
<body>
<script>
  for(var i = 1; i<=100; i++){}
	  console.log('i', i); // 101출력
	  
  for(let j = 1; j<=100; j++){}
      console.log('j', j); // 오류 (not defined)
      
      
  var v1 = 100;
  var v1 = 200; // 가능
  
  let v2 = 100;
//let v2 = 200; // 불가능

function a(){
	irum = 'hong'; // 전역 스코프란 의미가 전역변수는 아니다.
}

function b(){
	alert(irum); // irum is not defined.
}

a();
b();

</script>

</body>
</html>