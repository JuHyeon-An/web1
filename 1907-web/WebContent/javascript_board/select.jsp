<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
  font-family : '둥근모꼴';
  font-size : 18px;
}

#title, #items{
margin-top : 20px;
box-sizing:border-box;

background-color:#888;
padding : 8px 0px;
}

#title{
width:
}

span{
display:inline-block;
padding:3px;}

.serial{
width:50px;
margin-left:10px;
}

.subject{
width:200px;
}

.mName{
width:100px;
}

.mDate{
width:240px;
}

.hit{
width:200px;
}

#title>.hit{
margin-left : -10px;
}

#title>.subject{
margin-left : -10px;
}

#title>.mName{
margin-left : -7px;
}

#title>.mDate{
margin-left:-8px;
}

.items:hover{
  background-color:#ddd;
  cursor:pointer;
}
</style>

</head>
<body>
<h4>게시판 목록</h4>
<form name='brd'>
  <input type='text' name='findStr'>
  <input type='button' value='검색' name='btnSearch'/>
</form>
	<div id='title'>
	  <span class='serial'>No</span>
	  <span class='subject'>제목</span>
	  <span class='mName'>작성자</span>
	  <span class='mDate'>작성일</span>
	  <span class='hit'>조회수</span>
	</div>
<div id='list'> <!-- 반복문 사용 -->
</div>

<script>
let r = document.getElementById('list');
let str = '';
brd.btnSearch.onclick=function(){
	let find = brd.findStr.value;
	
	for(i=1; i<localStorage.getItem('index'); i++){
		let obj = localStorage.getItem(i);
		if(obj!=null){
		let d = JSON.parse(obj);
		if(d.title.indexOf(find)>=0){
		r.innerHTML ='';
		str += "<div class='items' onclick='add("+i+")'>"
					+"<span class='serial'>"+d.serial+"</span>"
					+"<span class='subject'>"+d.title+"</span>"
					+"<span class='mName'>"+d.mName+"</span>"
					+"<span class='mDate'>"+d.mDate+"</span>"
					+"<span class='hit'>"+d.cnt+"</span>";
		
		}}
		}
		r.innerHTML = str;
}

function add(selectedIndex){
	location.href='view.jsp';
	localStorage.setItem('selectedIndex', selectedIndex);
}

for(i=1; i<localStorage.getItem('index'); i++){
	let obj = localStorage.getItem(i);
	if(obj!=null){
	let d = JSON.parse(obj);
	r.innerHTML = '';
	str = "<div class='items' onclick='add("+i+")'>"
				+"<span class='serial'>"+d.serial+"</span>"
				+"<span class='subject'>"+d.title+"</span>"
				+"<span class='mName'>"+d.mName+"</span>"
				+"<span class='mDate'>"+d.mDate+"</span>"
				+"<span class='hit'>"+d.cnt+"</span>";
	r.innerHTML += str;
	}
	}

let list = document.getElementsByClassName('items');




</script>

</body>
</html>