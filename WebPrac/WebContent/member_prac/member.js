
//메뉴에서 회원등록버튼 누르면 result div에 회원가입 폼 뿌려주기

//let xhr = new XMLHttpRequest();

/*
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
*/
if($('#menu1')!=null){
	$('#menu1').click(function(){
		$('#result').load('member_insert.jsp');
	})
}

if($('#menu2')!=null){
	$('#menu2').click(function(){
		$('#result').load('member_modify.jsp');
	})
}

if($('#menu3')!=null){
	$('#menu3').click(function(){
		$('#result').load('member_select.jsp');
	})
}


/*
let select = function(){
	let findStr = $('#findStr').val();
	xhr.open('get', 'member_select_result.jsp?findStr='+findStr);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			let json = JSON.parse(xhr.responseText);
			let data = '';
			for(d of json){
				data += "<div class='col-sm-2 text-center'>"+d.userId+"</div>"
						+"<div class='col-sm-2 text-center'>"+d.userPwd+"</div>"
						+"<div class='col-sm-2 text-center'>"+d.userName+"</div>"
						+"<div class='col-xs-3 text-center'>"+d.userGender+"</div>"
						+"<div class='col-sm-3 text-center'>"+d.userEmail+"</div>"
						+"<div class='col-sm-2 text-center'>"+d.enroll_date+"</div>";
			}
			$('#body').html(data);
		}
	}
}
*/
/*
let select = function(){
	let findStr = $('#findStr').val();
	$.getJSON('member_select_result.jsp?findStr='+findStr, function(json){
		let str = '';
		for(d of json){
			data += "<div class='col-sm-2 text-center'>"+d.userId+"</div>"
			+"<div class='col-sm-2 text-center'>"+d.userPwd+"</div>"
			+"<div class='col-sm-2 text-center'>"+d.userName+"</div>"
			+"<div class='col-xs-3 text-center'>"+d.userGender+"</div>"
			+"<div class='col-sm-3 text-center'>"+d.userEmail+"</div>"
			+"<div class='col-sm-2 text-center'>"+d.enroll_date+"</div>";
		}
		$('#body').html(data);
	});
}
*/

$('#findStr').on('keyup', function(){
	let findStr = $('#findStr').val().toLowerCase();
	$.getJSON('member_select_result.jsp?findStr='+findStr, function(json){
		let str = '';
		for(d of json){
			str += "<div class='col-sm-2 text-center'>"+d.userId+"</div>"
			+"<div class='col-sm-2 text-center'>"+d.userPwd+"</div>"
			+"<div class='col-sm-2 text-center'>"+d.userName+"</div>"
			+"<div class='col-xs-3 text-center'>"+d.userGender+"</div>"
			+"<div class='col-sm-3 text-center'>"+d.userEmail+"</div>"
			+"<div class='col-sm-2 text-center'>"+d.enroll_date+"</div>";
		}
		$('#body').html(str);
	});
})


