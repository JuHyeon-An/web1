<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="bean.DBConn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Connection conn = DBConn.getConnHr();
String sql = "select * from employees";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
/*
  [
   {'id':'100', 'fn' : 'Steven', 'mid' : '200' },
   {'id':'100', 'fn' : 'Steven', 'mid' : '200' },
   {'id':'100', 'fn' : 'Steven', 'mid' : '200' }
  ]
*/
StringBuilder sb = new StringBuilder();
sb.append("[");
while(rs.next()){
	String str = 
		String.format("{'id':'%s' , 'fn':'%s', 'mid':'%s'},",
			rs.getInt("employee_id"),
			rs.getString("first_name"),
			rs.getInt("manager_id")
		);
	sb.append(str);
};
String data = sb.toString();
data = data.replaceAll("\'","\"");
data = data.substring(0, data.length()-1);
data += "]";
out.print(data);
%>