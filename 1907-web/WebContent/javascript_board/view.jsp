<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
form label{
  width:20px;
  text-align:right;
  margin-right:10px;
}
</style>
</head>
<body>
<h3>게시판 상세보기</h3>
<form name='brd'>
  <label>순번</label>
  <input type='text' name='serial' readonly/><br/>
  <label>작성자</label>
  <input type='text' name='mName' readonly/><br/>
  <label>제목</label>
  <input type='text' name='subject' readonly/><br/>
  <div id='content'></div><br/>
  <input type='button' value='수정' name='btnModify' onclick="location.href='modify.jsp'"/>
  <input type='button' value='삭제' name='btnDelete'/>
  <input type='button' value='목록' name='btnSelect' onclick="location.href='select.jsp'"/>
</form>

<script>

	let r = document.getElementById('content');
	let selectedIndex = localStorage.getItem('selectedIndex');
	let obj = localStorage.getItem(selectedIndex);
	let d = JSON.parse(obj);
	
	brd.serial.value = d.serial;
	brd.mName.value = d.mName;
	brd.subject.value = d.title;
	
	r.innerHTML += "<div>"+d.contents+"</div>";

brd.btnDelete.onclick = function(){
	localStorage.removeItem(selectedIndex);
	let index = localStorage.getItem('index');
	localStorage.setItem('index', index);
}//삭제버튼 누르면

	
</script>

</body>
</html>