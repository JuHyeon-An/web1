<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector_parent</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>selector parent</h3>
<div>
  <span>비활성화</span>
  <button>활성화하기</button>

</div>
<script>
$('button').on('click',function(){
	$(this).text('비활성화하기');
	$(this).parent().css('background-color', '#ff0000');
	$(this).parent().find('span').text('활성화');
});


/*
$('button').click(function(){
	
});
*/
</script>
</body>
</html>