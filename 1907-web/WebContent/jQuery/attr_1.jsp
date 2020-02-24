<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>15-10 attr_1 예제</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>15-10 attr_1 예제</h3>
  <img src='../images/drink.png'>
  <img src='../images/candy.png'>
  <img src='../images/puppy.png'>
  
<script>
$(document).ready(function(){
	$('img').attr('width', function(index){
		return (index+1)*100;
	});
});

</script>
</body>
</html>