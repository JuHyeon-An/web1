/**
 * member.js
 * module_member에서 모듈을 가져다가 출력
 * date : 2020.02.26
 */

let mm = require('./module_member');
let m1 = new mm.Data('1', 'hong', '010-1111-1111', '종로구');
let m2 = new mm.Data('2', 'lee', '010-1211-1111', '은평구');
let m3 = new mm.Data('3', 'kim', '010-1311-1111', '고양시');
let m4 = new mm.Data('4', 'park', '010-4111-1111', '송파구');

mm.input(m1);
mm.input(m2);
mm.input(m3);
mm.input(m4);

mm.select('2');
mm.output();
 

