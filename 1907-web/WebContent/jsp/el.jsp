<%@page import="bean.MemberVo3"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el</title>
</head>
<body>
<h3>el example</h3>
<ul>
  <li>\${ 10+5 } = ${10+5}</li>
  <li>\${ 10>5 } = ${10>5 }</li>
  <li><%=(10+5) %></li>
  <li><%=(10>5) %></li>
</ul>
<%
	MemberVo3 vo = new MemberVo3();
	vo.setmId("hong");
	vo.setPwd("1234");
%>
<ul>
  <li><%=vo.getmId() %></li>
  <li><%=vo.getPwd() %></li>
</ul>

<%
	request.setAttribute("vo", vo);
%>

<ul>
  <li>${vo.mId }</li>
  <li>${vo.pwd }</li>
</ul>
</body>
</html>