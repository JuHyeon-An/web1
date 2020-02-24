<%@page import="bean_T.MemberVo"%>
<%@page import="bean_T.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDao dao = new MemberDao();
String mId = request.getParameter("mId");
MemberVo vo = dao.view(mId);
out.print(vo.toJSON());

%>
