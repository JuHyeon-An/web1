/**
 * Product.js
 * data : 2020.02.25
 * 입고자료가 발생하면 자동으로 재고량을 증가시켜 출력하는 프로그램
 * (localStorage.setItem(key,v) / getItem(key) )
 */

var LocalStorage = require('node-localstorage').LocalStorage;
localStorage = new LocalStorage('./');

let products = []; // 입고자료
let stock = []; // 재고
let Data = function(code, codeName, ea, price){
	this.code = code;
	this.codeName = codeName;
	this.ea = ea;
	this.price = price;
	this.amt = this.ea * this.price;
};

let input = function(data){ // 입고자료를 배열에 저장한 후 코드에 해당하는 품목의 재고데이터에 누적 계산
	//let data2 = JSON.stringify(data);
	
	products.push(data);
	if(stock == null){
		stock.push(data);
	};
	
	let flag = true;
	
	for(s of stock){
		if(s.code == data.code){
			s.ea += data.ea;
			s.amt += data.amt;
			flag = false;
		}
	};
	if(flag){
		stock.push(data);
	}
};


let output = function(){ // 입고자료를 모두 출력
	console.log("-----products---------------");
	for (d of products){
	//let pro = JSON.parse(d);
	
	console.log("코드 : %s", d.code);
	console.log("제품명 : %s", d.codeName);
	console.log("수량 : %d", d.ea);
	console.log("단가 : %d", d.price);
	console.log("총액 : %d", d.amt);
	console.log("----------------------------");
	
	}
	
	console.log("-----stocks---------------");
	for (s of stock){
		//let stocks2 = JSON.parse(s);
		
		console.log("코드 : %s", s.code);
		console.log("제품명 : %s", s.codeName);
		console.log("수량 : %d", s.ea);
		console.log("단가 : %d", s.price);
		console.log("총액 : %d", s.amt);
		console.log("----------------------------");
		
		}
}

let save = function(){ // 배열을 문자열로(JSON) 변환하여 localStorage에 저장 
	
	for (d of products){
	let pro = JSON.stringify(d);
	localStorage.setItem('data', pro);
	};

	for ( s of stock){
	let st = JSON.stringify(s);
	localStorage.setItem('stock', st);
	};
};

//localStorage에 있는 값을 배열에 저장
let read = function(){
	
	let c = localStorage.getItem('data');
	for ( d of c ){
		products.push(d);
	}
	
};

let main = function(args){
		
		let p1 = new Data('code1', '새우깡', 1000, 700);
		let p2 = new Data('code1', '새우깡', 1000, 700);
		let p3 = new Data('code2', '감자깡', 1500, 300);
		let p4 = new Data('code3', '고구마깡', 3800, 200);
		let p5 = new Data('code4', '양파깡', 500, 2000);
		
		input(p1);
		input(p2);
		input(p3);
		input(p4);
		input(p5);
		
		save();
		output();
		read();
};

main();