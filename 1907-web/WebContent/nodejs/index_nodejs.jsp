<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index_nodejs</title>

<style>
head, body{
  font-family:'나눔바른고딕';
}
li{
font-size:18px;
list-style-image:url('../images/correct (1).png');
}
#title{
background-color:#F2E6A7;
text-shadow:2px 2px 2px #999;
color:#F29F05;
}
#list{
background-color:#F2ECCE;
}
a{
  color:black;
  text-decoration:none;
}
</style>

</head>
<body>
<div id='title'>
<h1 align='center'>nodejs</h1>
</div>
<div id='list'>
<ol>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/delete_result.jsp'>delete_result</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/index.html'>index</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/insert_form.ejs'>insert_form</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/insert_result.ejs'>insert_result</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/modify_form.ejs'>modify_form</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/modify_result.ejs'>modify_result</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/select.ejs'>select</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/view.ejs'>view</a></li>
  <li><a href='index.jsp?inc=./nodejs/index_nodejs.jsp&cont=./nodejs/http/webServer.js'>webServer</a></li>
  
  
  
</ol>
</div>
</body>
</html>