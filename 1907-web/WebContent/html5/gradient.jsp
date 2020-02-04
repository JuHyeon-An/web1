<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gradient</title>
<style>
.can{ border:2px solid #ffffff}
body{
background-color : #000000;
color : #ffffff;}
h3{
color : #ffffff;
}

</style>
</head>
<body>
<h3>선형 그라데이션</h3>
<canvas id='can1' class='can' width='300px' height='150px'></canvas>
<br/>
<form name='frm'>
  <input type='color' name='fc' value='#ff0000'/>
  <input type='color' name='sc' value='#00ff00'/>
  <input type='color' name='tc' value='#0000ff'/>
  <input type='button' value='선형' name='btnLinear'/>
</form>

<script>
frm.btnLinear.onclick = function(){
	let fc = frm.fc.value;
	let sc = frm.sc.value;
	let tc = frm.tc.value;
	let ctx = document.getElementById('can1').getContext('2d');
	let gra = ctx.createLinearGradient(20,20,250,110);
	
	gra.addColorStop(0, fc);
	gra.addColorStop(0.5, sc);
	gra.addColorStop(1, tc);
	
	ctx.fillStyle = gra;
	ctx.fillRect(20,20,250,110);
}
</script>

<h3>원형 그라데이션</h3>
<canvas id='can2' class='can' width='300px' height='300px'></canvas>
<br/>
<form name='frm2'>
  <input type='color' name='fc' value='#ff0000'>
  <input type='color' name='sc' value='#00ff00'>
  <input type='color' name='tc' value='#0000ff'>
  <input type='button' value='원형' name='btnRadial'/>
</form>
<script>
frm2.btnRadial.onclick = function(){
	let fc = frm2.fc.value;
	let sc = frm2.sc.value;
	let tc = frm2.tc.value;
	let ctx = document.getElementById('can2').getContext('2d');
	let gra = ctx.createRadialGradient(150, 150, 15, 150, 150, 180, 150, 150, 200);
	
	gra.addColorStop(0,fc);
	gra.addColorStop(0.5, sc);
	gra.addColorStop(1, tc);

	ctx.fillStyle = gra;
	ctx.fillRect(0,0,300,300);
}

</script>

</body>
</html>