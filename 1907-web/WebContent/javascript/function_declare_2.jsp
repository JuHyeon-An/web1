<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function_declare_2</title>
<style>
#result{
	border : 2px solid black;
	margin-top : 20px;
	padding : 30px;
}
</style>
</head>
<body>
<h2>function_declare_2</h2>
<p id='info'>
음식이름을 checkbox로 여러 개 만들고, 선택된 항목을 div에 출력하도록 각종 함수 선언 방식을 사용하여 처리하시오.
</p>
<div id='result'></div>
<form id='frm'>
 <label><input type='checkbox' checked name='chk' value='짜장면'>짜장면</label>
 <label><input type='checkbox' name='chk' value='짬뽕'>짬뽕</label>
 <label><input type='checkbox' checked name='chk' value='탕수육'>탕수육</label>
 <label><input type='checkbox' name='chk' value='볶음밥'>볶음밥</label>
<br/>
<br/>
<input type='button' name='btn1' value='익명함수'/>
<input type='button' name='btn2' value='callback'/>
<input type='button' name='btn3' value='함수식'/>
<input type='button' name='btn4' value='선언적함수'/>
<input type='button' name='btn5' value='화살표함수'/>
</form>

<script>
let r = document.getElementById('result');
let array = [];

// 익명함수
frm.btn1.onclick = function(){
	r.innerHTML = '<li> 익명함수 : ';
	array.length = 0;
	for(x of frm.chk){
		if(x.checked){
		array.push(x.value);
		}
	}
r.innerHTML += array;
}


// callback
frm.btn2.onclick = func;
function func(){
	r.innerHTML = '<li> callback 함수 : ';
	array.length = 0;
	for(x of frm.chk){
		if(x.checked)
		array.push(x.value);
	}
r.innerHTML += array;
}

// 함수식
let ff = function a(){
	r.innerHTML = '<li> 함수식 : ';
	array.length = 0;
	for(x of frm.chk){
		if(x.checked)
		array.push(x.value);
	}
r.innerHTML += array;
}

frm.btn3.onclick = ff;

// 선언적 함수

let f = function(){
	r.innerHTML = '<li> 선언적 함수 : ';
	array.length = 0;
	for(x of frm.chk){
		if(x.checked)
		array.push(x.value);
	}
r.innerHTML += array;
}

frm.btn4.onclick = f;

//화살표 함수
let arrow = () => {
	r.innerHTML = '<li> 화살표 함수 : ';
	array.length = 0;
	for(x of frm.chk){
		if(x.checked)
		array.push(x.value);
	}
r.innerHTML += array;
};

frm.btn5.onclick = arrow;

</script>
</body>
</html>