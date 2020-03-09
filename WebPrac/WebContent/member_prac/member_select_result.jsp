<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardPrac.MemberDao"%>
<%@ page import="boardPrac.MemberVo"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.GsonBuilder" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String findStr = request.getParameter("findStr");
	MemberDao dao = new MemberDao();
	List<MemberVo> list = new ArrayList<MemberVo>();
	list = dao.select(findStr);
	
	Gson gson = new Gson();
	String json = gson.toJson(list);
	
	out.print(json);
%>
