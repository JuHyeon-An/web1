<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mybatis" class="container">
	<h2>게시물 작성</h2>
	<form name="frmInsert" method="post" enctype="multipart/form-data">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">작성자</span>
			</div>
			<input type="text" name="id" value="안주현"/>
		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<input type="text" name="subject" value="하이"/>
		</div>
		
		
		<label for="content">내용</label>
		<textarea class="form-control" rows="" cols="" name="content"></textarea>
		
		<label for="pwd">암호</label>
		<input class="form-control" type="password" name="pwd" value="1"/>
		<br/>

			<div class="field">
				<div class="file is-primary has-name">
					<label class="file-label"> <input class="file-input"
						type="file" name="resume"> <span class="file-cta">
							<span class="file-icon"> <i class="fas fa-upload"></i>
						</span> <span class="file-label"> 파일첨부 </span>
					</span> <span class="file-name"> </span>
					</label>
				</div>
			</div>
			<label for="file">파일 첨부</label>
		<input type="file" name="att" multiple/>
		<br/>
		<input class="btn btn-success" type="button" value="저장" id="btnRegister">
		<input class="btn btn-success" type="button" value="취소" id="btnList">
		<input type="text" name="nowPage" value="${param.nowPage}">
		<input type="text" name="findStr" value="${param.findStr }">
	</form>
</div>
</body>
</html>