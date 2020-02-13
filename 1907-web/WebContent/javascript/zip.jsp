<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zip</title>
<style>
#sel{ width:130px; }
</style>
</head>
<body>
<h3>우편번호 검색</h3>
<select name='sel' size='10' id='sel'>
  <option value='11-111'>주소1</option>
  <option value='21-111'>주소2</option>
  <option value='31-111'>주소3</option>
  <option value='41-111'>주소4</option>
  <option value='51-111'>주소5</option>
  <option value='61-111'>주소6</option>
  <option value='71-111'>주소7</option>
  <option value='81-111'>주소8</option>
  <option value='91-111'>주소9</option>
  <option value='10-111'>주소10</option>
</select>

<script>
  let sel = document.getElementById('sel');
  sel.ondblclick = function(){
	  let index = sel.selectedIndex;
	  // 선택된 위치의 위치번호가 나온다
	  let zipCode = sel[index].value;
	  // sel의 index번째가 가지고 있는 value값
	  let address = sel[index].text;
	  // 주소값은 text, 우편번호는 value
	  window.opener.frm.zip.value = zipCode;
	  window.opener.frm.address1.value = address;
	  self.close();
	  // opener: 자기 자신을 연 윈도우
  }
</script>
</body>
</html>