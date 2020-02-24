<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="bean.DBConn" %>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <departments> 
<%
	Connection conn = DBConn.getConnHr();
	String sql = "select * from departments";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		StringBuilder sb = new StringBuilder();
		sb.append("<department>");
		sb.append("<id>" + rs.getInt("department_id") + "</id>");
		sb.append("<dname>" + rs.getString("department_name")+"</dname>");
		sb.append("<mid>" + rs.getInt("manager_id") + "</mid>");
		sb.append("</department>");
		out.print(sb.toString());
	};
%>
</departments>
