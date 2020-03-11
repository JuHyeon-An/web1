<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mongo.MongoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify_result</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='../css/custom.css'>
<script type="text/javascript" src="../lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script src='mongo_member.js'></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

MongoMember mm = new MongoMember();
BasicDBObject obj = new BasicDBObject();

obj.put("mId", request.getParameter("mId"));
obj.put("mName", request.getParameter("mName"));
obj.put("rDate", request.getParameter("rDate"));
obj.put("grade", request.getParameter("grade"));
String msg = mm.modify(obj);

%>
<div class='container' style="margin-top:20px;">
<h2><%=msg %></h2>
<form name='frm' id='frm' method='post'>
	<input type='hidden' name='findStr' value='<%=request.getParameter("findStr")%>'>
	<input type='button' name='btnList' id='btnList' value='목록'>
	
</form>
</div>
<script>
btnFunc()
</script>
</body>
</html>