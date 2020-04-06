<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>table 연습</title>
</head>
<body>
<h4>기본구조</h4>
<table border='1'>
  <tr>
  	<td>
  	<select>
  	<option>1</option>
  	<option>2</option>
  	</select>
  	</td>
  	<td>2</td>
  	<td>3</td>
  </tr>
  <tr>
  	<td>4</td>
  	<td>5</td>
  	<td>6</td>
  </tr>
</table>
<h4>넓이|높이 지정</h4>
<table border='1' width='300px' height='150px' align='center'>
  <tr align='center'>
  	<td>1</td>
  	<td>2</td>
  	<td>3</td>
  </tr>
  <tr>
  	<td>4</td>
  	<td align='right'>5</td>
  	<td>6</td>
  </tr>
</table>

<h4>회원명단</h4>
<table border='1' width='400px'>
  <tr bgcolor='#ccc'>
    <td>번호</td>
    <td>성명</td>
    <td>연락처</td>
  </tr>

  <tr>
    <td>1</td>
    <td>hong</td>
    <td>010-1111-1111</td>
  </tr>
</table>

<h4>테이블헤더</h4>
<table width='400px' border='1' cellspacing='0px'>
  <tr bgcolor='#ca9deb'>
    <th>번호</th>
    <th>성명</th>
    <th>연락처</th>
  </tr>
  <tr>
    <td>1</td>
    <td>hong</td>
    <td>010-4110-4511</td>
</table>

<h4>셀의 여백지정</h4>
<table border='1' cellpadding='30px' cellspacing='10px'>
  <tr>
    <td>A</td>
    <td>B</td>
  </tr>
  
  <tr>
  	<td>C</td>
  	<td>D</td>
  </tr>
</table>

<h4>셀 병합 (열 병합) </h4>
<table border='1' width='300px' cellspacing='0px'>
  <tr>
    <td>A</td>
    <td>B</td>
    <td colspan='2'>C</td>
  </tr>
  
  <tr>
  	<td>D</td>
  	<td>E</td>
  	<td>F</td>
  	<td>G</td>
  </tr>
  
  <tr>
  	<td>H</td>
  	<td>I</td>
  	<td colspan='2'>J</td>
  </tr>
  
  <tr>
  	<td colspan='4'>KLMN</td>
  </tr>
  
</table>
<br/>
<h4>셀 병합 (행 병합)</h4>
<table border='1' cellspacing='0' width='300px'>
  <tr>
  	<td>A</td>
  	<td>B</td>
  	<td>C</td>
  	<td rowspan='4'>D</td>
  </tr>
  <tr>
  	<td>E</td>
  	<td>F</td>
  	<td>G</td>
  </tr>
  <tr>
  	<td>H</td>
  	<td>I</td>
  	<td>J</td>
  </tr>
  <tr>
  	<td>K</td>
  	<td>L</td>
  	<td>M</td>
  </tr>
  </table>

<h4>frame:above</h4>
<table frame='above'>
  <tr>
    <td>A</td>
    <td>B</td>
    <td>C</td>
  </tr>
  <tr>
    <td>A</td>
    <td>B</td>
    <td>C</td>
  </tr>
</table>


<h4>frame:hsides</h4>
<table frame='hsides'>
  <tr>
    <td>A</td>
    <td>B</td>
    <td>C</td>
  </tr>
  <tr>
    <td>A</td>
    <td>B</td>
    <td>C</td>
  </tr>
</table>


<h4>frame:vsides</h4>
<table frame='vsides'>
  <tr>
    <td>A</td>
    <td>B</td>
    <td>C</td>
  </tr>
  <tr>
    <td>A</td>
    <td>B</td>
    <td>C</td>
  </tr>
</table>

</body>
</html>