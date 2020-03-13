<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="bean.MemberVo2" scope="page"/>
<jsp:setProperty name="vo" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bean으로 요청처리</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='../css/custom.css'>
<script type="text/javascript" src="../lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	MemberDao dao = new MemberDao();
	String msg = dao.insertVo2(vo);
%>
<div class="jumbotron text-center">
<h3> bean으로 요청 처리 </h3>
</div>

<ul class="list-group">
	<li class= "list-group-item">mId = <%=vo.getmId() %> </li>
	<li class= "list-group-item">mName = <%=vo.getmName() %> </li>
	<li class= "list-group-item">rDate = <%=vo.getrDate() %> </li>
	<li class= "list-group-item">grade = <%=vo.getGrade() %> </li>
</ul>

<div class="toast" data-autohide="false">
  <div class="toast-header">
    <strong class="mr-auto text-primary">Toast Header</strong>
    <small class="text-muted">5 mins ago</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
  </div>
  <div class="toast-body">
    <%=msg %>
  </div>
</div>

<script>
$(document).ready(function(){
  $('.toast').toast({delay: 2000});
  $('.toast').toast('show');
});
</script>
</body>
</html>