<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.List"%>
<%@page import="mongo.MongoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select.jsp</title>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='../css/custom.css'>
<script type="text/javascript" src="../lib/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script src='mongo_member.js'></script>
</head>
<div class='jumbotron text-center'>
<h2>회원 검색</h2>
</div>
<body>
<div id='main'>
	<%
	  String findStr = request.getParameter("findStr");
		if(findStr == null){
			findStr = "";
		}
	  MongoMember mm = new MongoMember();
	  List<DBObject> list = mm.select(findStr);
	%>
</div>
<div class='container' style="margin-top:10px;">
<form name='frm' id='frm' method='post'>
  <div class='input-group'>
	<input type='text' name='findStr' value='<%=findStr%>' class='form-inline'>
	<input type='submit' value='검색' name='btnFind' id='btnFind' class='btn btn-dark' style="margin-right:5px;">
	<input type='button' value='추가' id='btnInsert' class='btn btn-primary'>
	<input type='hidden' name='mId'>
  </div>
</form>
<div id='title' class='row' style="margin-top:10px;">
	<span class='col-sm-3'>아이디</span>
	<span class='col-sm-3'>이름</span>
	<span class='col-sm-3'>등록일</span>
	<span class='col-sm-2'>학년</span>
</div>
</div>
<div id='result' class='container' style="margin-top:10px;">
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	for(DBObject o : list){
		// 한줄
		
		//String date = sdf.format(o.get("rDate"));
		//double a = (Double)o.get("grade");
		//int b = (int)a;
		String mId = (String)o.get("mId");
		
		out.print("<div id='item' class='row' onclick=\"view('"+mId+"')\">");
		out.print("<span class='col-sm-3'>"+mId + "</span>");
		out.print("<span class='col-sm-3'>"+o.get("mName") + "</span>");
		out.print("<span class='col-sm-3'>"+o.get("rDate") + "</span>");
		out.print("<span class='col-sm-2'>"+  o.get("grade")+ " 학년 </span></div>");
	}
%>
</div>
<script>
btnFunc()
</script>

</body>
</html>