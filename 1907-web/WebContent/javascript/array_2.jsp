<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array_2</title>
<style>
body{
  font-family : '둥근모꼴';
}

#info{
  border:2px outset salmon;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 6px #999;
}

#frm{
width:400px;
}


label{
width:100px;
float:left;
margin-top:20px;
}

input{margin-top:20px;}

input[type=text]{
float:left;
width:270px;
}
input.btn{
width:180px;
margin:20px 20px 0 0;

}

input.btn2{
width:180px;
margin:20px 0px 0 0;

}

#result{
border:4px dotted salmon;
height :100%;
width : 400px;
margin-top:20px;
overflow:auto;
padding : 20px;
}
</style>
</head>
<body>
<h3>array_2</h3>
<p id='info'>
폼을 사용하여 아이디, 성명, 국어, 영어점수를 입력받아 총점과 평균을 계산하여
배열에 저장하시오. <br/>
<!-- 
[
	{'id':'park', 'name':'박원기', 'kor':90, 'eng':80, 'tot':170, 'avg':85}
	{'id':'an', 'name':'안주현', 'kor':90, 'eng':80, 'tot':170, 'avg':85}
]
 -->
</p>

<form name='frm' id="frm">
<label>아이디 </label><input type='text' name='id'/>
<label>성명 </label><input type='text' name='irum'/>
<label>국어 </label><input type='text' name='kor'/>
<label>영어 </label><input type='text' name='eng'/>
<label>총점 </label><input type='text' name='tot'/>
<label>평균 </label><input type='text' name='avg'/>
<input type='button' name='btn' value='저장' class="btn"/>
<input type='button' name='btn2' value='출력' class="btn2"/>
</form>
 
<div id='result'></div>
<script>
let a = [];
let r = document.getElementById('result');
let str = '';
frm.btn.onclick = function(){

let i = frm.id.value;
let irum = frm.irum.value;
let eng = Number(frm.eng.value);
let kor = Number(frm.kor.value);
let tot = eng+kor;
let avg = tot/2;
let data = {"id" : i, "name" : irum, "kor":kor, "eng":eng, "tot":tot, "avg":avg};
	a.push(data);
}

frm.btn2.onclick = function(){
	str = '';
	for(j of a){
	
	str += '<li> 아이디 : '+j.id
	+ '<li> 이름 : '+j.name
	+ '<li> 국어점수 : '+j.kor
	+ '<li> 영어점수: '+j.eng
	+ '<li> 총점 : '+j.tot
	+ '<li> 평균 : '+j.avg
	+ '<hr/>';
	}
r.innerHTML = str;
}

let compute = function(){
	let kor = Number(frm.kor.value);
	let eng = Number(frm.eng.value);
	let tot = kor+eng;
	let avg = tot/2;
	frm.tot.value = tot;
	frm.avg.value = avg;
}
frm.kor.onchange=compute;
frm.eng.onchange=compute;
</script>


</body>
</html>