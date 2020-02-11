<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function_declare_3</title>
</head>
<body>
<h2>function_declare(III)</h2>
<p id='info'>
자바 스크립트는 메소드의 중복선언을 하지 못 하는 반면, 매개변수의 수를
가변적으로 사용함으로써 오버로딩을 구현한다.
</p>
<form name = 'frm'>
<input type='button' value='click' name='btn'/>
</form>
<script>
function Func(a,b,c){
	console.log('a', a);
	console.log('b', b);
	console.log('c', c);
	console.log('-----------------');
}

Func();
Func(1);
Func(1,2);
Func(1,2,3);
Func(1,2,3,4);

frm.btn.onclick = Func;

//arguments : 파라미터값을 배열로 저장하고 있는 객체
// 매개변수값을 value값으로 배열에 저장하고 있다.
function My(){
	console.log('-----arguments test-----');
	for(x of arguments){
		console.log(x);
	}
}

My('a');
My(123,456);
My('a', 123, '가나다');
// 매개변수가 없음에도 arguments 통해서 접근할 수 있다.
</script>

</body>
</html>