<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

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
<h1 align='center'>index_ajax</h1>
</div>
<div id='list'>
<ol>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/csv.jsp'>csv</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/emp_complete_result.jsp'>emp_complete_result</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/emp_complete.jsp'>emp_complete</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/emp_select_form.jsp'>emp_select_form</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/emp_select_result.jsp'>emp_select_result</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/json.jsp'>json</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_insert_form.jsp'>member_insert_form</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_insert.jsp'>member_insert</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_main.jsp'>member_main</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_modify_form.jsp'>member_modify_form</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_modify.jsp'>member_modify</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_select_form.jsp'>member_select_form</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_select.jsp'>member_select</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member_view_form.jsp'>member_view_form</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/member.css'>member(css)</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/post_result.jsp'>post_result</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/post.jsp'>post</a></li>
  <li><a href='index.jsp?inc=./ajax/index_ajax.jsp&cont=./ajax/xml.jsp'>xml</a></li>
</ol>
</div>
</body>
</html>