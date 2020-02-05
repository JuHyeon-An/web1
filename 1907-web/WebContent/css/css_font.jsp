<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_font</title>
<style>
#font_size>#px{
  font-size:33px;
}
#font_size>#em{
  font-size:1em;
}
#font_size>#per{
  font-size:300%;
}
#line_height{
  border:2px solid #0000ff;
  padding:10px;
  box-sizing : border-box;
  width:200px;
  line-height:2em;
  letter-spacing:2px;
}

#text_overflow>div{
  white-space:nowrap;
  border:2px solid #000;
  width:200px;
  margin-top:10px;
}

#text_overflow>#div1{
  text-overflow: ellipsis;
   overflow:hidden;
}

#text_overflow>#div2{
  text-overflow:clip;
   overflow:hidden;
}

#text_overflow>#div3{
  overflow:auto;  
}

#text_overflow>#div5{
  white-space:normal;
}

#text_shadow{
  font-size:5em;
  font-weight:bold;
  text-shadow: 6px 6px 4px #aaa;
}

</style>
</head>
<body>
<h3>font</h3>
<div id='font_size'>
	<div>기본크기 123 abc</div>
	<div id='px'>PX 123 가나다</div>
	<div id='em'>EM 123 가나다</div>
	<div id='per'>% 123 가나다</div>
</div>

<div id='line_height'>
  줄간격 테스트 123 abc 줄간격 테스트 123 abc
  줄간격 테스트 123 abc 줄간격 테스트 123 abc
  줄간격 테스트 123 abc 줄간격 테스트 123 abc
</div>

<div id='text_overflow'>
  <div id='div1'>매우 매우 긴 문자열이 들어 있는 제목입니다.</div>
  <div id='div2'>매우 매우 긴 문자열이 들어 있는 제목입니다.</div>
  <div id='div3'>매우 매우 긴 문자열이 들어 있는 제목입니다.</div>
  <div id='div4'>매우 매우 긴 문자열이 들어 있는 제목입니다.</div>
  <div id='div5'>매우 매우 긴 문자열이 들어 있는 제목입니다.</div>
</div>

<div id='text_shadow'> 1907기 화이팅!!!@!!</div>

</body>
</html>





