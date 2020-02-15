<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>abc</title>
</head>
<body>
	<span>폼 태그의 값들을 전달받음...</span>
	<br />

	<%
		// 스클립틀릿 (기호 안에서는 자바 코드로 작성)
		String info = request.getParameter("info");// 폼 태그의 name값
		out.print(info);
	%>

</body>
</html>>