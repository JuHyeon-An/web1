<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
String findStr = request.getParameter("findStr");
MemberDao dao = new MemberDao();
String json = dao.select(findStr);
out.print(json);
%>
