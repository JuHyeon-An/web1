<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${msg }</h3>
<form name="frm" id="frm" method="post" class="container">
<input type="button" id="btnList" value="목록으로" class="btn btn-dark"/>
<input type="button" id="btnGoInsert" value="추가등록" class="btn btn-dark"/>
<input type="text" name="findStr" value="${findStr }"/>
</form>
</body>
</html>