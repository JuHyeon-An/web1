<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='board.css'/>
<script src='board.js'></script>
</head>
<body>
<h3>게시판 수정</h3>
<form name='brd'>
	<label>순번</label>
	<input type='text' name='serial' readonly /><br/>
	<label>작성자</label>
	<input type='text' name='mName' readonly/><br/>
	<label>제목</label>
	<input type='text' name='subject' /><br/>
	<textarea rows="10" cols="70" name='content'></textarea><br/>
	<input type='button' value='수정' name='btnUpdate'/>
	<input type='button' value='목록' name='btnSelect'/>
</form>

<script>
let serial = localStorage.getItem('serial');
loadDB();
//loadDB는 항상 해줘야함

for(data of db){
	if(data.serial == serial){
		brd.serial.value = data.serial;
		brd.mName.value  = data.mName;
		brd.subject.value = data.subject;
		brd.content.value = data.content;
	}
}



</script>

</body>
</html>