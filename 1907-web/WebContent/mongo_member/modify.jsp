<%@page import="com.mongodb.DBObject"%>
<%@page import="mongo.MongoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='../css/custom.css'>
<script type="text/javascript" src="../lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script src='mongo_member.js'></script>
</head>
<% 

request.setCharacterEncoding("utf-8");

%>
<body>
<div class='jumbotron text-center'>
<h2>회원정보 수정</h2>
</div>
<div class='container' id='main' style="margin:10px; padding:30px;">
<form name='frm' id='frm' method='post'>
	<div class='form-group'>
	<span>아이디 </span><input type='text' name='mId' id='mId' value='<%=request.getParameter("mId")%>'></div>
	<div class='form-group'>
	<span>이름 </span><input type='text' name='mName' value='<%=request.getParameter("mName")%>'></div>
	<div class='form-group'>
	<span>날짜 </span><input type='date' name='rDate' value='<%=request.getParameter("rDate")%>'></div>
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
	<input type='button' id='btnUpdate' class='btn btn-dark' value='수정'>
	<input type='button' id='btnList' class='btn btn-dark' value='목록'>
	<input type='hidden' name='findStr' value='<%=request.getParameter("findStr") %>'>
	</div>
</form>
</div>
	<script>
	frm.grade.selectedIndex = Number('<%=request.getParameter("grade")%>')-1;
	btnFunc()
	</script>
</body>
</html>