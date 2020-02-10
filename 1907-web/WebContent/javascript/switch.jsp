<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>switch</title>
<style>
body{
  font-family:'배달의민족 도현';
}
#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 0px #7777ff;
}
</style>
</head>
<body>
<h3>switch</h3>
<p id='info'>
prompt를 사용하여 정수 하나를 입력받아 짝수, 홀수를 구분하여 출력하고,
만약 숫자가 아니라면 '숫자를 입력하세요' 메시지를 div창에 출력하시오.
</p>
<div id='result'></div>
<script>

		let input = Number(prompt('정수를 입력하세요.', 100));
		let r = document.getElementById('result');
		switch (input % 2) {
		case 0:
			r.innerHTML = '짝수';
			break;
		case 1:
			r.innerHTML = '홀수';
			break;
		default:
			r.innerHTML = '숫자가 아닙니다';
			break;
		}
</script>
</body>
</html>