<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_param</title>
</head>
<body>
<h3>el param</h3>
<form name='frm' method='post'>
  <label>id</label>
  <input type='text' name='id' value='${param.id}'><br/>
  <label>password</label>
  <input type='text' name='pwd' value='${param.pwd }'><br/>
  <label>hobby</label>
  <label><input type='checkbox' name='hobby' value='축구'>축구</label>
  <label><input type='checkbox' name='hobby' value='야구'>야구</label>
  <label><input type='checkbox' name='hobby' value='농구'>농구</label>
  <label><input type='checkbox' name='hobby' value='배구'>배구</label>
  <p/>
  <input type='submit' value='RUN'/>
</form>
<p/>
<script>
  frm.hobby[0].checked=${paramValues.hobby[0]=='축구'? true : false};
  // 첫번째값이 축구면 true, 아니면 false
  // true:값을 선택, false:선택된 값이 해제됨

  
</script>
hobby  : ${paramValues.hobby}
</body>
</html>