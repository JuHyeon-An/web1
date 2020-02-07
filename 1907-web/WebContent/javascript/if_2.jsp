<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if_2</title>
<style>
#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 6px #999;
}
form{
  margin-left:30px;
}
</style>
</head>
<body>
<h3>if(II)</h3>
<p id='info'>
  	정수 하나를 입력받아 90 이상이면 '전액 장학생' 70 이상이면 '반액 장학생'
  	70 미만이면 '전액 납부'가 있는 라디오 버튼의 상태값을 변경하시오.
</p>
<form name='frm'>
  <label>정수</label>
  <input type='search' name='su' value='90'/>
  <input type='button' value='RUN' name='btn'/>
  <hr/>
  <label><input type='radio' name='chk' value='전액장학생'>전액장학생</label>
  <label><input type='radio' name='chk' value='반액장학생'>반액장학생</label>
  <label><input type='radio' name='chk' value='전액납부'>전액납부</label>
</form>
<script>
  frm.btn.onclick=function(){
	  let score = Number(frm.su.value);
	  if(score>=90){
		  frm.chk[0].checked = true;
	  }else if(score>=70){
		  frm.chk[1].checked = true;
	  }else if(score<70){
		  frm.chk[2].checked = true;
	  }
  }
</script>

</body>
</html>