<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%@ page import="boardPrac.MemberDao" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="boardPrac.MemberVo" scope="page"/>
<jsp:setProperty name="member" property="*"/>

<%
	MemberDao dao = new MemberDao();
	int r = dao.Insert(member);
	
	if(r < 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류발생.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추가되었습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
%>