<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="vo" class="bean.MemberVo3"/>
<jsp:setProperty property="*" name="vo"/>
<%
MemberDao dao = new MemberDao();
int r = dao.login(vo);
out.print("<script>");

if(r==1){
	session.setAttribute("mId", vo.getmId());
	out.print("location.href='../index.jsp'");
}else if(r==0){
	out.print("alert('비밀번호가 일치하지 않습니다');");
	out.print("history.back();");
}else if(r==-1){
	out.print("alert('아이디가 존재하지 않습니다');");
	out.print("history.back();");
}else if(r<-1){
	out.print("alert('DB오류');");
	out.print("history.back();");
}
out.print("</script>");
%>
</body>
</html>