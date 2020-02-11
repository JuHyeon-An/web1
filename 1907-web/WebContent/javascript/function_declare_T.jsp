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
 <label><input type='checkbox' checked name='food' value='짜장면'>짜장면</label>
 <label><input type='checkbox' name='food' value='짬뽕'>짬뽕</label>
 <label><input type='checkbox' checked name='food' value='탕수육'>탕수육</label>
 <label><input type='checkbox' name='food' value='볶음밥'>볶음밥</label>
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
let food = [];
let str = '';
// 공통 호출 함수-------------
function Gen(){ // general의 의미로
	food.length = 0; // 배열의 초기화
	for(v of frm.food){ // v에는 checkbox 자체가 대입
		if(v.checked){
			food.push(v.value);
		}
	}
	return food;
}

// 즉시실행 함수 --------------
( function(){
	str = '즉시 실행 함수 : '+Gen();
	r.innerHTML = str;
}() )


// 익명함수
frm.btn1.onclick = function(){
	str = '익명형 함수 : '+Gen();
	r.innerHTML = str;
}

// callback
frm.btn2.onclick = callBack;

function callBack(){
	str = 'callback 함수 : '+Gen();
	r.innerHTML = str;
}


// 함수식
let func = function(){
	food.length = 0; // 배열의 초기화
	for(v of frm.food){ // v에는 checkbox 자체가 대입
		if(v.checked){
			food.push(v.value);
		}
	}
	str = '함수식 : '+food;
	r.innerHTML = str;
}

frm.btn3.onclick = func;

// 선언적 함수
// 호출되는 function Gen{}의 유형이 선언적 함수.
frm.btn4.onclick = function(){
	str = '선언적 함수 : ' + Gen();
	r.innerHTML = str;
}


//화살표 함수
let arrow = () => {
	str = 'arrow 함수 : '+Gen();
	r.innerHTML = str;
}

frm.btn5.onclick = arrow;

</script>
</body>
</html>