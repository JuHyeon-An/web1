<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storage</title>
</head>
<body>
<h3>storage</h3>
<form name='frm'>
  <output name='mId'></output> 님 환영합니다~~ <br/>
  <input type='button' value='SAVE' name='btnSave'/>
  <input type='button' value='LOAD' name='btnLoad'/>
</form>
<script>
  /* localStorage, sessionStorage에 값을 저장한 후 
  	  브라우저를 종료한 후 그 결과를 조회
  	 (local은 살아있고 session은 없어졌을 것)
  */
  
  frm.mId.value = localStorage.getItem('mId');
  
  frm.btnSave.onclick=function(){
	  localStorage.setItem('mId', 'hong');
	  sessionStorage.setItem('mId', 'kim');
  }
  frm.btnLoad.onclick=function(){
	  let localId = localStorage.getItem('mId');
	  let sessionId = sessionStorage.getItem('mId');
	  console.log('localStorage', localId);
	  console.log('sessionStorage', sessionId);
  }
 

</script>
</body>
</html>