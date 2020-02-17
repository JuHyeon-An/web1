<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>checkbox</h3>
<form name='frm'>
  
  <fieldset>
  <legend>가고싶은 산을 고르시오.</legend>
  <label><input type='checkbox' name='mnt' value='백두산'>백두산</label>
  <label><input type='checkbox' checked name='mnt' value='한라산'>한라산</label>
  <label><input type='checkbox' name='mnt' value='금강산'>금강산</label>
  <label><input type='checkbox' checked name='mnt' value='설악산'>설악산</label>
  <label><input type='checkbox' name='mnt' value='치악산'>치악산</label>
  </fieldset>
  
  <fieldset>
  <legend>살고싶은 지역을 선택</legend>
  <label><input type='checkbox' name='city' value='강원도'>강원도</label>
  <label><input type='checkbox' name='city' value='경기도'>경기도</label>
  <label><input type='checkbox' checked name='city' value='전라도'>전라도</label>
  <label><input type='checkbox' name='city' value='경상도'>경상도</label>
  <label><input type='checkbox' checked name='city' value='충청도'>충청도</label>
  <label><input type='checkbox' name='city' value='제주도'>제주도</label>
  </fieldset>
  
  <fieldset>
  <legend>가봤던 나라를 선택</legend>
  <label><input type='checkbox' checked name='cty' value='미국'>미국</label>
  <label><input type='checkbox' name='cty' value='중국'>중국</label>
  <label><input type='checkbox' name='cty' value='일본'>일본</label>
  <label><input type='checkbox' name='cty' value='태국'>태국</label>
  <label><input type='checkbox' checked name='cty' value='베트남'>베트남</label>
  <label><input type='checkbox' name='cty' value='호주'>호주</label>
  </fieldset>
  
  <p/>
  <input type='button' value='결정' name='btn'/>
</form>

<div id='result'></div>

<script>
chk = [];
$(function(){
	$.each(function(index, item){
		
	chk = $('input[type="checkbox"]:checked').val();
	})
	console.log(chk);
});
</script>
</body>
</html>