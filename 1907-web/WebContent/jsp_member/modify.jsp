<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
<div class='container'>
<h3>Member modify</h3>

<form name="frm" id="frm" class="form-group" method="post">
<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-6">
<input type="text" name="mId" class="form-control" placeholder="아이디"/><br/>
<input type="password" name="pwd" class="form-control" placeholder="비밀번호"/><br/>
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
<input type="button" id="btnUpdate" class="btn btn-dark" value="수정"/>
<input type="button" id="btnList" class="btn btn-dark" value="되돌아가기"/>
</form>
</div>
</body>
</html>