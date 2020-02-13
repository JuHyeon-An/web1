<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='board.css'/>
</head>
<body>
<h3>게시판 입력</h3>
<form name='brd'>
	<label>작성자</label>
	<input type='text' name='mName' /><br/>
	<label>제목</label>
	<input type='text' name='subject' /><br/>
	<textarea rows="10" cols="70" name='content'></textarea><br/>
	<input type='button' value='DB 초기화' name='btnInit' />
	<input type='button' value='저장' name='btnSave'/>
	<input type='button' value='목록' name='btnSelect'/>
</form>

<script src='board.js'></script>
</body>
</html>






