<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set_thema</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>

.main{
  border:2px solid #000;
	width:400px;
	padding:20px;
	box-sizing: border-box;
	color:#000;
}

.subject{
	border:2px solid #888;
	padding:20px;
	box-sizing: border-box;
	margin-bottom:6px;
	background-color:#eee;
	color:#000;
}
.content{
	border:2px solid #888;
	padding:20px;
	box-sizing: border-box;
	background-color:#ddd;
	color:#000;
}

.main_sky{
  border:2px solid #f00;
	width:400px;
	padding:20px;
	box-sizing: border-box;
	color:#f00;
}

.subject_sky{
	border:2px solid #f88;
	padding:20px;
	box-sizing: border-box;
	margin-bottom:6px;
	background-color:#fee;
	color:#f00;
}
.content_sky{
	border:2px solid #f88;
	padding:20px;
	box-sizing: border-box;
	background-color:#fdd;
	color:#f00;
}

.main_land{
  border:2px solid #0ff;
	width:400px;
	padding:20px;
	box-sizing: border-box;
	color:#0ff;
}
.subject_land{
	border:2px solid #8ff;
	padding:20px;
	box-sizing: border-box;
	margin-bottom:6px;
	background-color:#eff;
	color:#0ff;
}
.content_land{
	border:2px solid #8ff;
	padding:20px;
	box-sizing: border-box;
	background-color:#dff;
	color:#0ff;
}
</style>
</head>
<body>
<h3>Thema 변경하기</h3>
<div id='main'>
	<div id='subject'>나는 제목이다.</div>
	<div id='content'>나는 내용이다.</div>
</div>
<button id='btn1'>흑백 테마</button>
<button id='btn2'>하늘 테마</button>
<button id='btn3'>땅 테마</button>
<script>
$('#btn1').click(function(){
	$('#main').attr('class', 'main');
	$('#subject').attr('class', 'subject');
	$('#content').attr('class', 'content');
	$('#content').html('난 흑백 테마다~');
})
$('#btn2').on('click', function(){
	$('#main').attr('class', 'main_sky');
	$('#subject').attr('class', 'subject_sky');
	$('#content').attr('class', 'content_sky');
	$('#content').html('난 하늘 테마다~');
});
$('#btn3').click(function(){
	$('#main').attr('class', 'main_land');
	$('#subject').attr('class', 'subject_land');
	$('#content').attr('class', 'content_land');
	$('#content').html('난 땅 테마다~');

});
$('#btn1').click();
</script>
</body>
</html>