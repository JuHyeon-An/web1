<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_select_form</title>
<script src="../lib/jquery-3.4.1.js"></script>
</head>
<style>
*{
font-family:'빙그레 메로나체';
}

body {
	color:#ffffff;
    background-image:url('../images/starrynight.gif');
    background-size:100%;
    background-repeat: repeat-y;
    background-attachment: fixed;
    height:100%;
    width:100%;
	background-color:#282521;
}

#result{
width:600px;
height:400px;
border:1px solid white;
margin-top:10px;
overflow:auto;
border-radius:10px 10px 10px 10px;
padding:15px;
display:inline-block;}
.item>span, .header>span{
	display: inline-block;
}
.header{
margin-left:5px;
padding:10px;
margin-bottom:10px;
border-top:1px solid #fff;
border-bottom:1px solid #fff;
}
.header .dname{
margin-left:10px;
}
.id{ width: 50px;}
.fn{ width: 100px;}
.sal{ width: 90px;}
.did{ width: 70px;}
.dname{ width: 150px;}
.no{ width: 50px};

#btnFind{
background-color:#ff9000;
width:50px;
height:25px;
}

.item{
margin:3px;
}

/*
#photo{
border:1px solid white;
width:300px;
height:300px;
display:inline-block;
}
*/

.item:hover{
background-color:#444444;
cursor:pointer;
}

</style>
<body>
<h1>사원조회</h1>
<form name='frm' id='frm'>
  <input type="text" id="findStr"/>
  <input type="button" value="검색" id="btnFind"/>
</form>
<div id="result"></div>
<div id="photo"></div>
</body>
<script>
$('#frm').submit(function(){
	$('#btnFind').click();
	return false;
});
/* submit 이라는 이벤트 발생하면 return false 날려서 
 * 이벤트 중지시키고 그 전에 btnFind 클릭 이벤트를 발생시킴  */

let xhr = new XMLHttpRequest();

$('#btnFind').click(function(){
	let v = $('#findStr').val();
	let url = 'emp_select_result.jsp?findStr='+v;
	
	xhr.open('get', url);
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			let temp = xhr.responseText;
			let array = JSON.parse(temp);
			let str ="<div class='header'>"
				+"<span class='no'>No</span>"
				+"<span class='id'>사번</span>"
				+"<span class='fn'>성명</span>"
				+"<span class='sal'>급여</span>"
				+"<span class='did'>부서코드</span>"
				+"<span class='dname'>부서명</span>"
				+"</div>";
			i = 1;
			$(array).each(function(index){
			str += "<div class='item'>"
				+ "	 <span class='no'>" + i + "</span>"
				+ "  <span class='id'>" + array[index].eid + "</span>"
				+ "  <span class='fn'>" + array[index].fn + "</span>"
				+ "  <span class='sal'>" + array[index].salary + "</span>"
				+ "  <span class='did'>" + array[index].did + "</span>"
				+ "  <span class='dname'>" + array[index].dname + "</span>"
				+ "</div>";
				i++;
		});
		$('#result').html(str);
	};
};
$('#result>.item').click(function(){
	alert('클릭');
});
});


</script>
</html>