<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<div id="mybatis" class="container">
	<h2>상세보기</h2>
	<form name="frm" method="post" enctype="multipart/form-data">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">작성자</span>
			</div>
			<input class="input" type="text" name="id" value="안주현"/>
		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<input class="input"  type="text" name="subject" value="하이"/>
		</div>
		
		
		<label for="content">내용</label>
		<textarea class="textarea is-primary" rows="" cols="" name="content"></textarea>
		
		<label for="pwd">암호</label>
		<input class="form-control input" type="password" name="pwd" value="1"/>
		<br/>
		<label for="file">파일 첨부</label>
		<div id="attList">
			<ul>
				<ul><a href="abc.png" download="abc.png">abc.png</a></ul>
				<ul><a href="abc.png" download="abc.png">abc.png</a></ul>
				<ul><a href="abc.png" download="abc.png">abc.png</a></ul>
			</ul>
		</div>
		<input type="file" name="att" multiple/>
		<br/>
		<input class="button is-primary" type="button" value="수정" id="btnModify">
		<input class="button is-primary" type="button" value="삭제" id="btnDelete">
		<input class="button is-primary" type="button" value="댓글" id="btnRepl">
		<input class="button is-primary" type="button" value="취소" id="btnList">
		<br/>
		<input type="text" name="nowPage" value="${param.nowPage}">
		<input type="text" name="findStr" value="${param.findStr }">
		<input type="text" name="serial" value="1"/>
	</form>
</div>
</body>
</html>