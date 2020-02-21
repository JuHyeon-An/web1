<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>16-16 event_mouse</title>
<style>
button{
  height:80px;
  width:100px;
}
</style>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
  <canvas id='canvas' width='700' height='400' style='border:3px solid black'>
  </canvas>
  <br/>
<button>clear</button>
<input type="color" id="col"/>
</body>
  <script>
  let canvas = document.getElementById('canvas');
  let context = canvas.getContext('2d');
  let flag=false; //mousedown일때 true, mouseup일때 false
  $(canvas).on({
	  mousemove:function(event){
  		context.strokeStyle = $('#col').val();
		  if(flag){
		  let position = $(this).offset();
		  // 마우스 포인터부터 그려지도록 (왼쪽모서리 맨 위부터)
		  
		  let x = event.pageX - position.left;
		  let y = event.pageY - position.top;
		  
		  context.lineTo(x,y);
		  // 점과 점을 연결
		  context.stroke();
		  }
	  },
	  mousedown:function(event){
		  let position = $(this).offset();
		  let x = event.pageX - position.left;
		  let y = event.pageY - position.top;
		  
		  context.beginPath();
		  context.moveTo(x,y);
		  flag=true;
	  },
	  mouseup:function(event){
		  let position = $(this).offset();
		  let x = event.pageX - position.left;
		  let y = event.pageY - position.top;
		  
		  context.lineTo(x,y);
		  context.stroke();
		  flag = false;
	  }
  });
  
  $('button').click(function(){
	  context.clearRect(0, 0, canvas.width, canvas.height);
  });
  
  </script>
</html>