<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector_3</title>
<script src = '../lib/jquery-3.4.1.js'></script>
</head>
<body>
	<input type='text'/>
	<input type='password'/>
	<input type='radio'/>
	<input type='checkbox'/>
	<input type='file'/>
</body>

<script>
$(document).ready(function(){
	$('input[type="text"]').val('Hello jQuery');
});

$(function(){
	$('input[type="password"]').val('1234');
})

</script>
</html>