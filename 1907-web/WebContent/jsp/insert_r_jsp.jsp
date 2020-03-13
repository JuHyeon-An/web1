<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_r_jsp</title>
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
	
	Connection conn = DBConn.getConn();
	String sql = "insert into member(mId, mName, rDate, grade) values(?,?,?,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, mId);
	ps.setString(2, mName);
	ps.setString(3, rDate);
	ps.setInt(4, Integer.parseInt(grade));
	
	int r = ps.executeUpdate();
	String msg = "";
	
	if(r>0){
		msg = "성공적으로 입력완료";	
	}else{
		msg = "오류발생";
	}
	
%>
<div class="jumbotron text-center">
<h3> 순수 jsp로 요청 처리 </h3>
</div>

<ul class="list-group">
	<li class= "list-group-item">mId = <%=mId %> </li>
	<li class= "list-group-item">mName = <%=mName %> </li>
	<li class= "list-group-item">rDate = <%=rDate %> </li>
	<li class= "list-group-item">grade = <%=grade %> </li>
</ul>

<div class="toast">
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