<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>switch2</title>
<style>
body{
  font-family:'배달의민족 을지로체 TTF';
  font-size:20px;
}
#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 0px #7777ff;
}

#result{
  border : 2px outset #7777ff;
  padding:30px;
  box-sizing:border-box;
  border-radius:20px 0px 20px 0px;
  height:150px;
  margin-top:20px;
  box-shadow:3px 3px 0px #7777ff
}
</style>
</head>
<body>
<h3>switch2</h3>
<p id='info'>
  성적을 입력받아 학점을 구하여 성적과 학점을 div에 출력.
</p>
<form name='frm'>
  <label> 성적 : </label>
  <input type='text' name='score' value='80'/>
  <input type='button' value='학점구하기' name='btn'/>
</form>
<div id='result'></div>
<script>
let r = document.getElementById('result');

frm.btn.onclick=function(){
	
	let str = '';
	let score = Number(frm.score.value);
	str += '<li> 성적 : '+score;
	str += '<li> 학점 : ';
	
	switch(true){
	case score>=90:
		str += 'A';
		break;
	
	case score>=80:
		str += 'B';
		break;
	
	case score>=70:
		str += 'C';
		break;
		
	case score>=60:
		str += 'D';
		break;
	default:
		str += 'F';
	}
	r.innerHTML = str;
	
	let color = (score>=60)? '#ddddff': '#ffdddd';
	r.style.backgroundColor = color;
	
}

</script>
</body>
</html>