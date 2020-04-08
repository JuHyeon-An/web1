<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<input type="button" class="button is-primary" value="입력" id="btnInsert"/>
			<div>
				<div class="field has-addons">
					<div class="control">
						<input class="input" type="text" placeholder="검색하세요">
					</div>
					<div class="control">
						<a class="button is-primary"> 검색 </a>
					</div>
				</div>
				<input type="text" name="nowPage"
					class="input is-primary is-rounded" value="${param.nowPage }" /> <input
					type="text" name="serial" class="input is-primary is-rounded"
					value="100" />

			</div>
		</form>
	<div id = "mainTable" class="container">
	<div id="title" class="columns mt-3">
		<span class="no column">순번</span>
		<span class="subject column">제목</span>
		<span class="id column">작성자</span>
		<span class="mDate column">작성일</span>
		<span class="hit column">조회수</span>
		
	</div>
	
	<div id="table">
	<c:forEach var="i" begin="1" end="20">
		<div class="columns" onclick="view(${i});">
			<div class="no column">순번${i }</div>
			<div class="subject column">제목${i }</div>
			<div class="id column">작성자${i }</div>
			<div class="mDate column">작성일${i }</div>
			<div class="hit column">조회수${i }</div>
		</div>
	</c:forEach>
	</div>
	</div>
	
	<div id="page" class="container mt-3">
	  <ul class="pagination justify-content-center">
    	<li class="page-item"><a class="page-link" onclick="go(1);">Previous</a></li>
		<c:forEach var="i" begin="1" end="10">
    		<li class="page-item"><a class="page-link" onclick="go(${i});">${i }</a></li>
    	</c:forEach>
    	<li class="page-item"><a class="page-link" onclick="go(6);">Next</a></li>
  </ul>
	</div>
	
	
</div>
</body>
</html>