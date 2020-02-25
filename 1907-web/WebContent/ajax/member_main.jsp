<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='member.css'/>
<script src='../lib/jquery-3.4.1.js'></script>
<script src='member.js'></script>

<<<<<<< HEAD
<link rel="stylesheet" type="text/css" href="jquery.toast.css" />
<script type="text/javascript" src="../toast/jquery.toast.js"></script> 


</head>
<body>
<h2>회원관리</h2>

<div id='menu'>
<span class='sub' id='main'>메인</span>
<span class='sub' id='insert'>회원등록</span>
<span class='sub' id='modify'>회원수정 | 삭제</span>
<span class='sub' id='select'>회원조회 |  검색</span>

</div>

<div id='result'><div id='form'></div></div>


<script>
$('#main').click(function(){
	$('#result').html("<h1>메인화면입니다~~~</h1>");
});

$('#select').click(function(){
	init('member_select_form.jsp'); // 메인화면
});


//회원등록
$('#insert').on('click', function() {
	init('member_insert_form.jsp');
});


</script>
</body>
</html>