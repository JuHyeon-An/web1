<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>navigator</title>
</head>
<body>
<h3>navigator</h3>
<input type='button' value='모바일 페이지로 이동'id='btn'/>
<script>
  let userAgent = navigator.userAgent;
  console.log('agent : ', userAgent);
  
  let btn = document.getElementById('btn');
  // form 의 name 없이 btn에 접근하는 방법
  
  btn.onclick = function(){
	let sp = ['iphone', 'ipad', 'android'];
	for( i in sp ){
		if(userAgent.toLowerCase().match(new RegExp(sp[i]))){
			alert('모바일 페이지로 이동...');
			location.href='m.naver.com';
		}
	}
  }
</script>
</body>
</html>