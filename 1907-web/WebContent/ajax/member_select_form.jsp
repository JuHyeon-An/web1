<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='member.css'/>
<script src='../lib/jquery-3.4.1.js'></script>
<script src='member.js'></script>

</head>
<body>
<input type="text" id="findStr" />
<input type="button" value="검색" id='search'/>
<div id="result2"></div>

<script>
$('#search').click(function(){
	search();
});
</script>
</body>
</html>