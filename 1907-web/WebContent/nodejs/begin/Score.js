/**
 * Score.js
 */
let array = [];

let Data = function(name, kor, eng){ //Vo 객체와 유사한 기능
	this.name = name;
	this.kor = kor;
	this.eng = eng;
	this.tot = this.kor + this.eng;
	this.avg = this.tot/2;
};

let input = function(data){ //자바에서는 function (Data data)
	let temp = JSON.stringify(data); // 오브젝트를 json타입의 구조를 가진 문자열로.
	array.push(temp);
}

let output = function(){
	for(d of array){
		let temp = JSON.parse(d); // json타입의 구조를 가지고 있는 문자열을 object로 바꿔줌
		console.log('name : %s', temp.name);
		console.log('kor : %d', temp.kor);
		console.log('eng : %d', temp.eng);
		console.log('tot : %d', temp.tot);
		console.log('avg : %f', temp.avg);
		console.log('-------------------------');
	};
};

let main = function(args){ // public static void main(String[] arg) 의 역할로 생각할 수 있음
	let d1 = new Data('hong', 96, 82);
	let d2 = new Data('park', 71, 55);
	let d3 = new Data('kim', 23, 83);

	input(d1);
	input(d2);
	input(d3);
	
	output();
}
