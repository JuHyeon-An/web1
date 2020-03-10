<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_insert</title>
<script src='../lib/jquery-3.4.1.js'></script>
<link rel='stylesheet' type='text/css' href='../css/bootstrap.css'/>
<script src='../js/bootstrap.js'></script>

</head>
<body>
<div class='container'>
	<form name='frm' method='post' action='member_insert_result.jsp'>
	<label>아이디</label>
	<input name='userId' type='text' class='form-control' placeholder='아이디를 입력하세요'/>
	<label>패스워드</label>
	<input name='userPwd' type='password' class='form-control'/>
	<label>패스워드확인</label>
	<input name='pwdCheck' type='password' class='form-control'/>
	<label>이름</label>
	<input name='userName' type='text' class='form-control'/>
	<div class="form-group" id="divGender">
                 	<label for ="radioGender" class="col-lg-2 control-label">성별</label>
                 <div class="col-lg-10">
                        <label class="radio-inline">
                            <input type="radio" name="userGender" value="여자" checked> 여자
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="userGender" value="남자"> 남자
                        </label>
                    </div>
                </div>
	<label>이메일</label>
	<p/>
	<input name='userEmail' type='email' class='form-control' placeholder='exam@naver.com'/>
	<p/>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-dark">Sign in</button>
                    </div>
                </div>
	</form>
</div>
</body>
</html>