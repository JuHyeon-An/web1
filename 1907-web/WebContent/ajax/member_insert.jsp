<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String mid = request.getParameter("mid");
String mname = request.getParameter("mname");
String rdate = request.getParameter("rdate");
String grade = request.getParameter("grade");
//int grade = Integer.parseInt(request.getParameter("grade"));
//temp = temp.substring(1, temp.length());
//int grade = Integer.parseInt(temp);


//out.print("<li>mid : "+mid);
//out.print("<li>pwd : "+mname);
//out.print("<li>hobby : " +hobby);
//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
MemberVo vo = new MemberVo(mid, mname, rdate, grade);
MemberDao dao = new MemberDao();
int r = dao.insert(vo);
out.print(r);


%>