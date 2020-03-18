<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
</head>
<body>
<div class='container'>
<h3>Member view</h3>
<form name="frm" id="frm" class="form-group" method="post">
<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-6">
<input type="text" name="mId" class="form-control" placeholder="아이디" value="${mId }" readonly/><br/>
<input type="text" name="mName" class="form-control" placeholder="이름" value="${mName }" readonly/><br/>
<input type="date" name="rDate" class="form-control" placeholder="날짜" value="${rDate }" readonly/><br/>
<select name="grade" class="form-control">
	<option value="1" selected disabled>1학년</option>
	<option value="2" disabled>2학년</option>
	<option value="3" disabled>3학년</option>
	<option value="4" disabled>4학년</option>
</select><br/>
<input type="file" name="oriFile" id="btnFile"><br/>
</div>
<div class="col-sm-2" style="margin-top:50px;">
<img src='http://placehold.it/150x180' id='photo' name='photo' width='150px' height='180px'/>
</div>
</div>
<hr/>
<input type="button" id="btnModify" class="btn btn-dark" value="수정"/>
<input type="button" id="btnDelete" class="btn btn-dark" value="삭제"/>
<input type="button" id="btnList" class="btn btn-dark" value="목록으로"/>
</form>
</div>
</body>
</html>