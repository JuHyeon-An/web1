<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image_preview</title>
</head>
<body>
<h3>image preview</h3>
<input type='file' value='사진' id='btnFile'/>
<img width='200px' height='300px' id='target'/>

<script>
  let btn = document.querySelector('#btnFile');
  btn.onchange = function(b){
	  let ele = b.srcElement;
	  // btnFile 태그
	  
	  console.log('srcElement', ele);
	  console.log('value : ', ele.value);
	  
	  let url = ele.files[0];
	  // 타입이 파일인 파일버튼이 가지고있는 태그가 가지고 있는 파일
	  
	  //files의 배열값 선택하면 해당 파일의 경로가 떨어짐
	  let reader = new FileReader();
	  //반드시 필요한 객체 filereader
	  reader.readAsDataURL(url);
	  // 리더에 URL 패턴으로 들어온 파일을 읽어라
	  
	  reader.onload = function(ev){
	  // 읽기가 다 끝나면, 파일을 다 읽으면.
	    let img = new Image();
	    img.src = ev.target.result;
		// 실제로 읽혀진 파일
		document.getElementById('target').src = img.src;
		  
	  }
  }
  
</script>

</body>
</html>