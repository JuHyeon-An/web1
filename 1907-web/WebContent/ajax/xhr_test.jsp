<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xhr_test</title>
<style>
div{
  display: inline-block;
  width :600px;
  height : 500px;
  border:2px solid #704;
  overflow:auto;
}
</style>
<script src="../lib/jquery-3.4.1.js"></script>
</head>
<body>
<h3>XMLHttpRequest 객체 Test</h3>
<input type="button" value="ajax실행1" id="btn1" />
<input type="button" value="ajax실행2" id="btn2" />
<p/>
<div id='div1'></div>
<div id='div2'></div>

<script>
let xhr = new XMLHttpRequest();

$('#btn1').click(function(){
	xhr.onreadystatechange=function(){
		console.log(xhr.status + ', '+xhr.readyState);
		if(xhr.status==200 && xhr.readyState==4){
			$('#div1').html(xhr.responseText);
			// xhr이 가지고 있는 텍스트를 div1에 표시 (조건맞으면)
		};
	};
	xhr.open('get', 'test1.html', true);
	// open을 가장먼저 (true는 생략가능)
	xhr.send();
});

$('#btn2').click(function(){
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			$('#div2').html(xhr.responseText);
		};
	};
	xhr.open('get', 'test2.jsp', true);
	// open을 가장먼저 (true는 생략가능)
	xhr.send();
});

</script>
</body>
</html>