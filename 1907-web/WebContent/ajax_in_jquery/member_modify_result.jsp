<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean_T.MemberVo"%>
<%@page import="bean_T.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
MemberDao dao = new MemberDao();
MemberVo vo = new MemberVo();
Date tempDate = sdf.parse(request.getParameter("rDate"));
vo.setmId(request.getParameter("mId"));
vo.setmName(request.getParameter("mName"));
vo.setrDate(tempDate);
vo.setGrade(Integer.parseInt(request.getParameter("grade")));
String msg = dao.update(vo);
out.print(msg);
%>