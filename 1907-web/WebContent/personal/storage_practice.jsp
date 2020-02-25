<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storage_practice</title>
</head>
<body>
<h3>storage</h3>
  <form name='frm'>
	<output name='mId'></output>님 환영합니다~! <br/>
	<input type='button' value='SAVE' name='btnsave'/>
	<input type='button' value='LOAD' name='btnload'/>
</form>

<script>

  frm.mId.value = localStorage.getItem('mId');

  frm.btnsave.onclick=function(){
	  localStorage.setItem('mId', 'hong');
	  sessionStorage.setItem('mId', 'kim');
  }
  
  frm.btnload.onclick=function(){
	  let localId = localStorage.getItem('mId');
	  let sessionId = sessionStorage.getItem('mId');
  
  	  console.log(localId);
  	  console.log(sessionId);
  }

</script>


</body>
</html>