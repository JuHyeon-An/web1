<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>drawImage</title>
<style>
#can{ border:1px solid #9999ff}


</style>
</head>
<body>
<h3>drawImage</h3>
<canvas id='can' width='1000px' height='1000px'></canvas>
<br/>
<label>확대 축소</label>
<form name='frm'>
  <input type='range' name='rate' min='-100' max='10'/> 
</form>
<script>
let ctx = document.getElementById('can').getContext('2d');
frm.rate.onchange=view; // function view를 실행해라 (call back 형태. 선언해놓고 이벤트가 발생하면 실행하는 함수)
view();
function view(){
	let img = new Image();
	img.src = '../images/아이콘.jpg';
	ctx.clearRect(0,0, 1000, 1000);
	ctx.drawImage(img, 0,0);
	let w = img.width + (img.width * frm.rate.value);
	let h = img.height + (img.height * frm.rate.value);
	ctx.drawImage(img, 0,0, img.width, img.height, img.width+10, 0, w, h);
}
</script>
</body>
</html>