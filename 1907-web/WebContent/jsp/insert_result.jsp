<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_result</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='../css/custom.css'>
<script type="text/javascript" src="../lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>
<br/>
<h4>servlet에서 응답한 페이지</h4>
<%
	String msg = (String)request.getAttribute("msg");
%>
<div class="jumbotron text-center">
<h3><%=msg %></h3>
</div>
</body>
</html>