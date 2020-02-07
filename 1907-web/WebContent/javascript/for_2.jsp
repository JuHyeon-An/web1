<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for_2</title>

<style>

body{
  font-family:'배달의민족 을지로체 TTF';
  background-color:#FFF4EE;
}

#result div{
  margin:10px;
}

#result>div:nth-of-type(2n){
  background-color:#F4E8FF;
}

#result>div:nth-of-type(2n-1){
  background-color:#F5EADC;
  border-bottom:6px double #F5EADC;
}

#result{
  border: 2px groove black;
  height:400px;
  width:400px;
  overflow:auto;
  line-height:25px;
  font-size:20px;
  padding:10px;
}

</style>

</head>
<body>
<h1>for 응용 예제 - 구구단 출력하기</h1>

<div id='result'></div>

<script>
  let r = document.getElementById('result');
  let str = '';
  
  for(i=2; i<10; i++){
	  str += '<div>';
	  for(j=1; j<10; j++){
		  str += i + ' x ' + j + ' = ' + (i*j) + '<br/>';
	  }
		str += '</div>' + '<hr/>';
  }
 r.innerHTML = str;
  
</script>

</body>
</html>