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
	"select e.employee_id, e.first_name, to_char(e.salary, '99,999,999') salary, e.department_id, nvl(d.department_name,' ') dname"
	+ " from employees e left outer join departments d"
	+ " on e.department_id = d.department_id"
	+ " where e.employee_id = ? or lower(e.first_name) like lower(?)"
	+ " order by first_name";
	PreparedStatement ps = conn.prepareStatement(sql);
	int id = 0;
	try{
		id=Integer.parseInt(findStr);
	}catch(Exception ex){}
	
	// findStr에 문자가 들어오면 오류나서 0으로 반환, 숫자가 들어오면 parsing될 것.
	ps.setInt(1, id);
	ps.setString(2, "%"+findStr+"%");
	ResultSet rs = ps.executeQuery();
	
	
	StringBuilder sb = new StringBuilder();
	sb.append("[");
	
	String tempDid ="";
	while(rs.next()){
		if(rs.getInt("department_id")==0){
			tempDid="";
		}else{
			tempDid = rs.getInt("department_id")+"";
		}
		String str = 
			String.format("{'eid':'%s', 'fn':'%s', 'salary':'%s', 'did':'%s', 'dname':'%s'},",
					rs.getInt("employee_id"),
					rs.getString("first_name"),
					rs.getString("salary"),
					tempDid,
					rs.getString("dname")
				);
			sb.append(str);
	};
	String data = sb.toString();
	data = data.replaceAll("\'", "\"");
	if(data.length()>1){
		// 데이터가 검색되었으면 그때 콤마를 지워라
		data = data.substring(0, data.length()-1);
	};
	
	data += "]";
	out.print(data);
%>