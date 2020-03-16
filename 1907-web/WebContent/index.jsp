<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1907-web</title>
<link rel='stylesheet' type='text/css'
      href='./css/index.css'/>
<link rel='stylesheet' type='text/css'
      href='./css/bootstrap.css'/>
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./js.bootstrap.js'></script>

<style>

</style>

</head>
<body>
<%

request.setCharacterEncoding("utf-8");

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

let path='';
let cont='';
let inc='';

function goUrl(path, inc, cont){
	localStorage.setItem("path", path);
	localStorage.setItem("inc", inc);
	let url = "index.jsp?inc="+path+inc+'&cont='+path+cont;
	location.href = url;
}

function goSub(cont){
	path=localStorage.getItem('path');
	inc=localStorage.getItem('inc');
	let url = "index.jsp?inc="+path+inc+'&cont='+path+cont;
	location.href = url;
}

function goSubmit(frm, cont){
	path = localStorage.getItem('path');
	inc = localStorage.getItem('inc');
	let url = 'index.jsp?inc='+path+inc+'&cont='+path+cont;
	frm.action = url;
	// get 타입으로도 넘기고
	frm.submit();
	// post 타입으로도 넘김
	
}


</script>
</body>
</html>