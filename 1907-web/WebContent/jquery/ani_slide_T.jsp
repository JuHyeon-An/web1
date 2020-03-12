<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_slide</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
*{ 
	margin:0;
	padding:0;
}
#canvas{
	background-color:gray;
	width:600px;
	height:400px;
	position:relative;
	overflow:hidden;
}
.slider{
	width:3000px;
	position:relative;
}
.image{
	float:left;
	width:600px;
	height:400px;
}

.slider-text{
	position: absolute;
	top:200px;
	left:50px;
}
.text{
	position: absolute;
	width:250px;
	height:150px;
}
.slider-control{
	position: absolute;
	top:380px;
	left:270px;
	height:13px;
	overflow: hidden;
}
.button{
	width:12px;
	height:46px;
	position: relative;
	float:left;
	cursor: pointer;
	background-color:red;
	border:2px solid white;
}

.button:hover {
	top:-16px;
}
.button.active{ top:-31px;}
</style>
</head>
<body>
	<h1>Test Header</h1>
	<div id='canvas'>
		<div class='slider'>
			<img class='image'/>
			<img class='image'/>
			<img class='image'/>
			<img class='image'/>
			<img class='image'/>
		</div>
		
		<div class='slider-text'>
			<div class='text'>문자1</div>
			<div class='text'>문자2</div>
			<div class='text'>문자3</div>
			<div class='text'>문자4</div>
			<div class='text'>문자5</div>
		</div>

		<div class='slider-control'>
			<div class='button'></div>
			<div class='button'></div>
			<div class='button'></div>
			<div class='button'></div>
			<div class='button'></div>
		</div>
	</div>
	
	<h1>Test Footer</h1>
	
	<script>
		function moveSlider(index){
			let willMoveLeft = -(index * 600);
			$('.slider').animate({
				left : willMoveLeft
			}, 'slow');
			$('.button[data-index=' + index + ']').addClass('active');
			$('.button[data-index!=' + index + ']').removeClass('active');
		
			$('.text[data-index=' + index + ']').show().animate({
				left:0
			}, 'slow');
			
			$('.text[data-index!=' + index + ']').hide().animate({
				left:-300
			}, 'slow');
		
		
		}
		
		let img=['img1.jpg', 'img2.jpg','img3.jpg', 'img4.jpg', 'img5.jpg',  ]
		$('.image').each(function(index){
			$(this).attr({
				'src' : '../images/' + img[index]
				
			})
		})
	
		$('.text').css('left', -300).each(function(index){
			$(this).attr('data-index', index);
		});		
		
		
		$('.button').each(function(index){
			$(this).attr('data-index', index);
		}).click(function(){
			let index = $(this).attr('data-index');
			moveSlider(index);
		});
		
		rnd = Math.round(Math.random()*4);
		moveSlider(rnd);
	</script>
</body>
</html>