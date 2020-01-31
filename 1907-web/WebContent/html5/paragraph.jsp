<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문단모양</title>
</head>
<body>
	<h2>span</h2>
	<span>가나다</span>
	<span>abc</span>
	<span>123</span>

	<label>가나다</label>
	<label>abc</label>
	<label>123</label>
	<h2>p</h2>
	<p>가나다</p>
	<p>abc</p>
	<p>123</p>
	<h3>div & align</h3>
	<div align='left'>가나다</div>
	<div align='center'>abc</div>
	<div align='right'>123</div>

	<h3>pre</h3>
	<pre>
	가나다
		abc
			<font color='red'>123</font>
</pre>

	<h3>xmp</h3>
	<xmp>
	가나다 
		abc 
			<font color='red'>123</font> </xmp>
<hr/>
<hr width='500px'/>
<hr width='500px' size='20'/>
<hr width='500px' size='20' align='center'/>
<hr width='500px' size='50' noshade/>
<h3> blockquote </h3>
주제<br/>
<blockquote>이곳은 <br/> 들여쓰기된 <br/>내용입니다.</blockquote>

<h3>fieldset</h3>

<fieldset>
	<legend>첫번째 모양</legend>
	이곳은 내용
</fieldset>

<fieldset>
	<legend align='center'>두번째 모양</legend>
	이곳은 내용
</fieldset>

</body>
</html>