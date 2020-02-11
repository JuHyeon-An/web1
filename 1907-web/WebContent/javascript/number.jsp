<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>number</title>
<style>
form{
  position:relative;
}
input[type=button]{
  height : 45px;
  position : absolute;
  left:220px;
  top:2px;
}

textarea{
  margin-top:20px;
}

</style>

</head>
<body>
<h3>Number, parseInt, parseFloat</h3>
<form name='frm'>
  <label>성명</label>
  <input type='text' name='irum' value='hong'/>
  <br/>
  <label>성적</label>
  <input type='text' name='score' value='50'/>
  <input type='button' value='CHECK' name='btn'/><br/>
  <textarea rows="10" cols="50" name='result'></textarea>

</form>

<script>

// 이름에 숫자가 있는지를 판별
frm.btn.onclick = function(){
let flag = false;
let n = frm.irum.value;
let s = frm.score.value;
	for(i=0; i<n.length; i++){
		var c = n.charAt(i);
		if(!isNaN(Number(c))){ //isFinite(Number(c))
			flag=true;
			break;
		}
	}
	if(flag){
		frm.result.value='이름에 숫자가 있으면 안 됨';
		frm.irum.focus();
		frm.irum.select();
	}else{
		frm.result.value='';
	}
// 성적에 문자 포함여부
if(isNaN(s)){ // !isFinite(s)
	frm.result.value='성적에 문자가 있으면 안 됨';
	frm.score.focus();
	frm.score.select();
	flag=true;
}

if(!flag){
	frm.result.value = `성명 : \${n} \n성적 : \${s}`;
}
//flag가 true : 오류가 있는 것
}
</script>

</body>
</html>