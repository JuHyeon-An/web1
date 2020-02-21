<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String mid = request.getParameter("mid");
String pwd = request.getParameter("pwd");
String hobby = request.getParameter("hobby");


out.print("<li>mid : "+mid);
out.print("<li>pwd : "+pwd);
out.print("<li>hobby : " +hobby);

String[] mnt = request.getParameterValues("mnt");
// 값이 많으면 for문으로 루핑, 값이 적으면 그냥 찍기

for(int i=0; i<mnt.length; i++){
	out.print("<li>mnt "+i+" : " +mnt[i]);
};

String[] sel = request.getParameterValues("sel");

for(int i = 0; i<sel.length; i++){
	out.print("<li>sel : "+sel[i]);
};

%>
</body>
</html>