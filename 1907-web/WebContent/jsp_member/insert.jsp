<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
<link rel='stylesheet' type='text/css'
      href='../css/bootstrap.css'/>
<script src = "../lib/jquery.3.4.1.js"></script>
</head>
<body>
<div class='container'>
<div class="jumbotron text-center" style="height:70px;"><h3>회원등록</h3></div>
<form name="frm" id="frm" class="form-group" method="post" enctype="multipart/form-data">
<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-6">
<input type="text" name="mId" class="form-control" placeholder="아이디"/><br/>
<input type="password" name="pwd" class="form-control" placeholder="비밀번호"/><br/>
<input type="password" name="pwdCheck" class="form-control" placeholder="비밀번호확인"/><br/>
<input type="text" name="mName" class="form-control" placeholder="이름"/><br/>
<input type="date" name="rDate" class="form-control" placeholder="날짜"/><br/>
<select name="grade" class="form-control">
	<option value="none" selected disabled>학년선택</option>
	<option value="1">1학년</option>
	<option value="2">2학년</option>
	<option value="3">3학년</option>
	<option value="4">4학년</option>
</select><br/>
<input type="file" name="oriFile" id="btnFile"/><br/>
</div>
<div class="col-sm-2" style="margin-top:50px;">
<img src='http://placehold.it/150x180' id='photo' name='photo' width='150px' height='180px'/>
</div>
</div>
<hr/>
<input type="button" id="btnInsert" class="btn btn-dark" value="등록"/>
<input type="button" id="btnList" class="btn btn-dark" value="돌아가기"/>
<input type="text" name="findStr" value="${param.findStr }"/>
</form>
</div>
</body>
</html>