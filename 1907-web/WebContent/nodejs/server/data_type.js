/**
 * data_type.js
 * date : 2020.02.26
 */

var express = require('../begin/node_modules/express');
var app = express();
app.use(express.static('public'));

let items = [
	{'name': '우유', 'price':2000},
	{'name': '홍차', 'price':5000},
	{'name': '커피', 'price':7000}
];

app.all('/html', function(req, resp){
	let output = '<!DOCTYPE html>'
			+ '<html>'
			+ '<head>'
			+ '		<title>HTML type</title>'
			+ '</head>'
			+ '<body>';
	for(d of items){
		output += '<div>'
				+ '<span>'+d.name+'</span>'
				+ '<span>'+d.price+'</span>'
				+ '</div>';
	}
	output += '</body></html>';
	resp.send(output);
});

app.all('/json', function(req, resp){
	resp.send(items);
});

app.all('/xml', function(req, resp){
	let output = '<?xml version="1.0" encoding="utf-8"?>'
			   + '<products>';
	for(d of items){
		output += '<product>'
				+ '<name>' + d.name + '</name>'
				+ '<price>' + d.price + '</price>'
				+ '</product>';
	}
	output += '</products>';
	resp.type('text/xml');
	resp.send(output);
});

app.use('/parameter', function(req, resp){
	let findStr = req.param('findStr');
	// jsp에서 getParameter와 비슷
	for(d of items){
		if(d.name == findStr){
			resp.send('단가 : '+d.price);
		}
	}
});


app.listen(9991, function(){
	console.log('http://127.0.0.1:9991/ [ html | json | xml ]');
});