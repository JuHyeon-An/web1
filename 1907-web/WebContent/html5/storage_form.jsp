<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storage_form</title>
<style>
body{
background-color:black;
color:white;}

</style>
</head>
<body>
<h3>폼 정보를 storage에 저장 후 재설정하기</h3>
<form name='frm'>
	<label>아이디 </label>
	<input type='text' name='mId'/><br/>
	<label>성별 </label>
	<label><input type='radio' name='gender' value='m'> 남자</label>
	<label><input type='radio' name='gender' value='f'> 여자</label>
	<br/>
	<label>취미 </label>
	<label><input type='checkbox' name='hobby' value='축구'> 축구</label>
	<label><input type='checkbox' name='hobby' value='야구'> 야구</label>
	<label><input type='checkbox' name='hobby' value='배구'> 배구</label>
	<label><input type='checkbox' name='hobby' value='농구'> 농구</label>
	<br/>
	<label>과정선택 </label>
	<select size='1' name='subject'>
		<option value='java'>java</option>
		<option value='html'>html</option>
		<option value='css'>css</option>
		<option value='javascript'>javascript</option>
	</select>
	<p/>
	<input type='button' value='SAVE' name='btnSave'/>
</form>
<script>
// 스크립트가 실행되면서 저장된 object를 가져다 form 상태값을 변경.

	let obj = localStorage.getItem("data");
	if (obj != null) { // 데이터가 있을때만 실행 (한번도 저장된 적이 없으면 null)
		let d = JSON.parse(obj); // obj를 다시 객체로 만들어

		frm.mId.value = d.mId; // 아이디 저장
		//frm.subject.value = d.subject; // subject 저장

		if (d.gender == 'm') {
			frm.gender[0].checked = true;
		} else {
			frm.gender[1].checked = true;
		}

		for (i = 0; i < frm.hobby.length; i++) {
			for (j = 0; j < d.hobby.length; j++) {
				if (frm.hobby[i].value == d.hobby[j]) {
					frm.hobby[i].checked = true;
					break;
				}
			}
		}
		// 저장된 값도 배열, form태그에 나열된 값도 배열이라 2중 for문 사용
		for (i = 0; i < frm.subject.options.length; i++) {
			if (frm.subject.options[i].value == d.subject) {
				frm.subject.selectedIndex = i;
			}
		}
	}
	

	frm.btnSave.onclick = function() {
		let mId = frm.mId.value;
		let gender;
		let hobby = []; // 배열선언 (JSON type)
		let subject;

		if (frm.gender[0].checked) {
			gender = frm.gender[0].value; // 첨자를 저장하지 않고 value값 저장
		} else {
			gender = frm.gender[1].value;
		}
		/* 첫번째값이 선택됐으면 첫번째값의 value를 가져오고,
		   두번째값 (else) 선택됐으면 두번째값의 value
		 */

		for (i = 0; i < frm.hobby.length; i++) {
			if (frm.hobby[i].checked) {
				hobby.push(frm.hobby[i].value);
			}
		}

		subject = frm.subject.value;

		//object 생성
		let d = new Data(mId, gender, hobby, subject);
		let s = JSON.stringify(d);
		console.log('save data', s); //콘솔창에 출력
		localStorage.setItem('data', s);
	}

	function Data(mId, gender, hobby, subject) {
		this.mId = mId;
		this.gender = gender;
		this.hobby = hobby;
		this.subject = subject;
	}
</script>

</body>
</html>