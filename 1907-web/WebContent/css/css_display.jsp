<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_display</title>
<style>
  div{
    border:2px solid #000;
    width:200px;
    height:100px;
	display : inline-block;
  }
  #span>span{
    display:block;
  }
  
</style>
</head>
<body>
<h3>display</h3>
<div>abc</div>
<div>123</div>
<div>가나다</div>
<div id='span'>
  <span>span1</span>
  <span>span2</span>
  <span>span3</span>
</div>
</body>
</html>