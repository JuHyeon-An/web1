<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array_extend</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<script>
let obj = { name : '길동이'};

//$.extend를 사용한 요소추가
$.extend(obj, { age : 18 , kor : 90, eng : 60, mat : 80});

$(obj).each(function(index, item){
	console.log(index + ' : '+item.name+', '+item.age+', '+item.kor+', '+item.eng+', '+item.mat);
	console.log(obj);
});

$.each(obj, function(key, item){
	console.log(key + ' : ' + item);
})
</script>
</body>
</html>