<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
  background-color : black;
  color : white;
}

a{
  text-decoration:none;
}

a:hover{
  text-decoration: underline;
  font-weight: bold;
}

a:link{
  color : powderblue;
}

a:visited{
  color : #aaa;
}

a:active{
  color : #fff;
}

input[type='text']:focus{
  color:#ff0000;
  background-color:#aaa;
}

input[type]:blur{
  color:#000;
  background-color:#fff;
}

</style>
</head>
<body>
<h3>가상 클래스</h3>
<p>
  <ul>
    <li> :link => 링크의 초기상태 </li>
    <li> :visited => 방문한적이 있는 링크 </li>
    <li> :active => 링크를 클릭하고 있는 상태 </li>
    <li> :hover => 마우스를 올려놓은 상태 </li>
    <li> :focus => 커서가 위치하고 있는 상태 </li>
    <li> :blur => 커서를 잃어버린 상태</li>
  </ul>
</p>
<h3>:link | :visited | :active | :hover</h3>
<a href='http://www.jobtc.kr'>우리카페</a>
<a href='http://www.abc.com'>방문하기 전</a>

<h3>:focus | :blur </h3>
<input type='text' value='hong'/>
<input type='search' value='kim'/>
</body>
</html>