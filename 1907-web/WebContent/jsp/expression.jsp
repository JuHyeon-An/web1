<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 표현식 (expression) </title>
</head>
<body>
<h3> 표현식 (expression) </h3>

<%
	int a = 10;
	int b = 20;
	int s = a+b;
	out.print("<ul>");
	out.print("<li>a = "+a);
	out.print("<li>b = "+b);
	out.print("<li>sum = "+s);
	out.print("</ul>");
%>

<hr>
<ul>
<li>a = <%=a %>
<li>b = <%=b %>
<li>sum2 = <%=s %>
</ul>

</body>
</html>