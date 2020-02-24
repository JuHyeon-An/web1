<%@page import="bean_T.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
String mid = request.getParameter("mId");
MemberDao dao = new MemberDao();
String msg = dao.delete(mid);
out.print(msg);
%>