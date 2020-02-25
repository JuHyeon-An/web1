/**
 * 회원관리
 * date : 2020.01.21
 */
let xhr = new XMLHttpRequest();
let findStr='';//화면이 바꾸어도 검색어를 유지하기 위한 변수

/*
 * member_main 을 처름으로 호출했을 때와 목록 버튼이 클릭된 경우
 * 검색폼과 목록을 표시하기 위해
 */
let init = function(){
	
	$.get('member_select.jsp', function(data){
		$('#form').html(data);
		
		$('#btnFind').click(function(){
			findStr = $('#findStr').val();
			select();
		});
	});

	/*
	$('#form').load('member_select.jsp', function(){
		$('#btnFind').click(function(){
			findStr = $('#findStr').val();
			select();
		})
	})
	*/
}

let select = function(){
	// 검색어 정보 유지
	$('#findStr').val(findStr);
	$('#result').removeClass('result_ok');
	
	$.getJSON('member_select_result.jsp?findStr='+findStr, function(json){ 
		
		// getJSON -> 알아서 매개변수 json에 parsing 다 해서 들어감
		let str = '';
		for(d of json){
			str += "<div class='item'> <a onclick=\"view('" + d.mid + "')\">" 
			     +  "<span class='mId'>" + d.mid + '</span>'
			     +  "<span class='mName'>" + d.mname + '</span>'
			     +  "<span class='rDate'>" + d.rdate + '</span>'
			     +  "<span class='grade'>" + d.grade + '</span>'
			     +  '</a></div>';
		}
		$('#result').removeClass('result_ok');
		$('#result').html(str);
		
	});
	
	//엔터키를 눌렀을 때  submit 기능 중지하고 검색 버튼에 클릭 이벤트 발생
	$('#frm').submit(function(){
		$('#btnFind').click();
		return false;
	});

	// 회원추가 버튼이 클릭된 경우
	$('#btnInsert').click(function(){
		
		$.get('member_insert.jsp', function(data) {
			$('#form').html(data);
			$('#result').html('');
		});
		
		$('#form').load('member_insert.jsp');
		$('#result').html('');
		
	});
}

// 회원가입 폼에서 등록 버튼이 클릭된 경우
let insert = function(){
	frm.rDate.valueAsDate = new Date();
	// 현재 날짜를 rDate에 세팅해좋기
	$('#btnRegister').click(function(){
		
		let param = $('#frm').serialize();
		$.post('member_insert_result.jsp', param, function(data){
			$('#result').html(data);
			$('#mId').val('');
			$('#mName').val('');
			$('#grade').selectedIndex=0;
			$('#mId').focus();
			$('#result').addClass('result_ok');
		});
		
	});
	
	$('#btnList').click(function(){
			init();
	});
}

// 목록화면에서 항목을 클릭한 경우 상세보기로 이동
let view = function(mId){
	
	$.get('member_view.jsp', function(data) {
		$('#form').html(data);
		$('#result').html("");
		
		$.getJSON('member_get.jsp', "mId="+mId, function(json){
			frm.mId.value = json.mId;
			frm.mName.value = json.mName;
			frm.rDate.value = json.rDate;
			frm.grade.value = json.grade;
		});
		
		$('#btnList').click(function(){
			init();
		})
		
		$('#btnModify').click(function(){
			modify(mId);
		});
		
		$('#btnDelete').click(function(){
			let yn = confirm("정말 ???");
			if(yn){
				deleteF(mId);
				init();
			}else{
				$('#result').html("삭제가 취소됨....");
			}
		})
	});
	}

// 회원정보 수정화면에서 정보수정 버튼이 클릭된 경우
let update = function(){
	let param = $('#frm').serialize();

	$.ajax({
		url : 'member_modify_result.jsp',
		type : 'post',
		data : param,
		dataType : 'html',
		success : function(data){
			$('#result').html(data);
			$('#result').addClass('result_ok');
		}
	});
}

// 삭제버튼이 클릭된 경우
let deleteF = function(mId){
	let param = "mId=" + mId;
	
	$.post('member_delete_result.jsp', param, function(data) {
		$('#result').html(data);
	});
}

//상세보기 화면에서 수정 버튼이 클릭된 경우
let modify = function(mId){
	let param = 'mId=' + mId;
	console.log(param);
	
	$.ajax({
		url:'member_modify.jsp',
		type:'post',
		data:param,
		dataType : 'html',
		success : function(data){
			$('#form').html(data);
			$('#result').html('');
			
			$.getJSON('member_get.jsp', "mId="+mId, function(json){
				frm.mId.value = json.mId;
				frm.mName.value = json.mName;
				frm.rDate.value = json.rDate;
				frm.grade[json.grade-1].selected = true;
			});
			
			$('#btnUpdate').click(function(){
				$('#result').html("수정됨")
				update();
			})
			
			$('#btnList').click(function(){
				init();
			})
		}
	});
	
}