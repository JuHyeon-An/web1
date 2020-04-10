<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/bulma-0.8.0/css/bulma.css'/>
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/css/mybatis.css'/>
<script src="https://kit.fontawesome.com/0cf6282279.js" crossorigin="anonymous"></script>
<script src='<%=request.getContextPath() %>/lib/jquery-3.4.1.js'></script>
<script src='<%=request.getContextPath() %>/js/bootstrap.js'></script>
<script src="./js/mybatis.js"></script>
<title>index_mybatis</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String inc = "./mybatis/select.jsp";
	if(request.getParameter("inc") != null){
		inc = request.getParameter("inc");
	}
%>

<section class="hero" id="mybatis">
  <div class="hero-body" id="header">
    <div class="container has-text-centered">
      <h1 class="title">
		주현이의 게시판
      </h1>
      <h2 class="subtitle">
		mybatis + servlet +jstl 
      </h2>
    </div>
  </div>
<nav class="level" id="level-nav">
  <p class="level-item has-text-centered">
    <a class="link">HOME</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link">조회</a>
  </p>
  <p class="level-item has-text-centered">
    <img src="https://image.flaticon.com/icons/svg/1762/1762755.svg" alt="" style="height: 30px;">
  </p>
  <p class="level-item has-text-centered">
    <a class="link">입력하기</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link">하이</a>
  </p>
</nav>

	<div class="row" id="center">
		<jsp:include page="<%=inc %>"/>
	</div>
	
	<footer class="footer text-center" id="footer">
	1907<sup>TM</sup>
	</footer>
	
</section>
<script>
btnFunc();
</script>
</body>
</html>