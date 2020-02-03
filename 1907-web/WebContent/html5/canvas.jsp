<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>canvas</title>
<style>
.can{
  border:2px solid #0000ff
}
</style>
</head>
<body>
<h3>RECT - 캔버스로 사각형 만들기</h3>
<canvas id='can1' class='can' width='300px' height='150px'></canvas>
<script>
  let canvas = document.getElementById('can1');
  let ctx = canvas.getContext('2d');
  ctx.strokeStyle = 'rgb(255,0,0)'; // 선의 색을 빨간색으로 지정 (#ff0000) => 붓에 빨간색 물감 칠해놓은 상태
  ctx.strokeRect(50,50,50,70);
  
  ctx.fillStyle = 'rgb(255,200,100)';
  ctx.fillRect(150,50,70,70);
</script>

<h3>RECT - 반투명한 사각형 그리기</h3>
<canvas id='can2' class='can' width='300px' height='150px'></canvas>
<script>
  canvas = document.getElementById('can2');
  ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgba(255,0,0,0.5)';
  ctx.fillRect(50,20,70,70);
  
  ctx.fillStyle = 'rgba(0,0,255,0.5)';
  ctx.fillRect(85,55,70,70);
</script>

<h4>RECT - 막대그래프 그리기</h4>
<canvas id='can3' class='can' width='500px' height='325px'></canvas>
<script>
  canvas = document.getElementById('can3');
  ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(255,200,100)';
  ctx.fillRect(20,45,400,45); //넓이 380
  ctx.font='20px 궁서체';
  ctx.strokeText('380', 430, 75);

  ctx.fillStyle = 'rgb(255,0,100)';
  ctx.fillRect(20,110,320, 45);
  
  ctx.fillStyle = 'rgb(150,100,255)';
  ctx.fillRect(20,175,200,45);
  
  ctx.fillStyle = 'rgb(0,100,255)';
  ctx.fillRect(20,240,260,45);
  
</script>

<h3>삼각형</h3>
<canvas id='can4' class='can' width='300px' height='150px'></canvas>
<script>
  canvas = document.getElementById('can4');
  ctx = canvas.getContext('2d');
  ctx.strokeStyle='rgb(255,0,0)';
  ctx.beginPath();
  	ctx.moveTo(150, 10);
  	ctx.lineTo(120, 80);
  	ctx.lineTo(180, 80);
  ctx.closePath();
  	ctx.stroke();	

</script>

<h3>원(원호) 그리기</h3>
<canvas id='can5' class='can' width='300px' height='500px'></canvas>
<script>
	canvas = document.getElementById('can5');
	ctx = canvas.getContext('2d');
	//type1
	ctx.beginPath();
	ctx.arc(75, 75, 60, 0, Math.PI*1, true);
	ctx.closePath();
	ctx.stroke();
	
	ctx.beginPath();
	ctx.arc(225, 75, 60, 0, Math.PI*1, false);
	ctx.closePath();
	ctx.stroke();
	
	//type2
	ctx.beginPath();
	ctx.moveTo(75, 270);
	ctx.arc(75, 210, 60, 0, Math.PI*1, true);
	ctx.closePath();
	ctx.stroke();
	
	ctx.beginPath();
	ctx.moveTo(225, 190);
	ctx.arc(225, 210, 60, 0, Math.PI*1, true);
	ctx.closePath();
	ctx.stroke();
	
	//type3
	
	ctx.beginPath();
	ctx.arc(75, 360, 60, Math.PI*1.5, Math.PI*0.5, true);
	ctx.closePath();
	ctx.stroke();
	
	ctx.beginPath();
	ctx.arc(225, 390, 60, Math.PI*0.5, Math.PI*1.5, true);
	ctx.closePath();
	ctx.stroke();
	
</script>

</body>
</html>

