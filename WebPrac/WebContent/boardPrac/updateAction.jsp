<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String userID = null;
	userID = (String) session.getAttribute("userID");
	Bbs bbs = null;
	
	if(request.getParameter("bbsID") != null){
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		bbs = new BbsDAO().getBbs(bbsID);
	if (userID != null) {
		//user가 로그인 되어 있다면
		if(userID.equals(bbs.getUserID())){
			// 해당 유저인지 확인
			if (request.getParameter("bbsContent").equals("") || request.getParameter("bbsTitle").equals("")) {
				//항목이 비어있을 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 항목을 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BbsDAO dao = new BbsDAO();
				int r = dao.update(request.getParameter("bbsContent"), request.getParameter("bbsTitle"), bbsID);
				
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
					script.println("alert('수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
			}
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}

		} else {
			// 로그인되지 않았을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('먼저 로그인을 해주세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정할 수 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
	}
		
%>
