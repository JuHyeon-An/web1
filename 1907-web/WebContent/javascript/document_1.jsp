<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>document_1</title>
</head>
<body>
<h3>document(I)</h3>
<script>
  // headline1
  function first(){ 
	  let header = document.createElement('h1');
	  let textNode = document.createTextNode('Hello DOM');
	  
	  header.appendChild(textNode);
	  document.body.appendChild(header);
  }
  first();
  //onload 대신에 이렇게 호출
  // 통합페이지, 단일페이지 상관없이 호출
  
  //button
  let btn = document.createElement('input');
  btn.setAttribute('type', 'button');
  btn.setAttribute('value', '버튼');
  btn.setAttribute('id', 'btn');
  btn.style.width='200px';
  btn.style.height='80px';
  
  document.body.appendChild(btn);
  let b = document.getElementById('btn');
  
  b.onclick=function(){
	  alert('버튼클릭');
  }
  
  //text box(input type='text')
  let inputBox = document.createElement('input');
  inputBox.setAttribute('type', 'text');
  inputBox.setAttribute('value', '텍스트를 입력하세요');
  inputBox.setAttribute('id', 'txt');
  
  document.body.appendChild(inputBox);
  let t = document.getElementById('txt');
  
  t.onclick=function(){
	  txt.value = '';
  }
  
  
  //br
  let br = document.createElement('br');
  document.body.appendChild(br);
  document.body.appendChild(inputBox);
  
</script>
</body>
</html>