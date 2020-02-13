<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<h3> 게시판 수정 </h3>
<form name='brd'>
   <label>순번</label>
  <input type='text' name='serial' readonly/><br/>
  <label>작성자</label>
  <input type='text' name='mName' readonly/><br/>
  <label>제목</label>
  <input type='text' name='subject'/><br/>
  <textarea rows="10" cols="70" name='content'></textarea><br/>
  <input type='button' value='수정' name='btnModify'/>
  <input type='button' value='목록' name='btnSelect'  onclick="location.href='select.jsp'"/>
</form>

<script>

	let selectedIndex = localStorage.getItem('selectedIndex');
	let obj = localStorage.getItem(selectedIndex);
	let d = JSON.parse(obj);
	
	brd.serial.value = d.serial;
	brd.mName.value = d.mName;
	brd.subject.value = d.title;
	brd.content.value = d.contents;

	function Data (serial, mDate, mName, title, contents, cnt){
		this.serial = serial;
		this.mDate = mDate;
		this.mName = mName;
		this.title = title;
		this.contents = contents;
		this.cnt = cnt;
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
	brd.btnModify.onclick=function(){
	
		
	  let serial = brd.serial.value;
	  let mName = brd.mName.value;
	  let title = 	brd.subject.value;
	  let content = brd.content.value;
	
	let data = new Data(d.serial, d.mDate, mName, title, content, d.cnt);
	localStorage.setItem(2, data.toJSON());
	}
	
	
	
</script>

</body>
</html>