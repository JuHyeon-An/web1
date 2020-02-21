<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xhr_test</title>
<style>
*{
font-family:'나눔바른고딕';
}
div.frame{
  display: inline-block;
  width :300px;
  height : 500px;
  border:2px solid #fce3f9;
  overflow:auto;
}
table{
	border-spacing:0;
	border:1px;
	font-size:10pt;
}

.item, .header{
	border-bottom:0.5px dotted #fc9fef;
	padding:3px;
	box-sizing: border-box;
	background-color:#fff2fd;
	font-size:15px;
}
.item>span, .header>span{
	display: inline-block;
}
.header{
	background-color:#f785e8;
	color:#fff;
}
.id { width:50px;}
.dname{ width:150px;}
.mid{width:50px;}
.fn{width:100px;}
</style>
<script src="../lib/jquery-3.4.1.js"></script>
</head>
<body>
<h3>XMLHttpRequest 객체 Test</h3>
<input type="button" value="ajax실행1" id="btn1" />
<input type="button" value="ajax실행2" id="btn2" />

<input type="button" value="CSV" id="btn3" />
<input type="button" value="XML" id="btn4" />
<input type="button" value="JSON" id="btn5" />
<p/>
<div id='div1' class='frame'></div>
<div id='div2' class='frame'></div>
<div id='div3' class='frame'></div>

<script>
let xhr = new XMLHttpRequest();

$('#btn1').click(function(){
	xhr.open('get', 'test1.html', true);
	// open을 가장먼저 (true는 생략가능)
	xhr.send();
	xhr.onreadystatechange=function(){
		console.log(xhr.status + ', '+xhr.readyState);
		if(xhr.status==200 && xhr.readyState==4){
			$('#div1').html(xhr.responseText);
			// xhr이 가지고 있는 텍스트를 div1에 표시 (조건맞으면)
		};
	};
});

$('#btn2').click(function(){
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			$('#div2').html(xhr.responseText);
		};
	};
	xhr.open('get', 'test2.jsp', true);
	// open을 가장먼저 (true는 생략가능)
	xhr.send();
});

$('#btn3').click(function(){
	xhr.open('get', 'csv.jsp');
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			let array = xhr.responseText.split('\n');
			// split이용해서 엔터키 기준으로 쪼개주기
			console.log(array);
			let str = "<table border='1' width='100%'>"
					+ "<tr><th>사번</th><th>성명</th><th>급여</th>"
					+ "</tr>";
			for(let i=0; i<array.length; i++){
				// array의 i번째는 steven의 정보
				if(array[i]=='\r' || array[i]=='') continue;
				let data = array[i].split(',');
				// comma로 각각의 정보 나눠주기
				
				str += "<tr>"
						+ "<td>" + data[0] + "</td>"
						+ "<td>" + data[1] + "</td>"
						+ "<td>" + data[2] + "</td>"
						+ "</tr>";
				};
			str += "</table>";
			$('#div1').html(str);
			};
		};
});

$('#btn4').click(function(){
	xhr.open('get', 'xml.jsp');
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
		// xml을 parsing하는 작업
		let temp = xhr.responseXML;
		let deps = $(temp).find('department');
		/* temp에 department라는 태그를 n개 찾아서 deps에 넣어라
			=> deps는 배열. (몇개인지 모르지만)
			=> deps에서 id, dname, mid 찾으면 된다
		*/
		let str = "<h1>XML로 출력</h1><div class='header'>"
			+"<span class='id'>사번</span>"
			+"<span class='dname'>부서명</span>"
			+"<span class='mid'>매니저</span>"
			+"</div>";
		$(deps).each(function() {
		// each : 배열을 순행하는 메소드 (첨자없이 바로 핸들링) 		
			str += "<div class='item'>"
				+ "  <span class='id'>" + $(this).find('id').text() + "</span>"
				+ "  <span class='dname'>" + $(this).find('dname').text() + "</span>"
				+ "  <span class='mid'>" + $(this).find('mid').text() + "</span>"
				+ "</div>";
		});
		$('#div2').html(str);
		};
	};
});

$('#btn5').click(function(){
	xhr.open('get', 'json.jsp');
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
		let temp = xhr.responseText;
		let array = JSON.parse(temp);
		let str = "<h1>JSON타입으로 출력</h1>";
		str+="<div class='header'>"
			+"<span class='id'>사번</span>"
			+"<span class='fn'>성명</span>"
			+"<span class='mid'>매니저</span>"
			+"</div>";
			
		$(array).each(function(index){
		str += "<div class='item'>"
			+ "  <span class='id'>" + array[index].id + "</span>"
			+ "  <span class='fn'>" + array[index].fn + "</span>"
			+ "  <span class='mid'>" + array[index].mid + "</span>"
			+ "</div>";
		});
		
		//for문으로 해도 같은 결과
		/*
		for(let i=0; i<data.length; i++){
			str += "<div class='item'>"
				+ "  <span class='id'>" + data[i].id + "</span>"
				+ "  <span class='fn'>" + data[i].fn + "</span>"
				+ "  <span class='mid'>" + data[i].mid + "</span>"
				+ "</div>";
		};
		*/
		
		$('#div3').html(str);
		};
	};
});


</script>
</body>
</html>