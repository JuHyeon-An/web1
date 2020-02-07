<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if</title>
<style>
#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 6px #999;
}
form{
  margin-left:30px;
}
#result{
  width:250px;
  height:150px;
}
</style>
</head>
<body>
<h3>IF</h3>
<p id='info'>
정수 하나를 폼으로부터 전달받아 60 이상이면 '합격'을, 60 미만이면 '불합격'을
textarea에 출력하라.
</p>
<form name='frm' method='post' action='' target=''>
  <label>정수</label>
  <input type='text' name='su' value='90'/>
  <input type='button' value='RUN' name='btn'/>
  <p/>
  <textarea name='result' id='result'></textarea>
</form>
<script>
frm.btn.onclick=function(){
	let su = Number(frm.su.value);
	if(su>=60){
		frm.result.value = '합격';
	}else{
		frm.result.value = '불합격';
	}
}
</script>
</body>
</html>