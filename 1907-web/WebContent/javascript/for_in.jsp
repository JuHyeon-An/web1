<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for_in</title>
</head>
<body>
<h3>for_in</h3>
<p id='info'>향상된 for문</p>
<input type='button' value='FOR-IN' id='btnIn'/>
<input type='button' value='FOR-OF' id='btnOf'/>
<!-- form이 없으므로 아이디값으로 접근 -->
<script>
let p = document.getElementById('info');
let btnIn = document.getElementById('btnIn');
let btnOf = document.getElementById('btnOf');
//run 버튼을 클릭하면 p태그가 가지고 있는 모든 요소들을 콘솔창에 출력

btnIn.onclick = function(){
  console.log('-for in--------------------------');
  let cnt=0;
  let array = ['a','b','c', 'd', 'e'];
  for(x in array){
	  cnt++;
	  console.log(cnt+ ' : ' + x, array[x]);
  }
}
btnOf.onclick = function(){
	 console.log('-for of--------------------------');
	  let cnt=0;
	  let array = ['a','b','c', 'd', 'e'];
	  for(x of array){
		  cnt++;
		  console.log(cnt+ ' : ' + x);
	  }
	}


</script>
</body>
</html>