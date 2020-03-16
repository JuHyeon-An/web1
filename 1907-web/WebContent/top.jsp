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
	  <li><a href='index.jsp?inc=./html5/index_html.jsp'>HTML</a></li>
	  <li><a href='index.jsp?inc=./javascript/index_javascript.jsp&cont=./javascript/array_1.jsp'>Javascript</a></li>
	  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/emp_select_form.jsp'>ajax</a></li>
	  <li><a href='index.jsp?inc=./ajax_in_jquery/index_ajax_in_jquery.jsp&cont=./ajax_in_jquery/member_main.jsp'>ajax_in_jqeury</a></li>
	  <li><a href='index.jsp?inc=./jquery/index_jquery.jsp&cont=./jquery/array_1.jsp'>jquery</a></li>
	  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/index.html'>nodejs</a></li>
	  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/select.jsp'>mongo_member</a></li>
	  <li><a href='#' onclick='goUrl("./jsp", "/index_jsp.jsp", "/insert.jsp")'>jsp</a></li>
		
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