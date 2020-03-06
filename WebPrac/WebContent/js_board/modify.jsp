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

<title>게시글 수정</title>
</head>
<body>
<div class="jumbotron text-center">
<h2>게시글 수정</h2>
</div>
<div class="container">
	<form name='brd'>
	<table class="table table-striped">
			<thead>
			<tr>
				<th colspan="2" style="background-color: #eeeeee; text-align:center;">글쓰기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><span style="margin-right:15px; text-align:right;">글쓴이</span><input name="writer" class="form form-inline" type="text" style="max-width:250px;"/></td>
			</tr>
			<tr>
				<td><span style="margin-right:28px; text-align:right;">제목</span><input name="subject" class="form-inline" type="text" style="max-width:700px;"/></td>
			</tr>
			<tr>
				<td><textarea name="content" class="form-control" maxlength="2048" style="height:350px;"></textarea></td>
			</tr>
			</tbody>
	</table>
	<button type="button" name="btnSelect" class="btn btn-primary pull-right" style="margin-right:10px;">목록</button>
	<button type="button" name="btnSave" class="btn btn-primary pull-right" style="margin-right:10px;">수정</button>
	</form>
</div>
<script type="text/javascript" src="board.js"></script>
<script>
viewModify();
</script>
</body>
</html>