<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_complete</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
*{
font-family:'나눔바른고딕';
font-size:15px;
}

#findStr{
width:200px;
}
#sel{
width:204px;
}
h3{
font-size:25px;
}
.sel{
display:none;
}

</style>
</head>
<body>
<h3>사원정보 조회 (자동완성 기능)</h3>
<form name='frm' id='frm'>
  <input type='text' name='findStr' id='findStr' value='a' tabindex='10'>
  <input type='button' value='검색' name='btn' id='btn'>
  <br/>
  
  <select name='sel' id='sel' size='20' tabindex='11'>
  
  </select>
</form>
<script>
$('#btn').click(function(){
	$('#findStr').keyup();
});

/*
$('#findStr').keyup(function(){
	let param = $('#frm').serialize();
	$.ajax({
		url  	 : 'emp_complete_result.jsp',
		type 	 : 'get',
		data 	 : param,
		dataType : 'html',
		success  : function(data){
			$('#sel').html(data);
		}
	});
});
*/

$('#findStr').keyup(function(){
	let param = $('#frm').serialize();
	$.getJSON('emp_select_result.jsp', param, function(json){
		// emp_select_result 의 결과를 json에 던져준다
		frm.sel.length=0;
		if(json.length>0){
			// 값이 있으면 드롭다운 리스트가 나타나고
			$('#sel').removeClass();
		}else{
			// 값이 없으면 sel 클래스가 추가되는데, sel은 display->none
			$('#sel').addClass('sel');
		}
		for(i=0; i<json.length; i++){
			let d = json[i];
			let op = new Option(d.eid + "(" + d.fn + ")", d.fn);
			frm.sel.options[i] = op;
		}
		frm.sel.selectedIndex=0;
	});
});

$('#sel').dblclick(function(){
	let temp = $(this).val();
	$('#findStr').val(temp);
});

</script>
</body>
</html>