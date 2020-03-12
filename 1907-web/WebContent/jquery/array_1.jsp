<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array-1</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3></h3>
<p id='info'>
    <li>$.each(function(index, item){ ... }) </li>
    <li>$(selector).each(function(index, item){ ... } )</li>
</p>
<script>
$(document).ready(function(){
	let array1 =[34,45,5,684,45,9,567,7,6,4,62,12,3,23,52];
	let array2 = [
		{name : 'hong'  , age:18  , score : 90},
		{name : 'kim'   , age:28  , score : 60},
		{name : 'lee'   , age:38  , score : 70},
		{name : 'choi'  , age:48  , score : 30},
		{name : 'park'  , age:58  , score : 80}
	];
	
	//array1에서 100보다 큰수만
	$(array1).each(function(index, item){
		if(item>100){
			console.log(index + ' : ' + item);
		}
	});
	
	//array2에서는 score>=60인 자료만 출력
	$(array2).each(function(index, item){
		if(item.score>=60){
			console.log(item.name + ' , ' + item.age +', '+item.score);
		}
	})
	
});

</script>


</body>
</html>