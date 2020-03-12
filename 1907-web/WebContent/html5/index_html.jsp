<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>html</title>

<style>
head, body{
  font-family:'나눔바른고딕';
}
li{
font-size:18px;
list-style-image:url('../images/correct (1).png');
}
#title{
background-color:#F2E6A7;
text-shadow:2px 2px 2px #999;
color:#F29F05;
}
#list{
background-color:#F2ECCE;
}
a{
  color:black;
  text-decoration:none;
}
</style>

</head>
<body>
<div id='title'>
<h1 align='center'>HTML</h1>
</div>
<div id='list'>
<ol>
  <li><a href='index.jsp?cont=./html5/anchor.jsp'>anchor</a></li>
  <li><a href='index.jsp?cont=./html5/canvas.jsp'>캔버스</a></li>
  <li><a href='index.jsp?cont=./html5/canvas_shadow.jsp'>캔버스-그림자</a></li>
  <li><a href='index.jsp?cont=./html5/drawImage.jsp'>이미지그리기</a></li>
  <li><a href='index.jsp?cont=./html5/font.jsp'>폰트</a></li>
  <li><a href='index.jsp?cont=./html5/gradient.jsp'>그래디언트</a></li>
  <li><a href='index.jsp?cont=./html5/gugudan.jsp'>구구단</a></li>
  <li><a href='index.jsp?cont=./html5/img.jsp'>이미지</a></li>
  <li><a href='index.jsp?cont=./html5/list.jsp'>리스트</a></li>
  <li><a href='index.jsp?cont=./html5/media.jsp'>미디어</a></li>
  <li><a href='index.jsp?cont=./html5/paragraph.jsp'>문단</a></li>
  <li><a href='index.jsp?cont=./html5/rotate.jsp'>도형회전</a></li>
  <li><a href='index.jsp?cont=./html5/storage.jsp'>스토리지</a></li>
  <li><a href='index.jsp?cont=./html5/storage_form.jsp'>폼 내용 저장</a></li>
  <li><a href='index.jsp?cont=./html5/table.jsp'>테이블</a></li>
  <li><a href='index.jsp?cont=./html5/worker.jsp'>워커</a></li>
</ol>
</div>
</body>
</html>