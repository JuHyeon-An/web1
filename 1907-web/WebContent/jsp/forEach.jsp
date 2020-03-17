<%@page import="java.util.Date"%>
<%@page import="bean.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach</title>
<link rel='stylesheet' type='text/css'
      href='../css/bootstrap.css'/>
</head>
<body>
<h3>forEach</h3>
<h4>forEach를 사용한 구구단</h4>
<c:set var="dan" value="5"/>
<!-- dan = 5 -->
<c:forEach var="i" begin="1" end="9" step="1">
<!-- i는 1부터 9까지, 1씩 늘어남 -->
	${dan }*${i} = ${dan*i }<br/>
</c:forEach>

<h4>1~100까지 홀수만 출력</h4>

<c:forEach var="j" begin="1" end="100" step="2">
	${j }
</c:forEach>

<h4>1~100까지의 수 중 3또는 5의 배수를 출력</h4>
<c:forEach var="i" begin="1" end="100" step="1">
	<c:if test="${i%3==0 || i%5==0 }" var="r">
	${i }
	</c:if>
</c:forEach>

<h4>구구단</h4>
<c:forEach var="i" begin="2" end="9" step="1">
	<c:forEach var="j" begin="1" end="9" step="1">
		${i }*${j } = ${i*j } <br/>
	</c:forEach>
</c:forEach>

<h4>JAVA Collection을 사용한 ForEach</h4>

<%
	List<String> list = new ArrayList<String>();
	list.add("kim");
	list.add("lee");
	list.add("hong");
	list.add("park");
	list.add("choi");
	list.add("nam");
	
	request.setAttribute("list", list);
%>

<c:forEach var='item' items='${list }'>
	${item }
</c:forEach>

<h4>step과 혼합해서 쓸 때</h4>
<c:forEach var='item' items='${list }' begin='1' end='4' step='2'>
	${item }
</c:forEach>

<hr/>

<h4>forEach의 상태값</h4>
<c:forEach var='item' items='${list }' varStatus='st'>
  <li> current : ${st.current }</li>
  <li> index : ${st.index }</li>
  <li> count : ${st.count }</li>
<hr/>
</c:forEach>

<h4>MemberVo 타입의 데이터를 List에 저장한 후 출력</h4>
<%
	List<MemberVo> temp = new ArrayList<MemberVo>();
	temp.add(new MemberVo("id", "kim", new Date(), 1));
	temp.add(new MemberVo("id1", "park", new Date(), 2));
	temp.add(new MemberVo("id2", "lee", new Date(), 3));
	temp.add(new MemberVo("id3", "song", new Date(), 4));
	temp.add(new MemberVo("id4", "choi", new Date(), 5));
	
	request.setAttribute("templist", temp);
%>

<c:forEach var='item' items='${templist }'>

<fmt:formatDate var="temp" pattern="yyy-MM-dd" value="${item.rDate }"/>

<div class="row">
	<span class="col-sm-1">${item.mId }</span>
	<span class="col-sm-1">${item.mName }</span>
	<span class="col-sm-3">${temp }</span>
	<span class="col-sm-1">${item.grade }</span>
	</div>
</c:forEach>
</body>
</html>