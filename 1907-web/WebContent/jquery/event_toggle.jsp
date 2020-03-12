<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_toggle</title>
<script src="../lib/jquery-3.4.1.js"></script>
<h3>event toggle</h3>
</head>
<body>
<button id="btnToggle">Toggle</button>
<button id="btnSlide">Slide</button>
<button id="btnFade">Fade</button>
<p/>
<div id="result">
	<img src="../images/beach.jpg"/>
	<img src="../images/candy.png"/>
	</div>

<script>
  $('#btnToggle').on('click',function(){
	 $('#result').toggle(3000); 
  });
  // toggle은 진행방향이 대각선
  
  $('#btnSlide').on('click', function(){
	 $('#result').slideToggle(3000);	  
  });
  
  $('#btnFade').on('click', function(){
	  $('#result').fadeToggle(3000);
  });
</script>
</body>
</html>