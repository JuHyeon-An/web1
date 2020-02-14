<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>document_2</title>
<style>
  form>select{
	width:100px;
  }
  /* 폼태그 안에 있는 select */
</style>

</head>
<body>
<h3>출장가고 싶은 지역 동적 선택</h3>
<form name='frm'>
  <label>국가</label>
  <select name='cty' id='cty'></select>
  <label>지역</label>
  <select name='zone' id='zone'></select>
  
  <label>인원수</label>
  <select name='cnt' id='cnt'></select>
  
</form>
<script>
	  
    function init(){
	  /*초기값 생성하는 부분
	  초기값이니까 국가만 옵션에 추가*/
	  let arrayCty = ['미국', '일본'];
	  let arrayZone = [
		  ['LA', 'New York'],
		  ['동경', '오사카']
	  ];
	  /* arrayZone은 2차원 배열 (미국에 따른 지역, 일본에 따른 지역)
	   미국을 선택하면 첫번째 배열이 나오고 일본을 선택하면 두번째 배열이 나옴 */
	  
  	let arrayCnt = [
		[1,2,3,4],
		[5,6,7,8]
  	];
    let cty = document.getElementById('cty');
    let zone = document.getElementById('zone');
    let cnt = document.getElementById('cnt');

    //국가항목에 option 추가
    for(i=0; i<arrayCty.length; i++ ){
    	var op = document.createElement('option');
    	var txt = document.createTextNode(arrayCty[i]);
    	
    	op.appendChild(txt);
    	cty.appendChild(op);
    }
    
  	// 국가 선택이 되면 지역 변경
  	cty.onchange = function(){
  		// selectbox의 국가를 선택하면 발생하는 이벤트
  		let index = cty.selectedIndex;
  		zone.length=0; // 배열 초기화작업
  		for(i=0; i<arrayZone[index].length; i++){
  			var txt = arrayZone[index][i];
  			zone.options[i]=new Option(txt,txt);
  			//new Option(value, text)
  		}
  		// 국가선택이 되는 순간 zone도 바뀌었다는것을 표시해서 
  		// cnt도 함께 업데이트 되도록
  		zone.onchange();
  	}
  	
    //지역이 변경되면 인원수 변경
    zone.onchange = function(){
    	let index = zone.selectedIndex;
    	cnt.length = 0;
    	for(i=0; i<arrayCnt[index].length; i++){
    		var txt = arrayCnt[index][i];
    		cnt.options[i] = new Option(txt, txt);
    	}
    }
    
  // 아래 두 코드 없으면 초기값 설정이 안됨(change 안 일어난 상태라서)
  cty.onchange();
  zone.onchange();
    } // end of init
  
  
  init();
  
</script>
</body>
</html>