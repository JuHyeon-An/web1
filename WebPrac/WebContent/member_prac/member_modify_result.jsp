<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="boardPrac.MemberDao" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="boardPrac.MemberVo" scope="page"/>
<jsp:setProperty name="member" property="*"/>
