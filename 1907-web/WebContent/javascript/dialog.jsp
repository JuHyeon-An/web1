<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dialog</title>
</head>
<body>
<form name='frm'>
  <input type='button' value='ALERT' name='btnAlert'/>
  <input type='button' value='CONFIRM' name='btnConfirm'/>
  <input type='button' value='PROMPT' name='btnPrompt'/>
</form>
<script>
frm.btnAlert.onclick = function(){
  alert("OK");
}
frm.btnConfirm.onclick = function(){
  let flag = confirm("실행하시겠습니까?");
  if(flag){
    console.log('confirm', '실행합니다...');
  }else{
    console.log('confirm', '실행을 중지합니다.');
  }
}
frm.btnPrompt.onclick = function(){
	let v = prompt('숫자를 입력하세요.');
	let r = Number(v)+Number(v);
	console.log('입력값 : ', r);
}

</script>
</body>
</html>