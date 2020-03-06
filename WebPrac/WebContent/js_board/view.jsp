<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="../lib/jquery-3.4.1.js"></script>
<script src="../js/bootstrap.js"></script>

<title>게시글 상세보기</title>
</head>
<body>
<div class="jumbotron text-center">
<h2>게시글 상세보기</h2>
</div>
<div class="container" style="margin-bottom:30px;">
	<form name='brd'>
	<table class="table table-bordered" style="text-align:center;">
			<thead>
			<tr>
				<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시글 상세보기</th>
			</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
	</table>
	<button type="button" name="btnSelect" class="btn btn-primary pull-right" style="margin-right:10px;">목록</button>
	<button type="button" name="btnDelete" class="btn btn-primary pull-right" style="margin-right:10px;">삭제</button>
	<button type="button" name="btnModify" class="btn btn-primary pull-right" style="margin-right:10px;">수정</button>
	</form>
</div>
<script type="text/javascript" src="board.js"></script>
<script>view();</script>
</body>
</html>