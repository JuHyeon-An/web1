<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>16_8 event_off</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
.reverse{
  background : black;
  color : white;
}
</style>
</head>
<body>
<h3>예제 16_8 event off</h3>
<h1>Header-0</h1>
<h1>Header-1</h1>
<h1>Header-2</h1>

<script>
//이벤트 연결
$('h1').click(function(){
	//출력
	$(this).html('CLICK');
	//클릭한 해당 h1에 'click'이라고 써주고
	alert('이벤트가 발생했습니다');
	
	//이벤트를 제거
	$(this).off();
});
</script>
</body>
</html>