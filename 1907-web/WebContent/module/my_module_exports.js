/**
 * my_module_exports.js
 * date : 2020.02.26
 */

let exp={}; // 배열 아니고 리터럴
exp.sum = function(x,y){ return x+y; }
exp.avg = function(x,y){ return (x+y)/2; }
module.exports = exp;
