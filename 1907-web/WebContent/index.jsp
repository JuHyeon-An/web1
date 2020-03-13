<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1907-web</title>
<link rel='stylesheet' type='text/css'
      href='./css/index.css'/>
<style>

</style>

</head>
<body>
<%
  String inc = "./html5/index_html.jsp";
  if(request.getParameter("inc")!=null){
	  inc = request.getParameter("inc");
  }
  // 들어온 inc값이 없으면 index_html.jsp로 간다
  //get type으로 할것!
  
  
  String cont = "./html5/canvas_shadow.jsp";
  if(request.getParameter("cont")!=null){
	  cont = request.getParameter("cont");
  }
  
%>
<div id='main'>
  
  <!-- top.jsp (정적삽입) -->
  <%@ include file="top.jsp" %>
  <div id='center'>
    <div id='sub_menu'>
		<jsp:include page="<%=inc %>"/>
	</div>
    <div id='main_content'>
		<jsp:include page="<%=cont %>"/>
	</div>
    <aside id='aside'>Aside</aside>
  </div>

  <!-- bottom.jsp (정적삽입)-->
  <%@ include file="bottom.jsp" %>
</div>
<script> 

/*
 * 
 */


</script>
</body>
</html>