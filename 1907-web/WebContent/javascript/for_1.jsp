<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for_1</title>
<style>
body{
  color:white;
  background-color:#222;
  font-family:'배달의민족 도현';
}
#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 0px #7777ff;
}
form{
  margin-left:30px;
}

#result{
  width:400px; height:100px;
  border : 4px double #7777ff;
  border-radius:5px 0px 5px 0px;
  margin-top:20px;
  padding:30px;
  box-sizing:border-box;
  box-shadow:3px 3px 0px #b9b9fa;
  background-color:#b9b9fa;
}
</style>
</head>
<body>
<h3>for(I)</h3>
<p id='info'>
 1이상의 정수 n을 입력받아 1~n까지의 합계를 구하여 div 영역에 표시 
</p>
<form name='frm'>
  <label>정수</label>
  <input type='text' name='n' value='100'/>
  <input type='button' value='RUN' name='btn'/>
</form>
<div id='result'></div>

<script>
frm.btn.onclick = function(){
	let s = 0;
	let n = Number(frm.n.value);
	let r = document.getElementById('result');
	
	for(i=1; i<=n; i++){
		s += i;
	}
	r.innerHTML = '합계 : ' + s;
}
</script>
</body>
</html>