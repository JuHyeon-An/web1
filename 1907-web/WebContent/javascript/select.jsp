<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<style>
.sel{
  width:150px;
}
#result{
  margin-top : 30px;
  border: 2px dotted black;
  width:300px;
  height:200px;
  background-color:powderblue;
  boax-sizing:border-box;
  padding:15px;
  box-shadow:3px 3px 4px #555;
  border-radius:20px 0px 20px 0px;
}

</style>
</head>
<body>
<h1>select</h1>
<form name = 'frm'>
  <h3>과정명을 하나만 선택</h3>
  <select name = 'course' size='1' class='sel'>
    <option value='프로그래밍 과정'>프로그래밍 과정</option>
    <option value='웹 디자인 과정'>웹 디자인 과정</option>
    <option value='스크립터 과정'>스크립터 과정</option>
    <option value='퍼블리싱 과정'>퍼블리싱 과정</option>
  </select>
  <h3>신청 과목을 한개 이상 선택</h3>
  <select name ='subject' size='7' multiple='multiple' class='sel'>
    <option value='java'>java</option>
    <option value='html5'>html5</option>
    <option value='css3'>css3</option>
    <option value='javascript'>javascript</option>
    <option value='jsp'>jsp</option>
    <option value='ajax'>ajax</option>
    <option value='jquery'>jquery</option>
    <option value='node.js'>node.js</option>
    <option value='spring'>spring</option>
  </select> 
  <input type='button' value='선택' name='btn'/>
</form>
<div id='result'></div>

<script>
let subject = [];
let r = document.getElementById('result');
let str = '';

frm.btn.onclick = function(){
  str = '<li>과정명 : ' + frm.course.value;
  
  subject.length=0;
  for(i=0; i<frm.subject.length; i++){
	if(frm.subject[i].selected){
		subject.push(frm.subject[i].value);
	}
  }
  str += '<li> 과목명 : '+subject;
  r.innerHTML = str;
}
</script>
</body>
</html>