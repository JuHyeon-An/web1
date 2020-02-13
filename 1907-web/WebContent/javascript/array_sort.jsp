<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array sort</title>
</head>
<body>
<h3>배열 정렬</h3>
<script>
  let array1 = [123,54,234,54,34,6,534,23,14,3,1,56,-34];
  let array2 = ['a', 'gf', '가', '안주현', 'fd', 'q', '컵', '호', '23', '65', '&@'];
  
  console.log('array1 정렬 전 : ', array1);
  console.log('array2 정렬 전 : ', array2);
  
  array1.sort();
  array2.sort();
  
  console.log('array1 정렬 후 : ', array1);
  console.log('array2 정렬 후 : ', array2);
  
  array1.sort(
	function numAsc(left,right){
		// 양수면 자리교환, 음수나 동일한 값이면 자리교환 X
		return left-right;
	}
  );
  
  console.log('array1 숫자정렬 후 : ', array1);
  array1.reverse();
  console.log('array1 숫자정렬 후 reverse: ', array1);
  
  console.log('join : ', array1.join('------>'));
  // 배열과 배열 사이에 구분자를 컴마 대신에 -----> 해당 기호로 써라
  
  // object형 데이터를 배열에 저장한 후 원하는 키로 정렬
  function Data(id, score){
	  this.id = id;
	  this.score = score;
  }
  
  let array3 = [];
  array3.push( new Data('1', 70) );
  array3.push( new Data('32', 20) );
  array3.push( new Data('6', 60) );
  array3.push( new Data('2', 90) );
  array3.push( new Data('11', 100) );
  array3.push( new Data('26', 30) );
  
  // score 순으로 오름차 정렬
  function scoreSort(obj1, obj2){
	  return Number(obj1.score) - Number(obj2.score);
  }
  
  array3.sort(scoreSort);
  console.log('object sort2 ------------------');
  
  for(d of array3){
	  console.log(d.id + ' : '+d.score);
  }

  // id 순으로 오름차 정렬
  function IdSort(obj1, obj2){
	  let r = (obj1.id > obj2.id)? 1 : -1;
	  return r;
  }
  
  array3.sort(IdSort);
  console.log('object sort ------------------');
  
  for(d of array3){
	  console.log(d.id + ' : '+d.score);
  }
  
  // 배열 요소 삭제
  for(i=0; i<array1.length; i++){
  //for(i=array1.length-1; i>=0; i--){
	  if(array1[i]>50){
 	    array1.splice(i,1); // array1.pop(i)
	  }
  }
  console.log('삭제 후 : ', array1);
</script>
</body>
</html>