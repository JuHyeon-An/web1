<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if_form</title>
</head>
<body>
<h3>if(form)</h3>
<form name='frm' method='post' action='./if_form_result.jsp'>
  <label>성명</label>
  <input type='text' name='mName' value='hong'/><br/>
  <label>성적</label>
  <input type='number' name='score' value='80'/><br/>
  <input type="button" value="RUN" id="btnRUN"/>
</form>
<script>
$('#btnRUN').click(function(){
	goSubmit(frm, "/if_form_result.jsp");
})
</script>
</body>
</html>