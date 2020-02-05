<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_visible</title>
</head>
<body>
	<h3>visibility | display 차이점</h3>
	<ul>
	  <li> visibility : visible, hidden </li>
	  <li> display : none, block </li>
	</ul>
	<div>첫번째 컨텐츠</div>
	<div id='target'>감추어질 컨텐츠</div>
	<div>세번째 컨텐츠</div>
	<input type='button' value='VISIBLE' id='btn1' />
	<input type='button' value='HIDDEN' id='btn2' />
	<input type='button' value='BLOCK' id='btn3' />
	<input type='button' value='NONE' id='btn4' />
	
	<script>
	let t = document.getElementById('target');
	let btn1 = document.getElementById('btn1');
	let btn2 = document.getElementById('btn2');
	let btn3 = document.getElementById('btn3');
	let btn4 = document.getElementById('btn4');
	
	btn1.onclick = function(){
		t.style.visibility = 'visible';
	}
	btn2.onclick = function(){
		t.style.visibility = 'hidden';
	}
	btn3.onclick = function(){
		t.style.display = 'block';
	}
	btn4.onclick = function(){
		t.style.display = 'none';
	}
	</script>
</body>
</html>