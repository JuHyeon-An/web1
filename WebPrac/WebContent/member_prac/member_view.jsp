<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_view</title>
</head>
<body>
<div id='view'>
<h3>회원 정보 상세조회</h3>
<form name='frm' id='frm'>
<label>아이디</label>
<input type='text' name='mId' readonly/>
<br/>
<label>성명</label>
<input type='text' name='mName' readonly/>
<br/>
<label>등록일</label>
<input type='date' name='rDate' readonly/>
<br/>
<label>학년</label>
<input type='text' name='grade' readonly/>
<p/>
<label></label>
<input type='button' value='수정' id='btnModify'/>
<input type='button' value='삭제' id='btnDelete'/>
<input type='button' value='목록' id='btnList'/>
</form>
</div>
</body>
</html>