<%@page import="bean.MemberVo2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="vo" class="bean.MemberVo2" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach</title>
</head>
<body>
<%
vo.setmId("a");
MemberDao dao = new MemberDao();
List<MemberVo2> list = dao.listAll(vo.getmId());
out.print(list);
%>
<!-- 
<c:forEach var="member" items="${list }" begin="0" end="10" step="1" varStatus="status">
<ul>
	<li>${list[index].mId }</li>
</ul>
</c:forEach>
 -->
</body>
</html>