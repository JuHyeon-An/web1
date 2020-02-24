<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_select</title>
</head>
<body>
<div id='select'>
<h3>회원조회</h3>
<form name='frm' id='frm'>
<input type='button' value='회원추가' id='btnInsert'/>
<div>
<input type='text' name='findStr' id='findStr'/>
<input type='button' value='검색' id='btnFind'/>
</div>
</form>
<div id='title'>
<span class='mId'>학번</span>
<span class='mName'>성명</span>
<span class='rDate'>등록일</span>
<span class='grade'>학년</span>
</div>
<script>select();</script>
</div>
</body>
</html>