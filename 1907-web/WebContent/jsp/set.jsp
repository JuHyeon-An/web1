<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set</title>
</head>
<body>
<h3>set</h3>
<fieldset><legend>기본 set</legend>
<c:set var='kor' value='90'/>
<c:set var='eng'>88</c:set>
<c:set var='tot' value='${kor+eng }'/>
<c:set var='avg' value='${tot/2 }'/>

<ul>
	<li>kor : ${kor }</li>
	<li>eng : ${eng }</li>
	<li>tot : ${tot }</li>
	<li>avg : ${avg }</li>
</ul>
</fieldset>

<fieldset><legend>[ html ]</legend>
<%
  String html = "<font color='red' size='6'>홍길동</font>";
  pageContext.setAttribute("abc", html);
%>
${abc}
<br/>
<c:remove var='abc'/>
remove한 이후 : ${abc }
<!-- page>request>session>application -->

</fieldset>
<fieldset><legend>[ java bean ]</legend>
<jsp:useBean id="vo" class="bean.MemberVo3" scope="page"/>
<c:set target="${vo }" property="mId" value="hong gil dong"/>
<c:set target="${vo }" property="pwd" value="1234"/>
<ul>
<li>mId = ${vo.mId }</li>
<li>pwd = ${vo.pwd }</li>
</ul>
</fieldset>
</body>
</html>