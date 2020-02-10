<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for_in_2</title>
</head>
<body>
<h3>for_in | for_of (II)</h3>
<form name='frm'>
  <label><input type='checkbox' name='chk' value='강아지'>강아지</label>
  <label><input type='checkbox' name='chk' value='송아지'>송아지</label>
  <label><input type='checkbox' name='chk' value='망아지'>망아지</label>
  <label><input type='checkbox' name='chk' value='그아지'>그아지</label>

  <p/>
  <input type='button' value='FOR-IN' name='forIn'>
  <input type='button' value='FOR-OF' name='forOf'>
</form>
<script>
frm.forIn.onclick = function(){
	console.log('----------for in------------')
	for(x in frm.chk){
		console.log(x + ' : ' + frm.chk[x]);
	}
}
frm.forOf.onclick = function(){
	console.log('----------for of------------')
	for(x of frm.chk){
		console.log(x.value);
	}
}
</script>


</body>
</html>