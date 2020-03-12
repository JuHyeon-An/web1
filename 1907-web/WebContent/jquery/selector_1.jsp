<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector_1</title>
<script src = '../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>selector (I)</h3>
<ul>
  <li> 전체 선택자 : * </li>
  <li> 태그 선택자 : 태그명 </li>
  <li id='id1'> 아이디 선택자 : #아이디명 </li>
  <li class='class1'> 클래스 선택자 : .클래스명 </li>
  <li modify='yes'> 속성 선택자 : 요소[속성] </li>
</ul>
<div>
	<span>자손1</span>
	<span>자손2</span>
	<span>자손3</span>
	<span>자손4</span>
  <p>
	<span>후손1</span>
	<span>후손2</span>
	<span>후손3</span>
	<span>후손4</span>
  </p>
</div>

<script>
$(document).ready(function(){ //$(function(){ ... });
	// 모든 선택자 : *
	$('*').css('border', '1px solid powderblue');
	
	// 태그 선택자
	$('h3').css('background-color', '#ffffaa');
	
	// 아이디 선택자
	$('#id1').css('color', '#ff0000');
	
	// 클래스 선택자
	$('.class1').css('color', '#0000ff');
	
	// 속성 선택자
	$('[modify=yes]').css('color', '#ffff00');
	
	// 자손태그
	$('div>span').css('font-size', '8px');
	
	// 후손태그
	$('div span').css('color', '#ff0000');
});
</script>
</body>
</html>