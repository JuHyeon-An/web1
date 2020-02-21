<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="bean.DBConn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
/*  문자열을 입력받아 employees 테이블에서 사번, 성명, 급여, 부서코드,
부서명을 조회하는 프로그램을 작성하시오. (데이터형식 json) */

Connection conn = DBConn.getConnHr();
String sql = "select * from employees";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>

