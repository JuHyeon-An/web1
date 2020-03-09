<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_select</title>
<script src='../lib/jquery-3.4.1.js'></script>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'/>
<script src='../js/bootstrap.js'></script>
</head>
<body>
<div id='selectForm' class='container'>
<h3>회원조회</h3>
<form name='frm' id='frm'>
<div class='form-inline'>
<input type='text' name='findStr' id='findStr' class='form-control'/>
<input type='button' value='검색' id='btnFind' class='btn btn-dark'/>
</div>
</form>
<p/>
<div id='title' class='row'>
<div class='col-sm-2 text-center'>아이디</div>
<div class='col-sm-2 text-center'>패스워드</div>
<div class='col-sm-2 text-center'>이름</div>
<div class='col-xs-3 text-center'>성별</div>
<div class='col-sm-3 text-center'>이메일</div>
<div class='col-sm-2 text-center'>등록일자</div>
</div>
<div id='body' class='row'>
</div>
</div>
<script src='member.js'></script>
</body>
</html>