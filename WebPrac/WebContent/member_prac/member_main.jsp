<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script src='../lib/jquery-3.4.1.js'></script>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'/>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css.map'/>
<script src='../js/bootstrap.js'></script>

</head>
<body>
	<div class="container">
		<div class="jumbotron text-center" style="margin-bottom: 10px;">
			<h2>회원관리</h2>
		</div>
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" id="main">메인화면</a></li>
			<li class="nav-item" id="menu1"><a class="nav-link" data-toggle="tab">회원등록</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				id="menu2">회원수정 및 삭제</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				id="menu3">회원 조회</a></li>
		</ul>
			<div class="container" id="result" style="margin-top:30px; margin-bottom:30px;">
			여기다 결과를 뿌려줄 것.
			</div>
	</div>
<script src='member.js'></script>
</body>
</html>


