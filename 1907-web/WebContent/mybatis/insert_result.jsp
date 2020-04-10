<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mybatis">
<h1>${msg }</h1>
<form name="frm" method="post">
	<input type="text" name="findStr" id="findStr" value="${p.findStr }"/>
	<input type="text" name="nowPage" id="nowPage" value="${p.nowPage }"/>
	<input type="text" name="serial" id="serial" value="${serial }"/>
	
	<input type="button" class="button" name="" id="btnList" value="목록으로"/>
</form>
</div>
</body>
</html>