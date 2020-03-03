<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="*"/>

<%
	String userID = null;
	userID = (String) session.getAttribute("userID");
	
	if (userID != null) {
		//user가 로그인 되어 있다면
		
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			//항목이 비어있을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 항목을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO dao = new BbsDAO();
			int r = dao.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			
			if (r > 0) {
				// 글쓰기 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
			} else {
				// 오류발생
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
		}

		System.out.println(bbs.getUserID());
		System.out.println(bbs.getBbsID());
		System.out.println(bbs.getBbsContent());
		System.out.println(bbs.getBbsDate());
		System.out.println(bbs.getBbsTitle());
		System.out.println(bbs.getBbsAvailable());
		
		} else {
			// 로그인되지 않았을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('먼저 로그인을 해주세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}

		
%>
