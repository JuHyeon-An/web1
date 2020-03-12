<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set_theme</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
*{
font-family:'나눔스퀘어';
}
#subject{
height:50px;
border-bottom:1px solid black;
}
#content{
height:400px;}
</style>
</head>
<body>
<h1>테마 변경하기</h1>
<div id='main'>
  <div id='subject'>
    제목
  </div>
  <div id='content'>
    내용~~~~~~~~~~~~~~~~~~~~~
  </div>
</div>
<button id='btn1'>흑백테마</button>
<button id='btn2'>하늘테마</button>
<button id='btn3'>땅테마</button>

<script>
let color = ['black', 'blue', 'brown'];



$('#btn1').click(function(){
	$('#main').css({
		backgroundColor : 'black',
		color : 'white'
	});
});

$('#btn2').click(function(){
	$('#main').css({
		backgroundColor : 'blue',
		color : 'white'
	});
});

$('#btn3').click(function(){
	$('#main').css({
		backgroundColor : 'brown',
		color : 'white'
	});
});
</script>
</body>
</html>