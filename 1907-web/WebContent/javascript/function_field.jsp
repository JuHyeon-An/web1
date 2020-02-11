<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function_field</title>
</head>
<body>
<script>
let student = {
	id : 'hong',
	irum : '홍길동',
	getId : function(){
		return this.id; //id를 리턴
	},
	getIrum : function(){
		return this.irum;
	},
	setId : function(id){
		this.id = id;
	},
	setIrum : function(n){
		this.irum = n;
	}
	
}; // map구조의 골격

	console.log('id : ', student.getId()); // getter 사용
	console.log('irum : ', student.getIrum());

	student.setId('kim');
	student.setIrum('김삿갓');
	
	console.log('id : ', student.getId()); // getter 사용
	console.log('irum : ', student.getIrum());

</script>
</body>
</html>