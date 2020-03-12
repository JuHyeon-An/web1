<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_menu</title>
<script src="../lib/jquery-3.4.1.js"></script>
<style>
#menu{
	width:500px;
	box-sizing:border-box;
	padding:20px;
	text-align:center;
}
#menu>div{
	display:inline-block;
	float:left;
}
#menu span{
	display: block;
	width:100px;
	border:2px solid #555;
	text-align:center;
	padding:5px;
	box-sizing: border-box;
	transition : background 2s, color 1s;
}

#menu>div>div{
	display:none;
}
#menu div>li{
}

#menu li{
	list-style:none;
}
</style>
</head>
<body>
<h3>ani_menu</h3>
<p id='info'>메인 메뉴를 클릭하면 하위메뉴가 애니메이션 효과와 함께 보여지거나 사라지게 작업</p>
<div id='menu'>
<div id='menu1'>
	<span>메뉴</span>
	<div id='div1'>
	<li>서브메뉴1</li>
	<li>서브메뉴2</li>
	<li>서브메뉴3</li>
	<li>서브메뉴4</li>
	<li>서브메뉴5</li>
	</div>
</div>
<div id='menu2'>
	<span>메뉴2</span>
	<div>
	<li>서브메뉴1</li>
	<li>서브메뉴2</li>
	<li>서브메뉴3</li>
	<li>서브메뉴4</li>
	<li>서브메뉴5</li>
	</div>
</div>
<div id='menu3'>
	<span>메뉴3</span>
	<div>
	<li>서브메뉴1</li>
	<li>서브메뉴2</li>
	<li>서브메뉴3</li>
	<li>서브메뉴4</li>
	<li>서브메뉴5</li>
	</div>
</div>
<div id='menu4'>
	<span>메뉴4</span>
	<div>
	<li>서브메뉴1</li>
	<li>서브메뉴2</li>
	<li>서브메뉴3</li>
	<li>서브메뉴4</li>
	<li>서브메뉴5</li>
	</div>
</div>
</div>
<script>

	
  $('#menu1').click(function(){
	  $('#div1', this).slideToggle(1000);
  });

  $('#menu2').click(function(){
	  $('div', this).slideToggle(1000);
  });

  $('#menu3').click(function(){
	  $('div', this).slideToggle(1000);
  });
  $('#menu4').click(function(){
	  $('div', this).slideToggle(1000);
  });
  
</script>

</body>
</html>