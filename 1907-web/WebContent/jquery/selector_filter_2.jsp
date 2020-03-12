<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector_filter_2</title>
<script src = '../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>filter</h3>
<p id='info'>
  option을 선택한 후 5초가 지나면 선택된 항목이 alert창으로 표시됨.
</p>
<select>
  <option>apple</option>
  <option>bag</option>
  <option>cat</option>
  <option>dog</option>
  <option>elephant</option>
</select>
<script>
  $(function(){
	  setTimeout(function(){
		  let value = $('select > option:selected').val();
	      alert(value);
	      
	  },3000);
  })
</script>
</body>
</html>

