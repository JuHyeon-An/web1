<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if</title>
</head>
<body>
<h3>if</h3>
<c:set var="kor" value="78"/>
<c:if test="${kor>=60 }" var="r">
result : ${r }
</c:if>
</body>
</html>