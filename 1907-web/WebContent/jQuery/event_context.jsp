<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>16-11 event_context</title>
<style>
*{margin : 0px; padding:0px;}
div{
  margin:5px;
  padding:3px;
  border:3px solid black;
  border-radius:10px;
}
</style>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<div>
	<h1>header 1</h1>
	<p>Paragraph</p>
</div>

<div>
	<h1>header 2</h1>
	<p>Paragraph</p>
</div>

<div>
	<h1>header 3</h1>
	<p>Paragraph</p>
</div>

<script>

$('div').click(function(){
	let header=$('h1', this).text();
	// 자신이 선택한 div의 h1의 값(text)를 담음
	let paragraph = $('p', this).text();
	// 자신이 선택한 div의 p의 값(text)를 담음
	
	alert(header+'\n'+paragraph);
	// 출력
});

// find 메소드 이용
$('div').click(function(){
	let header = $(this).find('h1').text();
	// 이벤트가 발생한 div에서 h1을 찾아라
	let paragraph = $(this).find('p').text();
	
	alert(header+'\n'+paragraph);
});

</script>
</body>
</html>