<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for_of</title>
<style>
#info{
  border : 2px outset #eeeeff;
  margin-top : 30px;
  padding : 20px;
}
</style>
</head>
<body>
<h3>for_of</h3>
<p id='info'>
  임의의 개수를 가진 배열을 저장한 후 for of를 사용하여
  최대값과 최소값을 검색하여 div에 출력하시오.
</p>
<div id='result'></div>
<script>
let array = [2,56,12,5,2,5,23,21,1,6,2,100,200,0,-293];
let r = document.getElementById('result');
let max = array[0]; // 배열의 첫번째값이 최대값이라고 생각
let min = array[0]; // 배열의 첫번째값이 최소값이라고 생각

for (x of array){
	if(x>max){
		max = x;
	}if(x<min){
		min = x;
	}
}
r.innerHTML = '<li> 배열 : '+array
			+ '<li> 최대값 : ' + max
			+ '<li> 최소값 : ' +min;

</script>
</body>
</html>