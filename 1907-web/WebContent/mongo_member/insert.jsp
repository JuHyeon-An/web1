<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='../css/custom.css'>
<script type="text/javascript" src="../lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script src='mongo_member.js'></script>
</head>
<body>
<div class='jumbotron text-center'>
<h2>회원정보 입력</h2>
</div>
<div class='container' style="margin:10px; padding:30px;">
<form name='frm' id='frm' method='post'>
	<div class='form-group'>
	<span>아이디 </span><input type='text' name='mId' id='mId'></div>
	<div class='form-group'>
	<span>이름 </span><input type='text' name='mName'></div>
	<div class='form-group'>
	<span>날짜 </span><input type='date' name='rDate'></div>
	<div class='form-group'>
	<span>학년 </span>
	<select name='grade'>
		<option value='1'>1학년</option>
		<option value='2'>2학년</option>
		<option value='3'>3학년</option>
		<option value='4'>4학년</option>
	</select>
	</div>
	<div class='btn-inline'>
	<input type='button' id='btnSave' class='btn btn-dark' value='입력'>
	<input type='button' id='btnList' class='btn btn-dark' value='목록'>
	<input type='hidden' name='findStr' value='<%=request.getParameter("findStr") %>'>
	</div>
</form>
</div>
	<script>
	btnFunc()
	</script>
</body>
</html>