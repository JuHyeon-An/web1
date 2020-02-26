/**
 * data_process.js
 * date : 2020.02.26
 * get, post, put, del 타입의 라우터로 데이터 처리
 */

var express = require('../begin/node_modules/express');
var bodyParser = require('../begin/node_modules/body-parser');

var items = [
	{'name': '우유', 'price':2000},
	{'name': '홍차', 'price':5000},
	{'name': '커피', 'price':7000}
	];

var app = express();
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:false}));

app.get('/products', function (req, resp){
	resp.send(items);
});

app.get('/products/:id', function(req, resp){
	var id = Number(req.params.id);
	
	if(isNaN(id)){
		resp.send({
			error:'숫자를 입력하세요!'
		});
	}else if (items[id]){
		reponse.send(items[id]);
	}else{
		reponse.send({
			error:'존재하지 않는 데이터입니다!'
		});
	}
});

app.post('/products', function (req, resp){
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

app.put('/products/:id', function(req, resp){
	
	var id = Number(req.params.id);
	var name = req.body.name;
	var price = req.body.price;
	
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
});


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


app.listen(9991, function(){
	console.log('SERVER-------');
});






