<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector_filter</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>filter 사용</h3>
<p id='info'>
  filter는 '요소 : 필터명' 을 사용하여 선택함.
 </p>
  <form name='frm'>
  <input type='text' name ='mid' value='hong'/><br/>
  <input type='text' name ='mName' value='홍길동'/><br/>
  <input type='password' name='pwd'	value='1234'/><br/>
  <input type='button' value='체크'/><br/>
  </form>
 <script>
  $('input:text').css('color', '#0000ff');
   //input[type=text]
  $('input:password').css('color', '#ff0000');
  $('input:button').css({
	  'width' : '200px',
	  'height' : '90px'
  });
  
  
 </script>
</body>
</html>