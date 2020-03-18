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

<div class="container">
<form id="frm" name="frm" method="post">
<input type="text" name="findStr" placeholder="검색어를 입력하세요." value="${param.findStr }"/>
<input type="button" name="btnFind" id="btnList" value="검색" class="btn btn-dark"/>
<input type="button" id="btnGoInsert" value="추가" class="btn btn-dark"/>
<input type="text" name="nowPage" value="${param.nowPage }"/>
</form>
</div>
<hr/>
<div id="title" class="row container">
<span class="col-sm-1">번호</span>
<span class="col-sm-2">아이디</span>
<span class="col-sm-2">이름</span>
<span class="col-sm-2">날짜</span>
<span class="col-sm-2">학년</span>
</div>
<div id="result" class="row container" onclick="">
<span class="col-sm-1">1</span>
<span class="col-sm-2">id1</span>
<span class="col-sm-2">name</span>
<span class="col-sm-2">2019-1-1</span>
<span class="col-sm-2">3학년</span>
</div>

<ul class="pagination justify-content-center" id="paging">
  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">Next</a></li>
</ul>

</div>
<script>

</script>
</body>
</html>