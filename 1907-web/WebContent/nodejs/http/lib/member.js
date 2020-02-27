/**
 * 회원관리
 * date : 2020.01.21
 */
let findStr='';//화면이 바꾸어도 검색어를 유지하기 휘한 변수

/*
 * member_main 을 처름으로 호출했을 때와 목록 버튼이 클릭된 경우
 * 검색폼과 목록을 표시하기 위해
 */
let init = function(){
	xhr.open('get', 'member_select.jsp');
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			$('#form').html(xhr.responseText); //검색 폼 표시
			
			// 검색 버튼이 클릭된 경우 목록을 가져와 표시
			$('#btnFind').click(function(){
				findStr = $('#findStr').val();
				select();
			})
			
		}
	}
}

let select = function(){
	btnFunc();
}

let btnFunc = function(){
	if($('#btnList')!=null){
		$('#btnList').click(function(){
			location.href='select.html';
		})
	}
	
	if($('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			location.href='insert_form.html';
		})
	}
	
	// 저장버튼
	if( $('#btnRegister')!=null){
		$('#btnRegister').click(function(){
			location.href='insert_result.html';
		})
	}
	
	if( $('#btnModify')!=null){
		$('#btnModify').click(function(){
			location.href='modify_form.html';
		})
	}
	
	if( $('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			location.href='modify_result.html';
		})
	}
	
	if($('#btnDelete')!=null){
		$('#btnDelete').click(function(){
			let yn = confirm("정말 삭제하시겠습니까????");
			if(yn){
				location.href='delete_result.html';
			}
		})
	}
}

// 회원가입 폼에서 등록 버튼이 클릭된 경우
let insert = function(){
	btnFunc();
	frm.rDate.valueAsDate = new Date();
	// 회원가입할때 자동으로 오늘날짜 입력됨
}

// 목록화면에서 항목을 클릭한 경우 상세보기로 이동
let view = function(mId){
	location.href='view.html';
}

let selectOne = function(mId){
	btnFunc();
}

let select = function(){
	btnFunc();
}

// 회원정보 수정화면에서 정보수정 버튼이 클릭된 경우
let update = function(){
	btnFunc();
}

// 삭제버튼이 클릭된 경우
let deleteF = function(mId){
	let param = "mId=" + mId;
	xhr.open('post', 'member_delete_result.jsp');
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded;charset=utf-8');
	xhr.send(param);
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			$('#result').html(xhr.responseText);
		}
	}
}

//상세보기 화면에서 수정 버튼이 클릭된 경우
let modify = function(){
	btnFunc();
}