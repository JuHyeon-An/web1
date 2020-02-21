<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = DBConn.getConnHr(); 
String sql = "select * from employees";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){
  String str = 
		  String.format("%s,%s,%s\n", rs.getString("employee_id"),
				  rs.getString("first_name"),
				  rs.getInt("salary") );
  out.print(str);
};
%>
