<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
#menu{
	position:relative;
	padding:20px;
	height:30px;
	border:2px solid #00f;
}
#menu>div{
	overflow: hidden;
}
#menu li{
	list-style: none;
	padding:0px;
	margin:0px;
}
#menu>div{
	display: inline-block;
	float:left;
}
#menu>div>div{
	background-color:#ddd;
	display: none;
}
#menu>div>span{
	display: block;
	width:100px;
	border:2px solid #555;
	text-align:center;
	padding:5px;
	box-sizing: border-box;
	transition : background 2s, color 1s;
}
#menu>div>span:hover{
	background-color:#777;
	color:#fff;
	transition : background 2s, color 1s;
}
</style>
</head>
<body>
<div id='menu'>
	<div id='sub_1'>
		<span>HTML</span>
		<div>
			<li>html 1</li>
			<li>html 1</li>
			<li>html 1</li>
			<li>html 1</li>
		</div>
	</div>
	<div id='sub_2'>
		<span>CSS</span>
		<div>
			<li>html 2</li>
			<li>html 2</li>
			<li>html 2</li>
			<li>html 2</li>
		</div>
	</div>
	<div id='sub_3'>
		<span>JavaScript</span>
		<div>
			<li>html 3</li>
			<li>html 3</li>
			<li>html 3</li>
			<li>html 3</li>
		</div>
	</div>
	<div id='sub_4'>
		<span>jQuery</span>
		<div>
			<li>html 4</li>
			<li>html 4</li>
			<li>html 4</li>
			<li>html 4</li>
		</div>
	</div>
	<div id='sub_5'>
		<span>JSP</span>
		<div>
			<li>html 5</li>
			<li>html 5</li>
			<li>html 5</li>
			<li>html 5</li>
		</div>
	</div>
</div>
<script>

$('#menu>div>span').on('click', function(ev){
	let div = $(this).parent();
	$(div).find('div').slideToggle(1000);
});

</script>

</body>
</html>