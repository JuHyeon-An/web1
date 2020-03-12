<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예제 15-19 css_2</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>예제 15-19 css_2</h3>
  <h1>Header-0</h1>
  <h1>Header-1</h1>
  <h1>Header-2</h1>

<script>
  let color = ['salmon', 'blue', 'orange'];

  $('h1').css({
	  color : function(index){
		  return color[index];
	  },
	  backgroundColor : 'black'
  });
  
</script>
</body>
</html>