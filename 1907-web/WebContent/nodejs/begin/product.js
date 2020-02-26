/**
 * Product.js
 * data : 2020.02.25
 * 입고자료가 발생하면 자동으로 재고량을 증가시켜 출력하는 프로그램
 * (localStorage.setItem(key,v) / getItem(key) )
 */

// npm install node-localstorage 명령 사용해서 외부 모듈 설치 필요
// require -> 일종의 import 기능
var LocalStorage = require('node-localstorage').LocalStorage;
localStorage = new LocalStorage('./');

var products = []; // 입고자료 : 발생된 데이터 저장
var stock = []; // 재고 : 동일한 코드 들어왔을때 기존에 코드가 있으면 기존에 증가, 없으면 새로 추가

var Data = function(code, codeName, ea, price){
	this.code = code;
	this.codeName = codeName;
	this.ea = ea;
	this.price = price;
	this.amt = ea * price;
};

var input = function(data){ // 입고자료를 배열에 저장한 후 코드에 해당하는 품목의 재고데이터에 누적 계산
	//let data2 = JSON.stringify(data);
	
	products.push(data);
	// products는 '입고' 이벤트 발생하면 무조건 추가
	
	let flag = true;
	// true -> stock에 추가, false-> stock에 갱신
	for(s of stock){
		if(s.code == data.code){
			s.ea = Number(s.ea) + Number(data.ea);
			s.amt = Number(s.amt) + Number(data.amt);
			flag = false;
		}
	};
	if(flag){
		let sData = new Data(data.code, data.codeName, data.ea, data.price);
		stock.push(sData);
	}
};

var output = function(){ // 입고자료를 모두 출력
	console.log("-----products---------------");
	for (var d of products){
	
	console.log('%s \t %s \t %s \t %s \t %s', d.code, d.codeName,
			d.ea.toLocaleString('en'), d.price.toLocaleString('en'),
			d.amt.toLocaleString('en'));
	
	}
	
	console.log("-----stocks---------------");
	for (var s of stock){
		//let stocks2 = JSON.parse(s);
		
		console.log('%s \t %s \t %s \t %s \t %s', s.code, s.codeName,
				s.ea.toLocaleString('en'), s.price.toLocaleString('en'),
				s.amt.toLocaleString('en'));
		}
}

var save = function(){ // 배열을 문자열로(JSON) 변환하여 localStorage에 저장 
	
	let tempP = JSON.stringify(products);
	let tempS = JSON.stringify(stock);
	
	localStorage.setItem('products', tempP);
	localStorage.setItem('stock', tempS);
};

//localStorage에 있는 값을 배열에 저장
var read = function(){
	
	let tempP = localStorage.getItem('products');
	let tempS = localStorage.getItem('stock');
	
	products = JSON.parse(tempP);
	stock = JSON.parse(tempS);
};

var main = function(args){
		
		let p1 = new Data('code1', '새우깡', 2000, 500); // stock에 새로 추가
		let p2 = new Data('code1', '새우깡', 1000, 700); // stock에 갱신 (수량, 가격 더해서)
		let p3 = new Data('code2', '감자깡', 1500, 300);
		let p4 = new Data('code3', '고구마깡', 3800, 200);
		let p5 = new Data('code4', '양파깡', 500, 2000);
		
		input(p1);
		input(p2);
		input(p3);
		input(p4);
		input(p5);
		
		save();
		read();
		output();
};

main();