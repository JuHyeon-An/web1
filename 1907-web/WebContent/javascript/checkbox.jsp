<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkbox</title>
<style>
body{
font-family:'배달의민족 을지로체 TTF';
}

fieldset{
margin-bottom:20px;
box-sizing:border-box;
padding:25px;
border:2px solid #405373;
}

fieldset legend{
font-size:25px;
}
#result{
border:5px double #405373;
padding:20px;
box-sizing:border-box;
width:400px;
height:150px;
}
</style>

</head>
<body>
<h3>checkbox</h3>
<form name='frm'>
  
  <fieldset>
  <legend>가고싶은 산을 고르시오.</legend>
  <label><input type='checkbox' name='mnt' value='백두산'>백두산</label>
  <label><input type='checkbox' name='mnt' value='한라산'>한라산</label>
  <label><input type='checkbox' name='mnt' value='금강산'>금강산</label>
  <label><input type='checkbox' name='mnt' value='설악산'>설악산</label>
  <label><input type='checkbox' name='mnt' value='치악산'>치악산</label>
  </fieldset>
  
  <fieldset>
  <legend>살고싶은 지역을 선택</legend>
  <label><input type='checkbox' name='city' value='강원도'>강원도</label>
  <label><input type='checkbox' name='city' value='경기도'>경기도</label>
  <label><input type='checkbox' name='city' value='전라도'>전라도</label>
  <label><input type='checkbox' name='city' value='경상도'>경상도</label>
  <label><input type='checkbox' name='city' value='충청도'>충청도</label>
  <label><input type='checkbox' name='city' value='제주도'>제주도</label>
  </fieldset>
  
  <fieldset>
  <legend>가봤던 나라를 선택</legend>
  <label><input type='checkbox' name='cty' value='미국'>미국</label>
  <label><input type='checkbox' name='cty' value='중국'>중국</label>
  <label><input type='checkbox' name='cty' value='일본'>일본</label>
  <label><input type='checkbox' name='cty' value='태국'>태국</label>
  <label><input type='checkbox' name='cty' value='베트남'>베트남</label>
  <label><input type='checkbox' name='cty' value='호주'>호주</label>
  </fieldset>
  
  <p/>
  <input type='button' value='결정' name='btn'/>
</form>

<div id='result'></div>

<script>
let str = '';
let r = document.getElementById('result');
let mnt = [];
let city = [];
let cty = [];

frm.btn.onclick = function(){
	/* 산의 선택 여부 체크*/
	let mntFlag = false;
	mnt.length = 0;
	for(i=0; i<frm.mnt.length; i++){
	  if(frm.mnt[i].checked){
		  mnt.push(frm.mnt[i].value);
		  mntFlag = true;
	  }	
	}
	if(!mntFlag){
		alert('가고싶은 산을 선택하세요.');
		return;
	}
	
	/* 살고싶은 지역 선택 여부 */
	mntFlag = false;
	city.length = 0;
	for(i=0; i<frm.city.length; i++){
		if(frm.city[i].checked){
		city.push(frm.city[i].value);
		mntFlag = true;
		}
	}
	if(mntFlag == false){
		alert('살고싶은 지역을 선택하세요.');
		return;
	}
	
	mntFlag = false;
	cty.length = 0;
	for(i=0; i<frm.cty.length; i++){
		if(frm.cty[i].checked){
			cty.push(frm.cty[i].value);
			mntFlag = true;
		}
	}
	if(mntFlag == false){
		alert('방문해봤던 나라를 선택하세요.');
		return;
	}
	
	
	str = '<li> 산 이름 : '+mnt
		+ '<li> 도시명 : ' +city
		+ '<li> 국가명 : ' +cty;
	
	r.innerHTML = str;
}
</script>

</body>
</html>