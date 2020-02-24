<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="bean.DBConn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

	//String findStr = request.getParameter("findStr");
	String findStr = request.getParameter("findStr");
	Connection conn = DBConn.getConnHr();
	String sql = "select * from employees "
				+ "where lower(first_name) like ?";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, "%"+findStr+"%");
	ResultSet rs = ps.executeQuery();
	
	StringBuilder sb = new StringBuilder();
	
	String str = "";
	while(rs.next()){
		str += "<option>"+ rs.getString("first_name") +"</option>";
	};
	
	out.print(str);

%>