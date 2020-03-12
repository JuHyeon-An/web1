<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index_mongo_member</title>

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
<h1 align='center'>mongo_member</h1>
</div>
<div id='list'>
<ol>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/delete_result.jsp'>delete_result</a></li>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/insert_result.jsp'>insert_result</a></li>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/insert.jsp'>insert</a></li>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/modify_result.jsp'>modify_result</a></li>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/modify.jsp'>modify</a></li>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/mongo_member.jsp'>mongo_member</a></li>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/select.jsp'>select</a></li>
  <li><a href='index.jsp?inc=./mongo_member/index_mongo_member.jsp&cont=./mongo_member/view.jsp'>view</a></li>
</ol>
</div>
</body>
</html>