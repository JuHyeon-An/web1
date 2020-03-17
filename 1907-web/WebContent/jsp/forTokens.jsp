<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForToken</title>
</head>
<body>
<!-- StringTokenizer의 기능 -->
<div class="container">
<h3>forTokens</h3>
<%
String str = "ads,fg,sdf,fgh,sdf,dfdf,f,dfhd,gsdf,sdfgdghd,fa";
pageContext.setAttribute("str", str);
%>
<c:forTokens items="${str }" delims="," var="v">
<li>${v }</li>
</c:forTokens>

<hr/>
<h3>forTokens2</h3>
<c:forTokens items="${str }" delims="," var="v" begin="2" end="10" step="2">
<li>${v }</li>
</c:forTokens>

<hr/>
<h3>forTokens3</h3>
<c:forTokens items="${str }" delims="," var="v" varStatus="st">
<li>${v } | ${st.current }| ${st.index }| ${st.count}</li>
</c:forTokens>
</div>
</body>
</html>

