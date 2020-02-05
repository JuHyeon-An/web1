<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_border</title>
<style>
div{
  width:200px; height:200px;
  margin:20px;
}
#div1{
  border-width:30px;
  border-style:solid;
  border-left-color:#ff0000;
  border-right-color:#0000ff;
}

#div2{
  height:30px;
  border-style:solid;
  border-left-color:#ff0000;
  border-left-width:20px;
  border-color:#ff0000;
}

#div3{
  border-width:20px;
  border-left-style:dotted;
  border-right-style:double;
}

#div4{
  border:1px solid #ff0000;
}
</style>
</head>
<body>
  <div id='div1'></div>
  <div id='div2'></div>
  <div id='div3'></div>
  <div id='div4'></div>
  
</body>
</html>