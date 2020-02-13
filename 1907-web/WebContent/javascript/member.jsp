<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
</head>
<body>
<h3>회원가입</h3>
<form name='frm'>
  <label>우편번호</label>
  <input type='text' size='7' name='zip'/>
  <input type='button' value='우편번호 검색' name='btn'/>
  <input type='button' value='다음 우편번호 검색' name='btn2'/>
  <br/>
  <input type='text' size='60' name='address1'/><br/>
  <label>상세주소</label>
  <input type='text' size='40' name='address2'/>
</form>

<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1581583679993" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1581583679993",
		"key" : "x2cx",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>

<script>
frm.btn.onclick = function(){
	let w = window.open('zip.jsp', 'w', '');
}

frm.btn2.onclick = function(){ // daum API 사용
	new daum.Postcode( {
		oncomplete : function(data){ // oncomplete => 작업이 완료되면. (더블클릭)
			frm.zip.value = data.zonecode;
			frm.address1.value = data.address;
		}
	} ).open();
}
</script>

</body>
</html>