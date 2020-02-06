<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_list_style</title>
<style>

header, body{
  font-family:'나눔바른고딕';
  font-size:20px;
  color:white;
  background-color:#302d2d;
  line-height:1.5;
}
#ul1{
  list-style-image:url('../images/mountain.png');
  list-style-position:inside;
}
#ul2{
  list-style-image:url('../images/puppy.png');
  list-style-position:outside;
}
</style>
</head>
<body>
<h1>list-style</h1>
<ul>
  <li>list-style-image:url(path) </li>
  <li>list-style-position : inside | outside </li>
</ul>
<hr/>
<ul id='ul1'>
  <li>백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 
  백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 
  백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 백두산 
  </li>
  <li>한라산</li>
  <li>설악산</li>
  <li>금강산</li>
  <li>치악산</li>
</ul>

<ul id='ul2'>
  <li>강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 
  강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 
  강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 강아지 </li>
  <li>송아지</li>
  <li>망아지</li>
</ul>

</body>
</html>