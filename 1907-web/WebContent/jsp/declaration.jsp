<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부(declaration)</title>
</head>
<body>
<h3>선언부</h3>

<%
	out.print("박원기");
%>

<%!
	public void aaaa(){
		int a = 10;
	}
%>
</body>
</html>