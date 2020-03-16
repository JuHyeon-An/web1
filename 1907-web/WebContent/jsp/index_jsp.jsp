<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index_jsp</title>
</head>
<body>
<h3>공갈페이지</h3>
  <fieldset><legend></legend>
<ul>
  <li><a href='index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp/declaration.jsp'>선언문</a></li>
  <li><a href='index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp/expression.jsp'>표현식</a></li>
  <li><a href='index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp/insert.jsp'>요청방법</a></li>
  </ul>
  </fieldset>
  <fieldset><legend>EL JSTL</legend>
  <ul>
  <li><a href='index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp/el.jsp'>EL</a></li>
  <li><a href='index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp/el_param.jsp'>Param</a></li>
  <li><a href='index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp/set.jsp'>set</a></li>
  <li><a href='index.jsp?inc=./jsp/index_jsp.jsp&cont=./jsp/if.jsp'>if</a></li>
  <li><a href='#' onclick='goSub("/if_form.jsp")'>if</a></li>
 
</ul>
  </fieldset>
</body>
</html>