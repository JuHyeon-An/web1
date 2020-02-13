<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>
<style>
textarea{
  width:450px;
  height:300px;
  margin-top:15px;
}
form label{
  width:15px;
  text-align:right;
}
</style>
</head>
<body>
<form name='brd'>
  <label>작성자</label>
  <input type='text' name='mName'/><br/>
  <label>제목</label>
  <input type='text' name='subject'/><br/>
  <textarea name='content'></textarea><br/>
  <input type='button' value='저장' name='btnSave'/>
</form>

<script>

if(localStorage.getItem('index')==null){
	localStorage.setItem('index',1);
}

let array = [];


function Data (serial, mDate, mName, title, contents, cnt){
	this.serial = serial;
	this.mDate = mDate;
	this.mName = mName;
	this.title = title;
	this.contents = contents;
	this.cnt = cnt;
}

Data.prototype.setSerial = function(serial){ this.serial = serial;};
Data.prototype.setmDate = function(mDate){ this.mDate = mDate;};
Data.prototype.setmName = function(mName){ this.mName = mName;};
Data.prototype.setTitle = function(title){ this.title = title;};
Data.prototype.setContents = function(contents){this.contents = contents;};
Data.prototype.setCnt = function(cnt){this.cnt = cnt};

Data.prototype.getSerial = function(){ return this.serial;};
Data.prototype.getmDate = function(){ return this.mDate;};
Data.prototype.getmName = function(){ return this.mName;};
Data.prototype.getTitle= function(){ return this.title;};
Data.prototype.getContents= function(){ return this.contents;};
Data.prototype.getCnt = function(){ return this.cnt;};

Data.prototype.toString = function(){
	let str = this.serial + ' | ' + this.mDate + ' | '
			+ this.mName + ' | ' + this.title + ' | '
			+ this.contents + ' | ' + this.cnt;
	return str;
}

Data.prototype.toJSON = function(){
	let str = `{"serial" : "\${this.serial}",
		   "mDate" : "\${this.mDate}",
		   "mName" : "\${this.mName}",
		   "title" : "\${this.title}",
		   "contents" : "\${this.contents}",
		   "cnt" : "\${this.cnt}"
	}`;
return str;
}

brd.btnSave.onclick = function(){
  let n = brd.mName.value;
  let s = brd.subject.value;
  let c = brd.content.value;
  let index = localStorage.getItem('index');
  
  let data = new Data(index, getDate(), n, s, c, 0);
  
  localStorage.setItem(String(index), data.toJSON()); //저장
  index++;
  localStorage.setItem('index', index);
  } // end of save-click event

  
let getDate = function(){	
	let now = new Date();
	let weeks = ['일', '월', '화', '수', '목', '금', '토'];
	let year = now.getFullYear();
	let month = now.getMonth()+1; //0~11월
	let week = now.getDay();
	let day = now.getDate();
	
	let d = `\${year} 년 \${month}월 \${day}일 (\${weeks[week]}) `;
	
	return d;
}

</script>
</body>
</html>