<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function_declare</title>
</head>
<body>
<h3>function declare</h3>
<h4>익명함수</h4>
<script>
var f = function(){
	return 'hong';	
}

console.log(f());
var f2 = function(a){
	return 'return value : '+a; // 매개변수로 들어온 값
}

console.log(f2('park'));

</script>

<h4 id='h4'>callback 함수</h4>
<script>
  let h4 = document.getElementById('h4');
  h4.onmouseover = abc;
  
  function abc(){
	 console.log('h4에 마우스가 올라감');
  }
  // callback : 이벤트에 따라 함수를 지정해놓고 '이벤트가 발생하면' 실행
  
</script>

<h4>선언적 함수(hoising)	</h4>
<script>
hoi('123'); // 함수가 실행되기 전에 hoising 처리돼서 출력됨

function hoi(n){
	console.log(n);
}
hoi('456');

</script>

<h4>함수적 선언</h4>
<script>
let f3 = function func(){
	//func라고 하는 이름이 있지만 f라는 변수에 들어감 (hoising처리 안됨)
	console.log('함수적 선언(not hoising)');
}
f3();
</script>

<h4>즉시실행 함수</h4>
<script>
( function(){
	console.log('즉시 실행된 함수');
  }()
);
// 이름도 없고 호출도 안 했는데 콘솔창에 출력됨
</script>


<h4>화살표 함수</h4>
<script>
let func2 = (a,b) => {return a+b;};
//function func2(a,b){ return a + b }; 를 화살표형으로
console.log(func2(10,20));
</script>
</body>
</html>