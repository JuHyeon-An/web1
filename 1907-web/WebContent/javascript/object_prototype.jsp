<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object_prototype</title>
<style>
body{
  font-family : '배달의민족 을지로체 TTF';
  font-size : 18px;
}

#result{
  border : 2px solid black;
  padding : 10px;
    width:60%;
  
}

#title{
  margin-top : 20px;
  padding : 3px;
  background-color:#888;
  color:#fff;
  box-sizing:border-box;
  height:20px;
  text-align : left;
}
#result2{
  width:60%;
}

#result2 span {display : inline-block;
text-align : center;}

#result2 .items:hover{
  background-color:#ddd;
  cursor:pointer;
}
#result2 div:last-child{ border-bottom : 4px solid #aaf}
.code{
  width : 80px;
  margin-left : 8px;
}
.codeName{
  width : 130px;
}
.ea{
  width:80px;
}
.price{
  width:100px;
}
</style>

</head>
<body>
<h3>prototype</h3>
<div id='result'></div>
<div id='result2'>
<div id='title'>
<span class = 'code'>제품코드</span>
<span class = 'codeName'>제품명</span>
<span class = 'ea'>수량</span>
<span class = 'price'>단가</span>
</div>
</div>


<script>

let r2 = document.getElementById('result2');
let r = document.getElementById('result');

function Product(code, codeName, ea, price){
  this.code = code;
  this.codeName = codeName;
  this.ea = ea;
  this.price = price;
}

//Product로 만들어진 객체들이 사용하는 공유 메소드
Product.prototype.setCode = function(code){	this.code = code;}
Product.prototype.setCodeName = function(codeName){	this.codeName = codeName;}
Product.prototype.setEa = function(ea) {this.ea = ea};
Product.prototype.setPrice = function(price) {this.price = price};

Product.prototype.toJSON = function(){
	let str = {'code' : this.code,
			   'codeName' : this.codeName,
			   'ea' : this.ea,
			   'price' : this.price};
			   
	return str;
	}
	
	
Product.prototype.toJSON2 = function(){
	/* backtick 사용 => 전체가 문자열로 넘겨진다 */
	let str = `{"code" : "\${this.code}",
			   "codeName" : "\${this.codeName}",
			   "ea" : "\${this.ea}",
			   "price" : "\${this.price}"}`;
	return str;
	}
	
Product.prototype.toHTML = function(){
	let str = "<div class='items'>"
			+ "<span class='code'> "+this.code+"</span>"
			+ "<span class='codeName'> "+this.codeName+"</span>"
			+ "<span class='ea'> "+this.ea+"</span>"
			+ "<span class='price'> "+this.price+"</span>"
			+ "</div>";
	return str;
}

Product.prototype.getSum = function(){
	return this.price * this.ea;
} // getSum (한번 만들어봄) : 수량*단가로 총액 구하는 function

let pd = new Product();
pd.setCode('a001');
pd.setCodeName('컴퓨터');
pd.setEa(3);
pd.setPrice(3000);

let pd2 = new Product('b001', '핸드폰', 5, 4000);
let pd3 = new Product('c001', '아이패드', 4, 2000);

//Product 객체를 생성하여 배열에 추가한 후 입력값을 div에 표시하시오.
let array = [];
let str = '';
array.push(pd);
array.push(pd2);
array.push(pd3);

// div에 JSON
for(v of array){
	str += '<div>'+v.toJSON().code + ' | ' + v.toJSON().codeName + ' | ' + v.toJSON().ea + ' | ' + v.toJSON().price + '<div/>';
}
r.innerHTML = str;

// div result2에 HTML
for(v of array){
	r2.innerHTML += v.toHTML();
}

//콘솔에 JSON (backtic 버전)
for(v of array){
	console.log(v.toJSON2());
}

</script>

</body>
</html>