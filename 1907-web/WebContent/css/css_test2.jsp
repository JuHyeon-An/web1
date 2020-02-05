<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_test2</title>
<style>

p{
  font-family: 궁서체;
}

li{
  color:#0000ff;
}

#p1{
  border:2px solid #0000ff;
  height:60px;
}

.c1{
  background-color:#ccccff;
  height:60px;
}

.c2{
  color:#ff0000;
  font-size:30px;
}

</style>
</head>
<body>
<h3>css 적용하기(id, class)</h3>
<p>
  <ul>
  	<li>id : #id명으로 적용</li>
  	<li>class : .class명으로 적용</li>
  </ul>
  <hr/>
</p>

<p id='p1'>p1</p>
<p class='c1'>c1</p>
<p class='c1 c2'>c1, c2</p>

</body>
</html>