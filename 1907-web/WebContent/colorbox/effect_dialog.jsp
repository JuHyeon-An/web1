<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect_dialog</title>
<link rel='stylesheet' type='text/css' href='colorbox.css'/>
<script src='../lib/jquery-3.4.1.js'></script>
<script src='../lib/jquery.colorbox-min.js'></script>
</head>
<body>
	<h1>jQuery Colorbox</h1>
	<a id='colorbox'  href='#dialog'>Dialog with Colorbox</a>
	<div id='dialogs' style='display:none;'>
		<div id='dialog'>
			<h1>Auto OPEN Colorbox</h1>
			<p>내용내용내용내용내요내욘요내요여</p>
		</div>
	</div>
<script>
	$('a').colorbox({
		inline:true,
		width:550,
		opacity:0.5
	});
</script>
</body>
</html>