<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_modify</title>
<script src='../lib/jquery-3.4.1.js'></script>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'/>
<script src='../js/bootstrap.js'></script>
</head>
<body>
<div id='view' class='container' style="margin-top:20px;">
<h3>회원 정보 수정</h3>
<form name='frm' id='frm'>
<label>아이디</label>
<input type='text' name='mId'class='form-control' readonly />
<br/>
<label>성명</label>
<input type='text' class='form-control' name='mName' />
<br/>
<label>등록일</label>
<input type='date'class='form-control' name='rDate' />
<br/>
<label>학년</label>
<select name='grade' class='custom-select'>
<option value='1'>1 학년</option>
<option value='2'>2 학년</option>
<option value='3'>3 학년</option>
<option value='4'>4 학년</option>
<option value='5'>5 학년</option>
<option value='6'>6 학년</option>
<option value='7'>7 학년</option>
<option value='8'>8 학년</option>
<option value='9'>9 학년</option>
<option value='10'>10 학년</option>
</select>
<p/>
<label></label>
<p/>
<input type='button' value='정보수정' id='btnUpdate' class='btn btn-dark'/>
<input type='button' value='목록' id='btnList' class='btn btn-dark'/>
</form>
</div>
</body>
</html>