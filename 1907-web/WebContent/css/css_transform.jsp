<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_transform</title>
<style>
div{
  border:2px solid #aaaaff;
  width:400px; height:150px;
  margin-bottom:20px;
}

#rotate>span{
  position:absolute;
  margin:30px;
  font-size:30px;
  -webkit-transform-origin:0% 0%;
  -webkit-transform:rotate(15deg);
  border:1px solid black;
}

#scale{
  height:400px;
}
#scale>.a{transform:scale(0.5);}
#scale>.b{
  transform:scale(2);
  position:relative;
  top:50px;
  left:50px;
}

#skew>span{
  position:absolute;
  font-size:50px;
  transform:skew(40deg, 10deg);
  border:1px solid black;
}

#translate>span{
  font-size:50px;
  position:absolute;
  transform:translate(1em, 30px);
}
</style>
</head>
<body>
<h3>transform</h3>
<ul>
  <li>rotate</li>
  <li>scale</li>
  <li>skew</li>
  <li>translate</li>
</ul>
<hr/>
<div id='rotate'>
  <span> 화이팅 1907 </span>
</div>
<div id='scale'>
  <img src='../images/candy.png'/>
  <img src='../images/candy.png' class='a'/>
  <img src='../images/candy.png' class='b'/>
</div>
<div id='skew'>
  <span> 화이팅 1907 </span>
</div>
<div id='translate'>
  <span> 화이팅 1907 </span>
</div>
</body>
</html>