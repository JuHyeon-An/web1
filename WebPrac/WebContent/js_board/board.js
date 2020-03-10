/**
 * 
 */
let bno;
let db;


function loadData(){
	let temp = localStorage.getItem("brd");
	bno = localStorage.getItem("bno");
	
	if(temp==null){
		db=[];
	}else{
		db = JSON.parse(temp);
	}
	
	if(bno==null){
		bno=0;
	}
}

//serial을 기준으로 descending
function sortSerial(obj1, obj2){
	return Number(obj2.num)-Number(obj1.num);
}

function storeDB(){
	// 배열을  localStorage에 저장하는 작업
	let tempdb = JSON.stringify(db);
	localStorage.setItem("brd", tempdb);
	localStorage.setItem("bno", bno);
}

if(brd.btnSelect!=null){
	brd.btnSelect.onclick=function(){
		location.href="select.jsp";
	}
}

if(brd.btnInsert!=null){
	brd.btnInsert.onclick=function(){
		location.href="insert.jsp";
	}
}

if(brd.btnWrite!=null){
	brd.btnWrite.onclick=function(){
		// 작성한 글을 저장하는 버튼을 클릭하면
		
		loadData();
		//db와 serial을 세팅해주는 작업
		
		let writer = brd.writer.value;
		let sub = brd.subject.value;
		let content = brd.content.value;
		let hit = 0;
		
		let tempDate = new Date();
		let date = tempDate.getFullYear() + '-' + (tempDate.getMonth()+1) + '-' + tempDate.getDate();
		
		let d1 = new Data(++bno, writer, sub, content, date, hit);
		db.push(d1);
		storeDB();

		alert("정상적으로 저장되었습니다.");
		brd.subject.value = '';
		brd.content.value = '';
	}
}

if(brd.btnInit!=null){
	brd.btnInit.onclick=function(){
		let yn = confirm("데이터를 정말 초기화하시겠습니까?");
		if(yn){
			localStorage.removeItem("brd");
			localStorage.removeItem("bno");
			db=[];
		}
	}
}

if(brd.btnSearch!=null){
	// 아묻따 게시판 전체 리스트 보여줘라
	brd.btnSearch.onclick=function(){
		loadData();
		
		let html='';
		let tbody = document.getElementById("tbody");
		let findStr = brd.findStr.value;

		db.sort(sortSerial);
			for(d of db){
				if(d.writer.indexOf(findStr)>=0 || d.subject.indexOf(findStr)>=0 || 
						d.content.indexOf(findStr)>=0){
					html += `<tr>
						<td>${d.num}</td>
						<td onclick="view(${d.num})">${d.subject}</td>
						<td>${d.writer}</td>
						<td>${d.date}</td>
						<td>${d.hit}</td>
					</tr>`;
				}
			}
			tbody.innerHTML = html;
	}
}

function view(tempNum){
	 
	 // 게시글 누르면 게시물 번호 추출해서 로컬에 저장
	 // 해당 게시글 조회수 올린다음 다시 저장
	 // 마지막으로 view.jsp 페이지로 이동
	 console.log(tempNum);
	 localStorage.setItem("tempNum", tempNum);
	 
	 for(d of db){
		 if(d.num==tempNum){
			d.hit++;
			//조회수 올리기
			temp = d;
			storeDB();
			break;
		 }
	}
	 location.href='view.jsp';
}

//url에서 파라미터 추출
function getParam(sname) {

    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");

    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
}


if(brd.btnModify!=null){
	// 수정 페이지로 이동
	brd.btnModify.onclick=function(){
		location.href="modify.jsp";
	}
}

if(brd.btnSave!=null){
	brd.btnSave.onclick=function(){
	let tempNum = localStorage.getItem("tempNum");
	loadData();
	for(d of db){
		if(d.num == tempNum){
			d.writer = brd.writer.value;
			d.subject = brd.subject.value;
			d.content = brd.content.value;
		}
	}
	storeDB();
	alert("정상적으로 수정되었습니다.");
	history.back();
	}
}

if(brd.btnDelete!=null){
	brd.btnDelete.onclick=function(){
		let tempNum = localStorage.getItem("tempNum");
		for(i=0; i<db.length; i++){
			if(db[i].num==tempNum){
				db.splice(i,1);
				storeDB();
				break;
			}
		}
		alert("정상적으로 삭제되었습니다.");
		history.back();
		}
	}

function viewModify(){
	let tempNum = localStorage.getItem("tempNum");
	loadData();
	for(d of db){
		if(d.num == tempNum){
			brd.writer.value = d.writer;
			brd.subject.value = d.subject;
			brd.content.value = d.content;
			break;
		}
	}// 값을 가져와서 폼에 넣었음
}

function inputHTML(temp){
	let html = '';
	let tbody = document.getElementById("tbody");
	html = `<tr>
		<td width="20%">글번호</td>
		<td colspan="2">${temp.num}</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td colspan="2">${temp.hit}</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td colspan="2">${temp.date}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td colspan="2">${temp.writer}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="2">${temp.subject}</td>
	</tr>
	<tr>
		<td style="vertical-align:middle;">내용</td>
		<td colspan="2" height="400px" style="vertical-align:middle;">${temp.content}</td>
	</tr>`;
	
	tbody.innerHTML = html;
}


function Data(num, writer, subject, content, date, hit){
	this.num = num;
	this.writer = writer;
	this.subject = subject;
	this.content = content;
	this.date = date;
	this.hit = hit;
}