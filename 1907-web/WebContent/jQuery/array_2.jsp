<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array_2</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>배열사용(II)</h3>
<form name='frm'>
  <label>취미</label>
  <label><input type='checkbox' checked name='hobby' value='축구'>축구</label>
  <label><input type='checkbox' name='hobby' value='야구'>야구</label>
  <label><input type='checkbox' checked name='hobby' value='농구'>농구</label>
  <label><input type='checkbox' name='hobby' value='배구'>배구</label>
  <label><input type='checkbox' name='hobby' value='탁구'>탁구</label>
  <p/>
  <input type='button' value='실행' name='btn'/>
</form>
<script>
// frm.btn.onclick = function(){}
$('[name=btn]').on('click', function(){
	$('[type=checkbox]').each(function(index, item){
	  if(item.checked){
		console.log(index + ' : '+item.value);
	  }
	});	
});
</script>
</body>
</html>