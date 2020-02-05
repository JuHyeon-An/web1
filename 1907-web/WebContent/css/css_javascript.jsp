<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_javascript</title>
<style>
#div1{
  height:100px;
  border:2px solid #0000ff;
}
</style>
</head>
<body>
<h3> css를 javascript로 제어 </h3>
<p>
  구조 => 요소명.style.css속성명 = '속성값';
</p>
<div id='div1'></div>
<input type='button' value='RED' id='btnRED' />
<input type='button' value='GREEN' id='btnGREEN' />
<input type='button' value='BLUE' id='btnBLUE' />

<script>
	
  let btnR = document.getElementById('btnRED');
  let btnG = document.getElementById('btnGREEN');
  let btnB = document.getElementById('btnBLUE');
  let div = document.getElementById('div1');
  
  btnR.onclick = function(){
	div.style.backgroundColor='#ffeeee';
  }
  btnG.onclick = function(){
	div.style.backgroundColor='#eeffee';
  }
  btnB.onclick = function(){
	div.style.backgroundColor='#eeeeff';
  }
	
</script>

</body>
</html>


