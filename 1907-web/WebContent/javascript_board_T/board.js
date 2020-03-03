/**
 * 
 */
/* javascript_board 에서 사용되는 script
 * date : 2020-01-12
 */

let seq; // (오라클에서) 시퀀스처럼 항상 증가되는 번호
let db;

//localStorage에 저장된 데이터를 배열에 저장
function loadDB(){
	
	let temp = localStorage.getItem('board');
	// 처음 실행했을때에는 로컬스토리지에 아이템이 없을 것이다
	seq = localStorage.getItem('seq');
	if(temp==null){ //한번도 데이터가 생성되지 않았다면
		db=[]; // db를 초기화
	}else{
		db = JSON.parse(temp); //데이터가 있으면 parsing
		 /* 문자열로 형태로 저장되어 있던 값이 오브젝트로 바뀜
		 * (로컬스토리지에는 키값도 문자열, value값도 문자열)
		 */
	}
	if(seq == null){
		//시퀀스가 없으면 1로 초기화 (값이 이미 있으면 생략)
		seq = 0;
	}
	
}

// serial을 기준으로 descending
function sortSerial(obj1, obj2){
	return Number(obj2.serial)-Number(obj1.serial);
}

// 오라클이 하게 될 역할 (insert = executeUpdate)
function storeDB(){
	let tempDB = JSON.stringify(db);
	localStorage.setItem('board', tempDB);
	localStorage.setItem('seq', seq);
}

function toHTML(d){ //backtic
  let str = `
			<div class='items'>
				<span class='serial'>${d.serial}</span>
				<span class='subject'>
				<a href='#' onclick='view(${d.serial})'>${d.subject}</a></span>
				<span class='mName'>${d.mName}</span>
				<span class='mDate'>${d.mDate}</span>
				<span class='hit'>${d.hit}</span>
			</div>`;
	return str;
}

function view(serial){
	
	for(let i=0 ; i<db.length ; i++){
		if(db[i].serial == serial){
			// 매개변수로 받은 시리얼번호와 db의 시리얼번호가 일치하는지 확인
			let data = db[i];
			data.hit++;//조회수증가
			db[i] = data;
			//바뀐데이터 다시 집어넣기 (reference 타입으로 연결돼서 집어넣지 않아도 사실 상관없음)
			storeDB();
			//수정된 데이터가 있으니 실제 로컬스토리지에 적용시켜야함
			break;
		}
	}
	
	localStorage.setItem('serial', serial);
	/*view 페이지 넘어가서 해당 시리얼번호 가지고 오거나, 수정 삭제때 시리얼번호 기준으로 작업해야 하기 때문에.
	 페이지 바뀌더라도 현재값을 저장하기 위한 방법 */
	
	location.href='view.jsp';
}

// 게시판 목록(select)에서 입력 버튼 누르면 insert파일로 연결
if(brd.btnInsert != null){
	brd.btnInsert.onclick = function(){
		location.href='insert.jsp';
	}
}

if( brd.btnSave != null){
	brd.btnSave.onclick = function(){
		loadDB();
		let tempDate = new Date();
		let now = tempDate.getFullYear() + '-' + (tempDate.getMonth()+1) + '-' + tempDate.getDate();
		seq++;
		let data = new Data(brd.mName.value , brd.subject.value, brd.content.value, seq, 0, now);
		db.push(data);
		storeDB();
		
	}
}
if(brd.btnSearch != null ){
	brd.btnSearch.onclick = function(){
		let list = document.getElementById('list');
		let findStr = brd.findStr.value;
		localStorage.setItem('findStr', findStr);
		/*(없어도 상관없는 코드. 현재 구현되지 않음)
		 * 검색하고 다시 목록보기 누르면 검색어 그대로 남아있도록.
		 * 현재는 상세보기 했다가 목록 누르면 다시 초기화된 화면이 나온다.
		 */
		loadDB();
		db.sort(sortSerial);
		list.innerHTML = '';
		for(d of db){ // loadDB 함수에 의해 최근자료로 갱신됨
			if(d.subject.indexOf(findStr)>=0 || d.content.indexOf(findStr)>=0){
				list.innerHTML += toHTML(d);
			}
		}
	}
}

if(brd.btnModify != null){ //수정 삭제폼으로 이동
	brd.btnModify.onclick = function(){
		let serial = brd.serial.value;
		localStorage.setItem('serial', serial);
		// 수정버튼을 누르는 시점에 serial을 갱신
		location.href='modify.jsp';
	}
}



if(brd.btnSelect != null){
	brd.btnSelect.onclick = function(){
		location.href='select.jsp';

	}
}

if(brd.btnUpdate != null){ //내용 수정
	brd.btnUpdate.onclick = function(){
		let yn = confirm('정말 수정 할거지요 ?????');
		if(yn){
			let serial = brd.serial.value;
			for(let i=0 ; i<db.length ; i++){
				if(db[i].serial == serial){
					let data = db[i];
					data.subject = brd.subject.value;
					data.content = brd.content.value;
					db[i] = data;
					storeDB();
					break;
				}
			}
			location.href='select.jsp';
		}

	}
}

if(brd.btnDelete != null){
	brd.btnDelete.onclick = function(){
		let yn = confirm('정말 삭제할거지요 ?????');
		if(yn){
			let serial = brd.serial.value;
			/* serial번호 로컬에서 찾아도 상관없지만
			화면에 있는 시리얼번호를 찾아왔음 */
			for(let i=0 ; i<db.length ; i++){
				if(db[i].serial == serial){
					db.splice(i,1);
					// db의 i번째에서 한개를 지워라 (splice)
					storeDB();
					break;
				}
			}
			location.href='select.jsp';
			//삭제후 바로 목록으로 이동되도록
		}
	}
}


if(brd.btnInit != null){
	// btnInit 버튼은 insert 페이지가 켜질때만 존재함.
	// 그러므로 조건을 걸어줘야함
	brd.btnInit.onclick = function(){
		let yn = confirm('데이터 정말 초기화?');
		if(yn){
			localStorage.removeItem('board');
			localStorage.removeItem('seq');
			db = []; // 메모리에 저장되어있는 db도 초기화
		}
	}
}

function Data(mName, subject, content, serial, hit, mDate){
	this.mName = mName;
	this.subject = subject;
	this.content = content;
	this.serial = serial;
	this.hit = hit;
	this.mDate = mDate;
}

