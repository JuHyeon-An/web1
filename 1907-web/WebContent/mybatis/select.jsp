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
		<h2 class="title">자유 게시판</h2>
			<form name="frm" class="level" method="post">
				
				<div class="has-addons level-right">
				<div class="level-item">
				<div class="control">
					<div class="select">
					<select name="search">
						<option value=0 <c:if test="${param.search == 0}">selected</c:if>>검색범위 설정</option>
						<option value=1 <c:if test="${param.search == 1}">selected</c:if>>제목</option>
						<option value=2 <c:if test="${param.search == 2}">selected</c:if>>내용</option>
						<option value=3 <c:if test="${param.search == 3}">selected</c:if>>제목+내용</option>
						<option value=4 <c:if test="${param.search == 4}">selected</c:if>>작성자</option>
						</select>
					</div>
				</div>
					<div class="control">
						<input class="input" type="text" name="findStr"
							placeholder="검색어를 입력하세요" value=${param.findStr }>
					</div>
					<div class="control">
						<a class="button is-primary" id="btnFind"> 검색 </a>
					</div>
				</div>
				</div>

		<input type="text" name="nowPage" value="${param.nowPage }" />
		<input type="text" name="serial" />
			</form>
		<br/>
		<div id = "mainTable" class="container">
	<div id="title" class="columns mt-3">
		<span class="no column">순번</span>
		<span class="subject column">제목</span>
		<span class="id column">작성자</span>
		<span class="mDate column">작성일</span>
		<span class="hit column">조회수</span>
		
	</div>
	
	<div id="table">
	<c:forEach var="i" items="${list }">
		<div class="columns" onclick="view(${i.serial});">
			<div class="no column">${i.serial }</div>
			<div class="subject column">${i.subject } ${(i.attCnt>0) ? [i.attCnt] : '' }</div>
			<div class="id column">${i.id }</div>
			<div class="mDate column">${i.mDate }</div>
			<div class="hit column">${i.hit }</div>
		</div>
	</c:forEach>
	</div>
	</div>
	
	<br/>
	<nav id="page" class="pagination is-centered" role="navigation" aria-label="pagination">
  <c:if test="${p.startPage>p.blockSize }">
  	<a class="pagination-previous" onclick="go(${p.startPage-1});">Previous</a>
  </c:if>

  <ul class="pagination-list">
  <c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
    <li><a onclick="go(${i});" 
    		class="pagination-link ${(param.nowPage==i)? 'page-button' : '' }">${i }</a></li>
    </c:forEach>
  </ul>

  <c:if test="${p.totPage>p.endPage }">
	  <a class="pagination-next" onclick="go(${p.endPage+1});">Next page</a>
  </c:if>
</nav>
	<br/>
	
</div>

</body>
</html>