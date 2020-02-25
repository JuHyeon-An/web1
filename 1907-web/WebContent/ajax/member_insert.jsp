<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

out.print(request.getParameter("mid"));
int g = Integer.parseInt(request.getParameter("grade"));
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date date = sdf.parse(request.getParameter("rdate"));
MemberDao dao = new MemberDao();
MemberVo vo = new MemberVo();
vo.setmId(request.getParameter("mid"));
vo.setmName(request.getParameter("mname"));
vo.setrDate(date);
vo.setGrade(g);
String r = dao.insert(vo);
out.print(r);


/*

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String mid = request.getParameter("mid");
out.print(mid);
String mname = request.getParameter("mname");
Date rdate = sdf.parse(request.getParameter("rdate"));
int grade = Integer.parseInt(request.getParameter("grade"));

MemberVo vo = new MemberVo(mid, mname, rdate, grade);
MemberDao dao = new MemberDao();
String str = dao.insert(vo);

out.print(str);
*/

%>