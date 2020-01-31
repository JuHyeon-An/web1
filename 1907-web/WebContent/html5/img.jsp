<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지</title>
</head>
<body>
<h2><font face = '나눔스퀘어라운드' color = '#f59274'> 이미지 경로를 절대 | 상대 경로지정</font></h2>
<img src='../images/beach.jpg'><br/>
<img src='/1907-web/images/소라게.gif'><br/>

<h2><font face = '나눔스퀘어라운드' color = '#f3a9a9'> 이미지 표시 사이즈 변경 </font></h2>
<img src='../images/쉿.jpg' width='100px'>
<img src='../images/flower.jpg' width='50%'>
<img src='../images/flower2.jpg' width='120px' height='200px'>

<h2><font face = '나눔스퀘어라운드' color = '#f38c8c'> 문자와 이미지의 배치 </font></h2>
<p>

	<img src='../images/beach.jpg' align='left'>
	align='left'속성은 이미지가 문자의 왼쪽에 배치된다는 의미임.
</p>
<br/><br/><br/><br/><br/><br/><br/><br/>
<p>
	<img src='../images/beach.jpg' align='right'>
	align='right'속성은 이미지가 문자의 오른쪽에 배치된다는 의미임.
</p>
<br/><br/><br/><br/><br/><br/><br/><br/>
<p>
	<img src='../images/beach.jpg' align='left' hspace='50px'>
	horizontal space (좌우여백) 50px
</p>
<br/><br/><br/><br/><br/><br/><br/><br/>
<h2><font face = '나눔스퀘어라운드' color = '#f38c8c'> use map </font></h2>
<img src='../images/아이콘.jpg' usemap = '#usemap_image'>

<map name='usemap_image'>
	<area shape='rect' coords = '0, 0, 190, 220' title='폰트 연습페이지' href='font.jsp'/>
	<area shape='rect' coords = '0, 220, 190, 400' title='문단 연습페이지' href='paragraph.jsp'/>
	<area shape='rect' coords = '0, 420, 190, 600' title='앵커 연습 페이지' href='anchor.jsp'/>
</map>

</body>
</html>