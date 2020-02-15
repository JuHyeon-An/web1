<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Anchor</title>
</head>
<body>
<fieldset>
<legend><h2> <font face = '배달의민족 도현'> 새 페이지에 링크 연결 </font></h2></legend>
<a href='http://www.jobtc.kr'> 우리카페 </a><br/>
<a href='http://www.naver.com'> 네이버 </a><br/>
<a href='http://192.168.0.20:8888/1907-web/html5/anchor.jsp'> 환영 </a><br/>
</fieldset>

<fieldset>
<legend><h2> <font face = '배달의민족 도현'> 새 페이지 (탭)에 링크 연결 </font></h2></legend>
<a href='http://www.jobtc.kr' target='_blank'> 우리카페 </a><br/>
<a href='http://www.naver.com' target='_blank'> 네이버 </a><br/>
<a href='http://192.168.0.26:8888/1907-web/html5/anchor.jsp' target='_blank'> ㅎㅇ </a><br/>
</fieldset>

<fieldset>
<legend><h2><font face = '배달의민족 도현'> 특정 브라우저(프레임)에 링크걸기 </font></h2></legend>
<a href='http://www.jobtc.kr' target='sub_page'> 우리카페 </a><br/>
<a href='http://www.naver.com' target='sub_page'> 네이버 </a><br/>
<a href='http://192.168.0.28:8888/1907-web/html5/anchor.jsp' target='sub_page'> ㅂㅇ </a><br/>
</fieldset>

<div id='메인'>
<fieldset>
<legend><h2><font face = '배달의민족 도현'> 책갈피 </font></h2></legend>
<a href='#1장'>1장</a>
<a href='#2장'>2장</a>
<a href='#3장'>3장</a>
<a href='#4장'>4장</a>
<a href='#5장'>5장</a>
<a href='http://192.168.0.26:8888/1907-web/html5/anchor.jsp#2장' target='sub_page'>누굴까요</a>
</fieldset>
</div>

<h2><font face = '배달의민족 도현'> iframe에 연결 </font></h2>

<a href='http://www.jobtc.kr' target='my_frame'> 우리카페 </a><br/>
<a href='http://www.nate.com' target='my_frame'> 네이트 </a><br/>
<a href='http://192.168.0.30:8888/1907-web/html5/anchor.jsp' target='my_frame'> 클릭  </a><br/>	
<a href='font.jsp' target='my_frame'>font test</a><br/>
<a href='paragraph.jsp' target='my_frame'>paragraph test</a><br/>



<iframe width='800px' height='700px' name='my_frame'
		style='border:1px solid #0000ff'>
</iframe>	

<br/>

<h2><font face = '배달의민족 도현'> file download </font></h2>
<img src='../images/쉿.jpg'><br/>
<a href='../images/쉿.jpg'><font size = '6' color = '#ca9deb' face = '배달의민족 도현'>필연이 조용</font></a><br/>
<a href='../images/beach.jpg' download='shutup.jpg'>이미지 다운로드</a>

<hr/>

<div id='1장'></div>
여기는 1장입니다.<br/><a href='#메인'>메인으로 가기</a>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/></div>

<div id='2장'></div>
여기는 2장입니다.<br/><a href='#메인'>메인으로 가기</a>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
</div>

<div id='3장'></div>
여기는 3장입니다.<br/><a href='#메인'>메인으로 가기</a><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></div>

<div id='4장'></div>
여기는 4장입니다.<br/><a href='#메인'>메인으로 가기</a><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></div>

<div id='5장'></div>
여기는 5장입니다.<br/><a href='#메인'>메인으로 가기</a><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></div>

</body>
</html>