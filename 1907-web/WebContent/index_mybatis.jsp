<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/bulma-0.8.0/css/bulma.css'/>
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/css/mybatis.css'/>
<link rel='stylesheet' type='text/css' href='<%=request.getContextPath() %>/css/fontawesome.min.css'/>
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
</section>

	<div class="row" id="center">
		<jsp:include page="<%=inc %>"/>
	</div>
	
	<div class="footer text-center" id="footer">
	1907<sup>TM</sup>
	</div>
	
<script>
btnFunc();
</script>
</body>
</html>