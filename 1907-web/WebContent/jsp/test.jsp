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
</head>
<body>
<div class='jumbotron text-center'>
<h2>회원정보 입력</h2>
</div>
<div class='row text-center'>
<div class='col-sm-5' style="margin:10px; padding:30px;">
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
</form>
</div>
	<div class='col-sm-2' style="float:left;">
	<div class='btn-group-vertical btn-group'>
	<input type='button' id='btnServletXML' class='btn btn-success' value='등록(servlet-xml)'>
	</div>
	</div>
	</div>
<script>
frm.rDate.valueAsDate = new Date();

$('#btnServletXML').click(function(){
	$('#frm').attr('action', 'insert_r_servlet_xml.nhn').submit();
})


</script>
</body>
</html>