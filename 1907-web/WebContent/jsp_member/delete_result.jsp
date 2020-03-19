<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete_result</title>
</head>
<body>
<h3>${msg }</h3>
<form name="frm" id="frm" method="post" class="container">
<input type="button" id="btnList" value="목록으로" class="btn btn-dark"/>
<input type="button" id="btnGoInsert" value="추가등록" class="btn btn-dark"/>
<input type="text" name="findStr" value="${findStr }"/>
<input type="text" name="nowPage" value="${param.nowPage }"/>
</form>
</body>
</html>