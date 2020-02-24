<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>16_8 event_one</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
.reverse{
  background : black;
  color : white;
}
</style>
</head>
<body>
<h3>예제 16_8 event one()</h3>
<h1>Header-0</h1>
<h1>Header-1</h1>
<h1>Header-2</h1>

<script>

// 1번방법
$('h1').one({
	click : function(){
		$(this).html('click');
		alert('클릭됨');
		}
});

// 2번방법
$('h1').one('click', function(){
	$(this).html('클릭!!');
	alert('클릭됨');
});

</script>
</body>
</html>