<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_position</title>
<style>
body{
background-color:#302d2d;
color:white;
}

div[id]{
  border:2px solid #ffffff;
  height:50px;
}

#absolute>div{
  position:absolute;
}

#absolute>div:hover{
  background-color:#827676;
  cursor : pointer;
}
#absolute>.c2{left:100px; top:10px;}
#absolute>.c3{left:200px; top:20px;}
#absolute>.c4{left:300px; top:30px;}
#absolute>.c5{left:400px; top:40px;}

#relative>div{
  position:relative;
}
#relative>.c2{left:100px; top:-20px;}
#relative>.c3{left:200px; top:-40px;}
#relative>.c4{left:300px; top:-60px;}
#relative>.c5{left:400px; top:-80px;}

#fixed{
  position:fixed;
  width:100px;
  height:120px;
  background-color:#ddd;
  opacity:0.8;
  color:black;
}

#fixed:hover{
  opacity:0.9;
}

</style>
</head>
<body>

<div id = 'absolute'>
  <div class='c1'>HTML</div>
  <div class='c2'>CSS</div>
  <div class='c3'>Javascript</div>
  <div class='c4'>JSP</div>
  <div class='c5'>Java</div>
</div>

<div id='relative'>
  <div class='c1'>HTML</div>
  <div class='c2'>CSS</div>
  <div class='c3'>Javascript</div>
  <div class='c4'>JSP</div>
  <div class='c5'>Java</div>
</div>


<div id='fixed'>
  <div class='c1'>HTML</div>
  <div class='c2'>CSS</div>
  <div class='c3'>Javascript</div>
  <div class='c4'>JSP</div>
  <div class='c5'>Java</div>
</div>
매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 
매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 
매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 
매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 
매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 
매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 
매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 매우 매우 긴 문장 

</body>
</html>