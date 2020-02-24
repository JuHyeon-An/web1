<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>18-1 ani_slide</title>
<script src="../lib/jquery-3.4.1.js"></script>
<style>
* { margin:0px; padding:0px; }
.animation_canvas{
  background-color:gray;
  width:600px;
  height:400px;
  position:relative;
  overflow:hidden;
}
.slider_panel{
  width:3000px;
  position:relative;
}
.slider_image{
  float:left;
  width:600px;
  height:400px;
}
.slider_text_panel{
  position:absolute;
  top:200px;
  left:50px;  
}
.slider_text{
  position:absolute;
  width:250px;
  height:150px;
}

#control_panel{
  position:absolute;
  top:380px;
  left:270px;
  height:13px;
  overflow:hidden;
}
.control_button{
  width:12px;
  height:46px;
  position:relative;
  float:left;
  cursor:pointer;
  /*background-image:url('../images/mountain.png');*/
  background-color:red;
  border:3px solid black;
}

.control_button:hover{ top:-16px; }
.control_button:active{ top:-31px; }
</style>
</head>
<body>
<h1>test header</h1>
<div class="animation_canvas">
	<div class="slider_panel">
	  <img class="slider_image" />
	  <img class="slider_image" />
	  <img class="slider_image" />
	  <img class="slider_image" />
	  <img class="slider_image" />
	</div>
	<div class="slider_text_panel">
	  <div class="slider_text">
	  	<h1>제목제목제목제목1</h1>
	  	<p>내용내용내용내용1</p>
	  </div>
	  <div class="slider_text">
	  	<h1>제목제목제목제목2</h1>
	  	<p>내용내용내용내용2</p>
	  </div>
	  <div class="slider_text">
	  	<h1>제목제목제목제목3</h1>
	  	<p>내용내용내용내용3</p>
	  </div>
	  <div class="slider_text">
	  	<h1>제목제목제목제목4</h1>
	  	<p>내용내용내용내용4</p>
	  </div>
	  <div class="slider_text">
	  	<h1>제목제목제목제목5</h1>
	  	<p>내용내용내용내용5</p>
	  </div>
	  <div class="slider_text">
	  	<h1>제목제목제목제목6</h1>
	  	<p>내용내용내용내용6</p>
	  </div>
	</div>
	
	<div id="control_panel">
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
		<div class="control_button"></div>
	</div>
</div>
<h1>test header</h1>

<script>
// slider를 움직여주는 함수
function moveSlider(index){
	// slider 이동
	let willMoveLeft = -(index*600);
	$('.slider_panel').animate({left:willMoveLeft}, 'slow');
	
	// control_button에 active 클래스를 부여/제거
	$('.control_button[data-index=' + index + ']').addClass('active');
	$('.control_button[data-index!=' + index + ']').removeClass('active');
	
	// 글자를 이동
	$('.slider_text[data-index='+index+']').show().animate({
		left:0
	},'slow');
	
	$('.slider_text[data-index!='+index+']').hide('slow', function(){
		$(this).css('left', -300);		
	});
};

$('.slider_text').css('left', -300).each(function (index){
	$(this).attr('data-index', index);
});

$('.control_button').each(function (index){
	$(this).attr('data-index', index);
}).click(function(){
	let index = $(this).attr('data-index');
	moveSlider(index);
});
 // 초기 텍스트 위치 지정 및 data-index 할당
 
 // 초기 슬라이더 위치 지정
 let randomNumber = Math.round(Math.random()*4);
 moveSlider(randomNumber);
 

</script>

</body>
</html>