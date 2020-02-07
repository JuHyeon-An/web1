<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if(III)</title>

<style>

body{
  font-family:'나눔스퀘어B';
}



#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 6px #999;
}
form{
  margin-left:30px;
}

form>.c1{
  display:inline-block;
  width:60px;
  text-align:right;
  margin-right:10px;
  margin-bottom:10px;
}

fieldset{
  margin-top:20px;
}
</style>

</head>
<body>
<h3>if(III)</h3>
<p id='info'>
키와 몸무게를 입력받아 키가 120미만이거나 몸무게가 100kg이상이면
라디오 버튼 중 탑승불가 버튼을, 아니면 탑승가능 버튼이 체크되도록 하시오. 
</p>

<form name='frm'>
	<label class='c1'>키</label>
	<input type='text' name='height' size='7'/><br/>
	<label class='c1'>몸무게</label>
	<input type='text' name='weight' size='7'/>
	<input type='button' value='확인' name='btn'/>
	
	<fieldset>
	<legend>결과</legend>
	<label><input type='radio' name='chk'>탑승가능</label>
	<label><input type='radio' name='chk'>탑승불가</label>
	</fieldset>
</form>

<script>

frm.btn.onclick = function(){
	
let h = Number(frm.height.value);
let w = Number(frm.weight.value);

if(h<120 || w>=100){
	frm.chk[1].checked=true;
}else{
	frm.chk[0].checked=true;
}
}
</script>

</body>
</html>