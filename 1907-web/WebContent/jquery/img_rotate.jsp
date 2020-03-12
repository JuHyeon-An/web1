<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예제 15-46 img_rotate</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<h1>setInterval로 특정간격마다 이미지 rotate 시키기</h1>
<body>
<div>
  <img src='../images/beach.jpg'/>
  <img src='../images/candy.png'/>
  <img src='../images/drink.png'/>
  <img src='../images/puppy.png'/>
  <img src='../images/sbux.jpg'/>
</div>
<script>
$('img').css('width', 250);
//이미지 크기 일관되도록

let myInterval = setInterval(function(){
	$('div').fadeIn(1000);
	//fadeIn 이펙트
	moveImg();
	$('div').fadeOut(1000);
},1000);

function moveImg(){
	$('img').first().appendTo('div');
	//img의 첫번째를 div뒤에 뒷부분에 붙여라
};

</script>
</body>
</html>