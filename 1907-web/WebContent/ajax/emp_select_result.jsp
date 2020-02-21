<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="bean.DBConn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String findStr = request.getParameter("findStr");
	Connection conn = DBConn.getConnHr();
	String sql =
	"select e.employee_id, e.first_name, to_char(e.salary, '99,999,999') salary, e.department_id, d.department_name"
	+ " from employees e, departments d"
	+ " where e.first_name like ? and e.department_id = d.department_id";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, "%"+findStr+"%");
	ResultSet rs = ps.executeQuery();
	
	StringBuilder sb = new StringBuilder();
	sb.append("[");
	while(rs.next()){
		String str = 
			String.format("{'eid':'%s', 'fn':'%s', 'salary':'%s', 'did':'%d', 'dname':'%s'},",
					rs.getInt("employee_id"),
					rs.getString("first_name"),
					rs.getString("salary"),
					rs.getInt("department_id"),
					rs.getString("department_name")
				);
			sb.append(str);
	};
	String data = sb.toString();
	data = data.replaceAll("\'", "\"");
	data = data.substring(0, data.length()-1);
	data += "]";
	out.print(data);
%>