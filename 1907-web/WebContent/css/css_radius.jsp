<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_radius</title>
<style>
  div{
  width:100px; height:100px;
  border:2px solid #ff0000;
  margin:30px;
  float:left;
 }
 #div1{
   overflow: auto;
 }
 
 #div2{
   border-radius:20px;
   box-shadow:3px 3px 7px #444;
 }
 #div3{
   border-radius:50px;
 }
 #div4{
   border-radius:30px 30px 0 0;
 }
 #div5{
   border-radius:0 0 30px 30px;
   box-shadow:-5px -5px 7px #999;
 }
 #div6{
   border-radius:30px 0 30px 0;
   box-shadow:-3px 0 7px #555;
 }
</style>

</head>
<body>
<div id='div1'>
  123 abc 가나다 !@#$ ABC
  123 abc 가나다 !@#$ ABC
  123 abc 가나다 !@#$ ABC
  123 abc 가나다 !@#$ ABC
  123 abc 가나다 !@#$ ABC
  123 abc 가나다 !@#$ ABC
 </div>
<div id='div2'></div>
<div id='div3'></div>
<div id='div4'></div>
<div id='div5'></div>
<div id='div6'></div>
</body>
</html>