<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_width</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
div{
  width:50px;
  height:50px;
  background-color:orange;
}
</style>
</head>
<body>
<h3>마우스를 클릭하면 넓이를 변경</h3>
<div></div>
<script>
$('div').click(function(){
	let w=$(this).css('width');
	let h=$(this).css('height');
	$(this).animate({
		width:parseInt(w)+100,
		height:parseInt(h)+100
	},'fast');
});


$('div').mouseout(function(){
	$(this).animate({
		width:50,
		height:50
	},'fast');
});

</script>
</body>
</html>