/**
 * module_member.js
 * member.js에서 쓸 모듈
 * date : 2020.02.26
 */
let exp={};
exp.member = [];

exp.Data = function(id, name, phone, address){
	this.id = id;
	this.name = name;
	this.phone = phone;
	this.address = address;
}

exp.input = function(data){
	exp.member.push(data);
	console.log(exp.member);
}

exp.output = function(){
	for(d of exp.member){
		console.log('%s \t %s \t %s \t %s', d.id, d.name, d.phone, d.address);
	}
}

exp.select = function(id){
	for(a of exp.member){
		if(a.id == id){
			console.log(id,'님');
			console.log('%s \t %s \t %s \t %s', a.id, a.name, a.phone, a.address);
			console.log('-----------------------');
		}
	}
}

module.exports = exp;