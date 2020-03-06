<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="../lib/jquery-3.4.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>게시글 조회</title>
</head>
<body>
<div class="jumbotron text-center">
<h2>게시글 조회</h2>
</div>
<div class="container">
	<form name='brd'>
	<button type="button" class="btn btn-primary pull-right" style="margin-bottom:15px; margin-left:10px;">검색</button>
	<input type="text" placeholder="검색어를 입력하세요" class="form-inline pull-right" style="margin-bottom:15px;"/>
	<table class="table table-dark table-hover">
			<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
	</table>
	<button type="button" name="btnInsert" class="btn btn-dark pull-right" style="margin-right:10px;">글쓰기</button>
	</form>
</div>
<script type="text/javascript" src="board.js"></script>
<script>
showList();
</script>
</body>
</html>