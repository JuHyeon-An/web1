<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>append</title>
<script src="../lib/jquery-3.4.1.js"></script>
</head>
<body>
<button>click</button>
<button id='btn'>clear</button>
<div></div>
<div></div>
<div></div>

<script>
let content = [
	{name:'안주현', region:'서울'},
	{name:'최윤희', region:'청주'},
	{name:'박짱아', region:'서울'}
];
//맵구조로 배열선언

$('button').on('click',function(){
	$('<h1></h1>').html('hello world').appendTo('body');
	$('div').append(function(index){
		output='';
		item = content[index];
		output += item.name+' | '+item.region;
		return output;
	}); //end of append
});//end of button event

$('#btn').click(function(){
	$('div').empty();
});
//clear 버튼 누르면 div 비워주는 작업


</script>
</body>
</html>