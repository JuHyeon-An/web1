<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='login'>
	<% if(session.getAttribute("mId")==null){ %>
	<input type='button' value='로그인' id='btnLogin'>
	 <%
	 }else{
	 %>
	<output> [<%=session.getAttribute("mId") %> 씨 방가 방가]</output>
	<input type='button' value='로그아웃' id='btnLogout'>
	<%} %>
</div>
<header id='header'>header</header>
  <nav id='nav'>
	<ul>
	 
	  <li><a href="#" onclick='goUrl("./css", "/index_css.jsp", "/css_backgroundimage.jsp")'>CSS</a></li>
	  <li><a href="#" onclick='goUrl("./html5", "/index_html.jsp", "/canvas_shadow.jsp")'>HTML</a></li>
	  <li><a href='#' onclick='goUrl("./javascript", "/index_javascript.jsp", "/array_1.jsp")'>Javascript</a></li>
	  <li><a href='#' onclick='goUrl("./ajax", "/index_ajax.jsp", "/emp_select_form.jsp")'>ajax</a></li>
	  <li><a href='#' onclick='goUrl("./ajax_in_jquery", "/index_ajax_in_jquery.jsp", "/member_main.jsp")'>ajax_in_jqeury</a></li>
	  <li><a href='#' onclick='goUrl("./jquery", "/index_jquery.jsp", "/array_1.jsp")'>jquery</a></li>
	  <li><a href='#' onclick='goUrl("./nodejs", "/index_nodejs.jsp", "/http/index.html")'>nodejs</a></li>
	  <li><a href='#' onclick='goUrl("./mongo_member", "/index_mongo_member.jsp", "/select.jsp")'>mongo_member</a></li>
	  <li><a href='#' onclick='goUrl("./jsp", "/index_jsp.jsp", "/insert.jsp")'>jsp</a></li>
	  <li><a href='#' onclick='goUrl("./jsp_member", "/index_jsp_member.jsp", "/select.jsp")'>jsp_member</a></li>
		
	</ul>
  </nav>
  <script>
  if($('#btnLogin')!=null){
  $('#btnLogin').click(function(){
	  location.href='index.jsp?inc=./css/index_css.jsp&cont=./member/login.jsp';
  })
  }
  
  if($('#btnLogout')!=null){
  $('#btnLogout').click(function(){
	location.href='./member/logout.jsp';  
  })
  }
  </script>
</body>
</html>