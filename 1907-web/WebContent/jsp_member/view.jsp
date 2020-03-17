<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<link rel='stylesheet' type='text/css'
      href='../css/bootstrap.css'/>
</head>
<body>
<div class='container'>
<h3>Member view</h3>
<form id="frm" name="frm" method="post" class="form-group">
<label>아이디</label><input type="text" name="mId" class="form-control" readonly/><br/>
<label>이름</label><input type="text" name="mName" class="form-control" readonly/><br/>
<label>날짜</label><input type="date" name="rDate" class="form-control" readonly/><br/>
<label>학년</label><input type="date" name="rDate" class="form-control" readonly/><br/>
<label>사진 </label><br/><input type="file" name="oriFile" readonly/><br/>
<hr/>
<input type="button" id="btnModify" class="btn btn-dark" value="수정"/>
<input type="button" id="btnDelete" class="btn btn-dark" value="삭제"/>
<input type="button" id="btnList" class="btn btn-dark" value="목록으로"/>
</form>
</div>
</body>
</html>