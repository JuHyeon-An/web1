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
	<h2>자유 게시판</h2>
	<form name="frmSelect" method="post">
		<input type="button" class="btn btn-light-blue" value="입력" id="btnInsert"/>
		<div>
			<div class="input-group m-3">
			<input type="text" name="findStr" class="form-control" value="${param.findStr }">
			<input type="button" class="btn btn-light-blue" value="검색" id="btnFind"/>
			</div>
			<input type="text" name="nowPage" value="${param.nowPage }"/>
			<input type="text" name="serial" value="100"/>
			
		</div>
	</form>
	<div id = "mainTable" class="container">
	<div id="title" class="row mt-3">
		<span class="no col-lg-1">순번</span>
		<span class="subject col-lg-3">제목</span>
		<span class="id col-lg-3">작성자</span>
		<span class="mDate col-lg-3">작성일</span>
		<span class="hit col-lg-2">조회수</span>
		
	</div>
	
	<div id="table">
		<div class="row" onclick="view(100);">
			<div class="no col-lg-1">순번1</div>
			<div class="subject col-lg-3">제목1</div>
			<div class="id col-lg-3">작성자1</div>
			<div class="mDate col-lg-3">작성일1</div>
			<div class="hit col-lg-2">조회수1</div>
		</div>
		<div class="row" onclick="view(200);">
			<div class="no col-lg-1">순번2</div>
			<div class="subject col-lg-3">제목2</div>
			<div class="id col-lg-3">작성자2</div>
			<div class="mDate col-lg-3">작성일2</div>
			<div class="hit col-lg-2">조회수2</div>
		</div>
		<div class="row" onclick="view(300);">
			<div class="no col-lg-1">순번3</div>
			<div class="subject col-lg-3">제목3</div>
			<div class="id col-lg-3">작성자3</div>
			<div class="mDate col-lg-3">작성일3</div>
			<div class="hit col-lg-2">조회수3</div>
		</div>
	</div>
	</div>
	
	<div id="page" class="container mt-3">
	  <ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" onclick="go(1);">Previous</a></li>
    <li class="page-item"><a class="page-link" onclick="go(1);">1</a></li>
    <li class="page-item"><a class="page-link" onclick="go(2);">2</a></li>
    <li class="page-item"><a class="page-link" onclick="go(3);">3</a></li>
    <li class="page-item"><a class="page-link" onclick="go(4);">4</a></li>
    <li class="page-item"><a class="page-link" onclick="go(5);">5</a></li>
    <li class="page-item"><a class="page-link" onclick="go(6);">Next</a></li>
  </ul>
	</div>
	
	
</div>
</body>
</html>