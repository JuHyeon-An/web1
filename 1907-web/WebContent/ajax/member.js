/**
 * 회원관리
 * data : 2020.02.21 
 */

let xhr = new XMLHttpRequest();
let init = function(url){
	// 멤버 메인이 로딩되면 바로 호출되는 함수 - 초기화면 설정 (조회)
	// member_select를 연결해서 result 영역에 출력
	
	xhr.open('get', url);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status == 200 && xhr.readyState == 4){
			$('#result').html(xhr.responseText);
		};
	};
};


let insert = function(){
	let v = $('#frmInsert').serialize();
	xhr.open('POST', 'member_insert.jsp', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8');
	xhr.send(v);
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			if(xhr.reponseText==1){
					alert('성공');
					console.log(xhr.reponseText);
				}else{
					alert('실패');
					console.log(xhr.reponseText);
				};
		};
	};
};

let search = function(){
	let v = $('#findStr').val();
	let url = 'member_select.jsp?findStr='+v;
	
	xhr.open('get', url);
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			let temp = xhr.responseText;
			let array = JSON.parse(temp);
			let str ="<div class='header'>"
				+"<span class='no'>번호</span>"
				+"<span class='id'>아이디</span>"
				+"<span class='mname'>이름</span>"
				+"<span class='rdate'>등록날짜</span>"
				+"<span class='grade'>학년</span>"
				+"</div>";
			i = 1;
			$(array).each(function(index){
			str += "<div class='item'>"
				+ "	 <span class='no'>" + i + "</span>"
				+ "	 <span class='id'>" + array[index].mid + "</span>"
				+ "  <span class='mname'>" + array[index].mname + "</span>"
				+ "  <span class='rdate'>" + array[index].rdate + "</span>"
				+ "  <span class='grade'>" + array[index].grade + "</span>"
				+ "</div>";
				i++;
		});
		$('#result2').html(str);
	};
};
};

