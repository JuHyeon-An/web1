<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_insert</title>
<script src="../lib/jquery-3.4.1.js"></script>
</head>
<body>
<h3>멤버등록</h3>

<form name="frm" id="frmInsert">

<label>이름 : </label><input type="text" name="mname" id="mname" value="홍" /><br/>
<label>아이디 : </label><input type="text" name="mid" id="mid" value="hong" /><br/>
<label>등록날짜 : </label><input type="date" name="rdate" id="rdate"/>
<br/>
<label>학년 : </label>
<select name="grade" id="grade">
	<option value="1">1학년</option>
	<option value="2">2학년</option>
	<option value="3">3학년</option>
	<option value="4">4학년</option>
</select>
<br/>
<input type="button" value="등록" id="btnInsert" />
</form>
<div id="resultInsert"></div>

<script>

$('#btnInsert').click(function(){
	let v = $('#frmInsert').serialize();
	console.log(v);
	insert();
});
</script>
</body>
</html>