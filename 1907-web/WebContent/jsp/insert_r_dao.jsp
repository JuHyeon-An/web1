<%@page import="bean.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.MemberVo"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dao로 요청처리</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='../css/custom.css'>
<script type="text/javascript" src="../lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String mId = request.getParameter("mId");
	String mName= request.getParameter("mName");
	String rDate = request.getParameter("rDate");
	String grade = request.getParameter("grade");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	MemberVo vo = new MemberVo();
	vo.setmId(mId);
	vo.setmName(mName);
	vo.setrDate(sdf.parse(rDate));
	vo.setGrade(Integer.parseInt(grade));
	
	MemberDao dao = new MemberDao();
	String msg = dao.insert(vo);
%>
<div class="jumbotron text-center">
<h3> dao로 요청 처리 </h3>
</div>

<ul class="list-group">
	<li class= "list-group-item">mId = <%=mId %> </li>
	<li class= "list-group-item">mName = <%=mName %> </li>
	<li class= "list-group-item">rDate = <%=rDate %> </li>
	<li class= "list-group-item">grade = <%=grade %> </li>
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