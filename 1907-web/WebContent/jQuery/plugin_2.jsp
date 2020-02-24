<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>plugin_1</title>
<script src="../lib/jquery-3.4.1.js"></script>
</head>
<body>
<h3>선택자를 사용하는 플러그인</h3>
<h1>Header 1</h1>
<h1>Header 2</h1>
<h1>Header 3</h1>
<h1>Header 4</h1>
<h2>Header 5</h2>

<script>
// plugin 정의
jQuery.fn.myMethod = function(color1, color2){
	$(this).css({
		'color' : color1,
		'backgroundColor' : color2
	});
};

// plugin 호출 (실행)
$('h1').click(function(){
	$(this).myMethod('white', 'salmon');
});

</script>
</body>
</html>