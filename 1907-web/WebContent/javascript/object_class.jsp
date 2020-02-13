<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object_class</title>
</head>
<body>
<h3>class를 사용한 객체 생성</h3>
<script>
class Member{
	constructor(id, name, phone){
		this.id = id;
		this.name = name;
		this.phone = phone;
	}

	setId(id) { this.id = id;}
	setName(name) { this.name = name;}
	setPhone(phone) { this.phone = phone;}
	
	getId(){ return this.id;}
	getName() { return this.name;}
	getPhone() { return this.phone;}

	toString(){
		let str = this.id +' | '+ this.name +' | '+ this.phone;
		return str;
	}
	
	toJSON(){
		let str = {
				"id" : this.id,
				"name" : this.name,
				"phone" : this.phone
		}
		return str;
	}
	
	toHTML(){
		let str = 
		`<div>
			<span>\${this.id}</span>
			<span>\${this.name}</span>
			<span>\${this.phone}</span>
		</div>`;
		return str;
	}
}// end of Member
	let array = [];

	let m1 = new Member('a001', 'hong', '010-1234-1234');
	let m2 = new Member('a002', 'kim', '010-2222-2222');
	let m3 = new Member();
	
	m3.setId('a003');
	m3.setName('an');
	m3.setPhone('010-1111-1111');
	
	array.push(m1);
	array.push(m2);
	array.push(m3);
	array.push( new Member('a004', 'lee', '010-3333-3333') );
	
	console.log('toString()---------');
	for(v of array){
		console.log(v.toString());
	}
	console.log('toJSON()---------');
	for(v of array){
		console.log(v.toJSON());
	}
	console.log('toHTML()---------');
	for(v of array){
		console.log(v.toHTML());
	}

</script>

</body>
</html>