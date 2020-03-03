<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>


<%
	System.out.println(user.getUserID());
	System.out.println(user.getUserPassword());
	System.out.println(user.getUserName());
	System.out.println(user.getUserGender());
	System.out.println(user.getUserEmail());
	
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
	if(user.getUserID() == null || user.getUserPassword() == null || 
		user.getUserName() == null || user.getUserGender() == null ||
		user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('모든 항목을 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO dao = new UserDAO();
		int result = dao.join(user);
		
		if(result < 0){
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	}
	
%>
