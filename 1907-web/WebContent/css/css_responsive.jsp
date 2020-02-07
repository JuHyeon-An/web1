<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_responsive</title>
<style media='screen and (min-width:1000px)'>
body{
	background-color:black;
	color:white;}

#main {
	width: 1200px;
	margin: auto;
	overflow:hidden;}

#main div {
	float: left;
	height:300px;}

#left {
	width: 200px;
	background-color: #BBF2E2;}

#center {
	width: 800px;
	background-color: #F2F2F2;}

#right {
	width: 200px;
	background-color: #AEF2D9;}
	
</style>

<style media='screen and (min-width:800px) and (max-width:999px)'>
body{
	background-color:black;
	color:white;}

#main {
	width: 900px;
	overflow:hidden;
	margin: auto;}

#main div {
	float: left;
	height:300px;}

#left {
	width: 200px;
	background-color: #BBF2E2;}

#center {
	width: 700px;
	background-color: #F2F2F2;}

#right {
	clear:left;
	width: 100%;
	background-color: #AEF2D9;}
	
</style>

<style media='screen and (max-width:799px)'>
body{
	background-color:black;
	color:white;}

#main {
	width: 700px;
	overflow:hidden;
	margin: auto;}

#main div {
	height:300px;}

#left {
	width: 100%;
	background-color: #BBF2E2;}

#center {
	width: 100%;
	background-color: #F2F2F2;}

#right {
	width: 100%;
	background-color: #AEF2D9;}
</style>



</head>
<body>
<h3>responsive(반응형 웹)</h3>
<dl>
  <dt>link 태그를 사용한 반응형</dt>
  	<dd> media='screen and (최소크기) and (최대크기)' href='path'</dd>
  <dt>style 태그를 사용한 반응형</dt>
  	<dd> media='screen and (최소크기) and (최대크기)</dd>
  <dt> 가로 | 세로 모드 </dt>
  	<dd> media='screen and (orientation:portrait(세로) | landscape(가로))' </dd>
</dl>
<div id='main'>
  <div id='left'></div>
  <div id='center'></div>
  <div id='right'></div>
</div>

</body>
</html>