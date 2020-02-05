<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 모든 div의 넓이와 높이를 설정(250x150)
   적당한 여백
   display 속성 : inline-block 타입으로 수정
   */

div{
  width:250px; height:150px;
  margin:20px;
  display:inline-block;
  border:2px solid;
}

#div1{
  overflow:auto;
  background-image: url(../images/beach.jpg);
  background-attachment:fixed;
}

#div2{
  background-image:url(../images/beach.jpg);
  background-repeat:no-repeat;
  background-position:20px 20px;
}

#div3{
  background-image:url(../images/drink.png);
  background-repeat:repeat-x;
}

#div4{
  background-image:url(../images/drink.png);
  background-repeat:repeat-y;
}

#div5{
  height:300px;
  background-image:url(../images/drink.png);
  background-size:50% 50%;
}

</style>

</head>
<body>
<h3>바탕 이미지</h3>
  <ul>
    <li>background-image:url(path)</li>
    <li>background-attachement : fixed | scroll </li>
    <li>background-position : x y | left | right | bottom | top | center </li>
    <li>background-repeat : repeat-x | repeat-y | no-repeat </li>
    <li>background-size : sizeX sizeY </li>
  </ul>
 
 <hr/>
 <div id='div1'>
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
  엄청 많은 내용이 있는 영역,
 
 </div>
 <div id='div2'></div>
 <div id='div3'></div>
 <div id='div4'></div>
 <div id='div5'></div>
  
 
</body>
</html>