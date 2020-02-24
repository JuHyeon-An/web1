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
<h3>선택자를 사용하지 않는 플러그인</h3>
<h1>Header 1</h1>
<h2>header 2</h2>

<script>
// plugin 정의
$.reload = function(){
	location = location;
};
// 페이지가 새로 로딩되면서 또 reload 메소드를 실행하므로 무한반복!

// plugin 호출 (실행)
$('h1').first().click(function(){
	$.reload();
});
</script>
</body>
</html>