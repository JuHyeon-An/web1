<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>if_form_result</h3>
	<ul>
	<% request.setCharacterEncoding("utf-8"); %>
		<li>mName : ${param.mName }</li>
		<li>score : ${param.score }</li>
		<c:set var="result" value="합격을 축하드려요" />
		<c:if test="${param.score<60 }">
			<c:set var="result" value="다음 기회에~~~" />
		</c:if>
		<li>result : ${result }</li>
		<li>결과 : <c:choose>
				<c:when test="${param.score>=90 }">
		  	전액 장학생입니다.
		  </c:when>
				<c:when test="${param.score>=80 }">
		    반액 장학생입니다.
		    </c:when>
				<c:when test="${param.score>=70 }">
		    70점 이상입니다~~
		    </c:when>
		    <c:otherwise>
		    한 학기 더 수강 기회를 드립니다
		    </c:otherwise>
			</c:choose>
	</ul>
</body>
</html>