<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
<div class='container'>
<h3>Member modify</h3>

<form name="frm" id="frm" class="form-group" method="post" enctype = "multipart/form-data">
<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-6">
<input type="text" name="mId" class="form-control" placeholder="아이디" value="${vo.mId }"/><br/>
<input type="text" name="pwd" class="form-control" placeholder="비밀번호" value="${vo.pwd }"/><br/>
<input type="text" name="mName" class="form-control" placeholder="이름" value="${vo.mName }"/><br/>
<input type="date" name="rDate" class="form-control" placeholder="날짜" value="${vo.rDate }"/><br/>
<select name="grade" class="form-control">
	<option value="none" selected disabled>학년선택</option>
	<option value="1">1학년</option>
	<option value="2">2학년</option>
	<option value="3">3학년</option>
	<option value="4">4학년</option>
</select><br/>
<input type="file" name="oriFile" id="btnFile" onchange="fileChanged();"/><br/>
</div>
<div class="col-sm-2" style="margin-top:50px;">
<img src=
<c:if test="${empty vo.photos[0].sysFile }">
'http://placehold.it/150x180'</c:if> 
<c:if test="${not empty vo.photos[0].sysFile }">
'./upload/${vo.photos[0].sysFile }'</c:if> 
id='photo' name='photo' width='150px' height='180px'/>
</div>
</div>
<hr/>
<input type="button" id="btnUpdate" class="btn btn-dark" value="수정"/>
<input type="button" id="btnList" class="btn btn-dark" value="되돌아가기"/>
<input type="text" id="nowPage" name="nowPage" value="${param.nowPage }"/>
<input type="text" id="ifChanged" name="ifChanged"/>
</form>
</div>
<script>
frm.grade.selectedIndex = ${vo.grade }-1;
</script>
</body>
</html>