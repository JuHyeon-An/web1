<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>String 객체</title>
</head>
<body>
<fieldSet id='info'>
<ul>
  <li> length : 문자열의 길이 </li>
  <li> charAt(index) : index 위치의 문자 </li>
  <li> indexOf(str) | lastIndexOf(str) : str의 위치</li>
  <li> replace(regExp, replacement) : 문자열 변경 (정규식 사용) </li>
  <li> split(seperator, limit) : 문자열을 limit의 개수만큼 분해 </li>
  <li> substring(start [, end]) : 문자열추출</li>
</ul>
</fieldSet>
<script>
// str.length : 공백 포함한 문자의 개수 
let str = "abc 가나다 123 다나가";
console.log(str + ' : ', str.length);

// charAt(index) 문자가 어디에 있는지 반환. 제로베이스
let c = str.charAt(1);
console.log('str.charAt(1) : ',c);

//indexOf
let index1 = str.indexOf('가');
let index2 = str.lastIndexOf('가');
console.log('str.indexOf("가") : ', index1);
console.log('str.lastIndexOf("가") : ', index2);

//replace
let rep1 = str.replace('가', '각');
let rep2 = str.replace(/가/, '간');
let rep3 = str.replace(/가/g, '갇');
// g를 사용해야 모든 '가'를 찾아내서 바꿔준다.

console.log('rep1 : ', rep1);
console.log('rep2 : ', rep2);
console.log('rep3 : ', rep3);

let array = str.split(' ');
for(d in array){
  console.log(d + ' : ' + array[d]);
  // array의 d번째
}

let s1 = str.substring(0,3);
console.log('str.substring(0,3) : ', s1);
let s2 = str.substring(11);
console.log('str.substring(11) : ', s2);
//end 값을 생략하면 start에서부터 끝까지 모두 출력

let str2="881213-1234567";
// 생년, 생월, 생일, 성별을 구별하여 console에 출력

let s3 = str2.substring(0,2); // 0번째에서 2번째까지
let s4 = str2.substring(2,4); // 2번째에서 4번째까지
let s5 = str2.substring(4,6); // 4번째에서 6번째까지
let gen = Number(str2.substring(7,8));
let s6 = gen%2==0? '여자' : '남자';

console.log('생년 : ', s3);
console.log('생월 : ', s4);
console.log('생일 : ', s5);
console.log('성별 : ', s6);

</script>
</body>
</html>