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
<h3>게시판 상세보기</h3>
<form name='brd'>
	<label>순번</label>
	<input type='text' name='serial' readonly />
	조회수 : <input type='text' name='hit' readonly id='hit'/>
	<br/>
	<label>작성자</label>
	<input type='text' name='mName' readonly/><br/>
	<label>제목</label>
	<input type='text' name='subject' readonly/><br/>
	<div id='content'></div><br/>
	<input type='button' value='수정' name='btnModify'/>
	<input type='button' value='삭제' name='btnDelete'/>
	<input type='button' value='목록' name='btnSelect'/>

</form>
<script src='board.js'></script>
<script>
let serial = localStorage.getItem('serial');
let content = document.getElementById('content');
loadDB();

for(data of db){
	if(data.serial == serial){
		/* 
		시리얼번호가 같으면 내가 상세보기 하려고 눌렀던
		바로 그 게시물!
		*/
		brd.serial.value = data.serial;
		brd.mName.value  = data.mName;
		brd.subject.value = data.subject;
		brd.hit.value = data.hit;
		let temp = data.content.replace(/\n/gi, '<br/>')
		/* 
		정규식 (g : 전체, i: 대소문자 상관없이)
		 \n을 모두 찾아서 br태그로 바꿔라 
		 => 엔터태그를 인식하지 못 하므로 br태그로 대체
		 */
		content.innerHTML = temp;
	}
	
}



</script>



</body>
</html>


