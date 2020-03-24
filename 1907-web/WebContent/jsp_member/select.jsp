<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
</head>
<body>
<div id="member_main">

<div class="container text-right">
<form id="frm" name="frm" method="post">
<input type="text" name="findStr" id="findStr" value="${param.findStr }" placeholder="아이디 혹은 이름으로 검색" />
<input type="submit" name="btnFind" id="btnFind" value="검색" class="btn btn-dark"/>
<input type="button" id="btnGoInsert" value="추가" class="btn btn-dark"/>
<input type="text" name="nowPage" id="nowPage" value="${empty param.nowPage? 1 : param.nowPage }"/>
<input type="text" id = "mId" name="mId"/>
</form>
</div>
<hr/>
<div class="container" style="margin:30px;">

<div id="title" class="row container">
<span class="col-sm-3">아이디</span>
<span class="col-sm-3">이름</span>
<span class="col-sm-3">날짜</span>
<span class="col-sm-3">학년</span>
</div>

<c:forEach var='item' items='${list }'>
	<div id="result" class="row container" onclick='view("${item.mId}")'>
	<span class="col-sm-3">${item.mId }</span>
	<span class="col-sm-3">${item.mName }</span>
	<span class="col-sm-3">${item.rDate }</span>
	<span class="col-sm-3">${item.grade }</span>
</div>
</c:forEach>
</div>


<br/>
<ul class="pagination justify-content-center" id="paging">
	<c:if test="${p.nowPage > p.blockSize }">
	<!-- 현재 페이지가 전체 블럭사이즈보다 크다면 previous 없애고 -->
  <li class="page-item"><a class="page-link" href="#" onclick='goPage(1)'>Previous</a></li>
	 </c:if>
	 <c:forEach var='i' begin='${p.startPage }' end='${p.endPage }'>
  <li class="page-item ${(i==p.nowPage)? 'active' : ''}"><a class="page-link" href="#" 
  		onclick='goPage(${i})'>${i }</a></li>
	  </c:forEach>
	 <c:if test="${p.nowPage < p.totPage }"> 
  <li class="page-item"><a class="page-link" href="#" onclick='goPage(${p.nowPage+1})'>Next</a></li>
	  </c:if>
</ul>

</div>
<%
	if(request.getParameter("nowPage")==null){
		out.print("<script>goPage(1)</script>");
	}
%>
</body>
</html>