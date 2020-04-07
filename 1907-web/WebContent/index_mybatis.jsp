<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/css/bootstrap.css'/>
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/css/mybatis.css'/>
<script src='<%=request.getContextPath() %>/lib/jquery-3.4.1.js'></script>
<script src='<%=request.getContextPath() %>/js/bootstrap.js'></script>
<script src="./js/mybatis.js"></script>
<title>index_mybatis</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String inc = "select.myba";
	if(request.getParameter("inc") != null){
		inc = request.getParameter("inc");
	}
%>
<div class="container mt-3" id="mybatis">

	<div class="jumbotron text-center" id="header">
		<h1>mybatis + servlet +jstl </h1>
	</div>
	
	<div class="row" id="center">
		<jsp:include page="<%=inc %>"/>
	</div>
	
	<div class="footer text-center" id="footer">
	1907<sup>TM</sup>
	</div>
	
</div>
<script>
btnFunc();
</script>
</body>
</html>