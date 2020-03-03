<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	Bbs bbs = null;
	String userID = null;
	BbsDAO dao = new BbsDAO();
	if (session.getAttribute("userID") != null) {
	//user가 로그인 되어 있다면
		userID = (String) session.getAttribute("userID");
			if(request.getParameter("bbsID") != null){
				int bbsID = Integer.parseInt(request.getParameter("bbsID"));
				bbs = dao.getBbs(bbsID);
					if(userID.equals(bbs.getUserID())){
						
						int r = dao.delete(bbsID);
			
						if (r > 0) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='bbs.jsp'");
						script.println("</script>");
					} else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('삭제에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('권한이 없습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시물이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}else{
			// 로그인되지 않았을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('먼저 로그인을 해주세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
	}
		
%>
