/**
 * module_request.js
 */
let req = require('request');
req('http://www.google.com', function(error, resp, body){
	console.log(body);
});

