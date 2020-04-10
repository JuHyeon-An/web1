<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<input class="input" type="text" name="id" value="${vo.id }"/>
		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<input class="input"  type="text" name="subject" value="${vo.subject }"/>
		</div>
		
		
		<label for="content">내용</label>
		<textarea class="textarea is-primary" rows="" cols="" name="content">${vo.content }</textarea>
		
		<label for="pwd">암호</label>
		<input class="form-control input" type="password" name="pwd" value="${vo.pwd }"/>
		<br/>
		<label for="file">파일 첨부</label>
		<div id="attList">
			<ul>
				<c:forEach var="att" items="${attList }">
				<li><a href="./upload/${att.sysFile }" download="${att.oriFile }">${att.oriFile }</a></li>
				</c:forEach>
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
		<input type="text" name="serial" value="${vo.serial }"/>
	</form>
</div>
</body>
</html>