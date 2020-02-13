<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>date</h3>
<fieldSet id='info'>
  생년월일을 입력하여 오늘 날짜를 기준으로 나이, 개월수, 시간수, 분수를 계산하여 표시하시오. 
</fieldSet>
<form name='frm'>
<label>생년월일</label>
<input type='date' name='birth'/><br/>
<label>오늘 날짜</label>
<input type='date' name='now'/><br/>
<input type='button' value='날수계산' name='btn'/>
</form>
<div id='result'></div>

<script>
  tempDate = new Date();
  let r = document.getElementById('result');

  frm.birth.valueAsDate = tempDate;
  frm.now.valueAsDate = tempDate;
  
  frm.btn.onclick = function(){
  let str = '';
  let d1 = new Date(frm.birth.value);
  let d2 = new Date(frm.now.value);
  
  let d = (d2-d1)/1000;
  
  let mi = d/60; // 분
  let ho = d/60/60; // 시간
  let da = d/60/60/24; // 날
  let mo = parseInt(d/60/60/24/30); // 개월
  let ye = parseInt(d/60/60/24/30/12); // 년수
  
  str = '<li>년수     : '+ye
  	  + '<li>개월수  : '+mo
  	  + '<li>날 수    : '+da
  	  + '<li>시간 수 : '+ho
  	  + '<li>분 수    : '+mi;
  
  r.innerHTML = str;
  }
  
  
</script>

</body>
</html>