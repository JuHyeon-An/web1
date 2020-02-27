/**
 * data_process.js
 * date : 2020.02.26
 * get, post, put, del 타입의 라우터로 데이터 처리
 */

var express = require('../begin/node_modules/express');
var bodyParser = require('../begin/node_modules/body-parser');

var app = express();
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:false}));

var items = [
	{'name': '우유', 'price':2000},
	{'name': '홍차', 'price':5000},
	{'name': '커피', 'price':7000}
	];

// 전체 조회
app.post('/all', function (req, resp){
	let str = '<div id="title"><span class="a">품목</span><span class="b">가격</span></div>';
	
	for(d of items){
		str += '<div><span class="a">' + d.name
			+ '</span><span class="b">' + d.price + '</span></div>';
	}
	let css = "<style>#title{ background:black; color:white; } </style>";
	resp.send(css+str);
});


// 검색
app.get('/search', function(req, resp){
	let find = req.param('name');
	let msg = '검색결과<br/>';
	
	for(d of items){
		if(d.name == find){
			resp.send('<li>'+d.name+'<li>'+d.price);
		}
	}
});

//입력
app.post('/insert', function (req, resp){
	var formname = req.body.name;
	var formprice = req.body.price;
	
	var item = {
			'name':formname,
			'price':formprice
	};
	
	items.push(item);
	
	resp.send({
		message:'데이터를 추가했습니다.',
		data:item
	});
});

// 수정
app.post('/modify', function(req, resp){
	
	var name = req.body.name;
	var price = req.body.price;
	
	for( d of items ){
		if(d.name == name){
			d.price = price;
		}
	}
	
	resp.send(name + ' 의 단가가 '+price+'로 수정됨');
	/*
	if(items[id]){
		if(name){items[id].name = name;}
		if(price){items[id].prcie = price;}
		
		resp.send({
			message:'데이터를 수정했습니다.',
			data:items[id]
		})
	}else{
		resp.send({
			error:'존재하지 않는 데이터입니다'
		});
	}
	*/
});

app.post('/del', function(req, resp){
	let n = req.body.name;
	for(i=0; i<items.length; i++){
		if(items[i].name == n){
			items.splice(i,1);
		}
	}
	
	resp.send('<font color="red">'+n+'자료가 삭제됨</font>');
});

/*
app.del('/products/:id', function(req, resp){
	var id = Number(req.params.id);
	if(isNaN(id)){
		resp.send({
			error:'숫자를 입력하세요!'
		});
	}else if (items[id]){
		items.splice(id,1);
		resp.send({
			message:'데이터를 삭제했습니다.'
		});
	}else{
		resp.send({
			error:'존재하지 않는 데이터입니다'
		});
	};
});
*/

app.listen(8315, function(){
	console.log('SERVER-------');
});






