<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_color</title>
<script src="../lib/jquery-3.4.1.js"></script>
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<style>
.reverse{
  color:#fff;
  background-color:#000;
}
</style>
</head>
<body>
<h3>문단에 마우스를 올리면 바탕색 변경</h3>
<div>
	<h1>문단 1</h1>
	<p>내용1</p>
</div>

<div>
	<h1>문단 2</h1>
	<p>내용2</p>
</div>

<div>
	<h1>문단 3</h1>
	<p>내용3</p>
</div>

<script>
  $('div').hover(function(){
	  $(this).addClass('reverse', 1000);
  }, function(){
	  $(this).removeClass('reverse', 1000);
  });
</script>
</body>
</html>

