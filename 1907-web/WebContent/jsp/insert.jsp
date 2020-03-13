<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link rel='stylesheet' type='text/css' href='./css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='./css/custom.css'>
<script type="text/javascript" src="./lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
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
	<input type='button' id='btnJsp' class='btn btn-dark' value='등록(jsp)'>
	<input type='button' id='btnDao' class='btn btn-primary' value='등록(dao)'>
	<input type='button' id='btnBean' class='btn btn-danger' value='등록(bean)'>
	<input type='button' id='btnServletXML' class='btn btn-success' value='등록(servlet-xml)'>
	<input type='button' id='btnServletAnno' class='btn btn-warning' value='등록(servlet-anno)'>
	<input type='button' id='btnJstl' class='btn btn-secondary' value='등록(jstl)'>
	</div>
	</div>
	</div>
<script>
frm.rDate.valueAsDate = new Date();

$('#btnJsp').click(function(){
	$('#frm').attr('action', 'insert_r_jsp.jsp').submit();
})

$('#btnDao').click(function(){
	$('#frm').attr('action', 'insert_r_dao.jsp').submit();
})

$('#btnBean').click(function(){
	$('#frm').attr('action', 'insert_r_bean.jsp').submit();
})

$('#btnServletXML').click(function(){
	$('#frm').attr('action', 'insert_r_servlet_xml.nhn').submit();
})

$('#btnServletAnno').click(function(){
	$('#frm').attr('action', 'insert_r_servlet_anno.anno').submit();
})

$('#btnJstl').click(function(){
	$('#frm').attr('action', 'insert_r_jstl.do').submit();
})


</script>
</body>
</html>