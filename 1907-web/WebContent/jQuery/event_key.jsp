<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_key</title>
<style>
.outer{
  width:200px;
  height:200px;
  background: orange;
  padding : 50px;
  margin : 10px;
}

.inner{
  width:100%;
  height:100%;
  background:red;
}
</style>
<script src="../lib/jquery-3.4.1.js"></script>
</head>
<body>
<div>
	<p>지금 내 생각을</p>
	<h1>150</h1>
	<textarea cols="70" rows="5"></textarea>
</div>
<script>
$('textarea').keyup(function(){
	let inputlen = $(this).val().length;
	let remain = 150-inputlen;
	// 입력할 수 있는 글자수를 반환함
	
	$('h1').html(remain);
if(remain<0){
	// 남아있는 글자수가 0보다 작으면 글자를 빨갛게
	$('h1').css('color', 'red');
}else{
	$('h1').css('color', 'black');
}
});

</script>
</body>
</html>