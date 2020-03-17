<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="./member/login_result.jsp">
				<!-- loginAction 이라는 페이지로 로그인 정보를 보내주겠다 -->
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="mId" maxlength="20"/>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="pwd" maxlength="20"/>
					</div>
					<div class='btn-group'>
					<input type="submit" class="btn btn-dark form-control" value="로그인"/>
					<input type="button" id="btnCancel" class="btn btn-dark form-control" value="취소"/>
					</div>
				</form>
				</div>
			</div>
		</div>
		
<script>
$('#btnCancel').click(function(){
	location.href='/index.jsp';
})
</script>
</body>
</html>