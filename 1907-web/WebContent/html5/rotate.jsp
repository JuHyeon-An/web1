<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도형회전</title>
<style>
#can { border: 2px solid white}
body{
	background-color : black;
	color : white;
}

</style>
</head>
<body>
<h3>rotate</h3>
<canvas id='can' width='500px' height='500px'></canvas>
<br/>
<form name='frm'>
  <label>도형의 갯수</label>
  <input type='range' name='cnt' min='1' max='1000'/>
  <output name='msg' value='1'></output>
  
</form>
<script>
let ctx = document.getElementById('can').getContext('2d');
ctx.translate(200,200);
frm.cnt.onchange=function(){
	frm.msg.value = frm.cnt.value;
	ctx.lineWidth='1';
	ctx.strokeStyle='white';
	ctx.clearRect(-250,-250,750,750)
	for(i=0; i<frm.msg.value; i++){
		let c = frm.msg.value;
		ctx.rotate(Math.PI/180 * (360/c));
		ctx.strokeRect(40, 40, 70, 70);
	}
}
</script>
</body>
</html>