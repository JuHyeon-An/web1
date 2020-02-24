<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_modify</title>
</head>
<body>
<div id='view'>
<h3>회원 정보 수정</h3>
<form name='frm' id='frm'>
<label>아이디</label>
<input type='text' name='mId' readonly />
<br/>
<label>성명</label>
<input type='text' name='mName' />
<br/>
<label>등록일</label>
<input type='date' name='rDate' />
<br/>
<label>학년</label>
<select name='grade'>
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
<input type='button' value='정보수정' id='btnUpdate'/>
<input type='button' value='목록' id='btnList'/>
</form>
</div>
</body>
</html>