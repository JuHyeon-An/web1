/**
 * javascript_board_T에 사용되는 script
 * date : 2020-01-12
 */

//localStorage에 저장된 데이터를 배열에 저장

let seq; // (오라클에서) 시퀀스처럼 항상 증가되는 번호
let db;

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

// 오라클이 하게 될 역할 (insert = executeUpdate)
function storeDB(){
	let tempDB = JSON.stringify(db);
	localStorage.setItem('board', tempDB);
	localStorage.setItem('seq', seq);
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
	
	//목록으로 가는 버튼
	if(brd.btnSelect != null){
		brd.btnSelect.onclick = function(){
			location.href='select.jsp';
		}
	}
	
	//insert-저장버튼
	if(brd.btnSave != null){
		brd.btnSave.onclick = function(){
			loadDB();
			let tempDate = new Date();
			let now = tempDate.getFullYear() + '-'
					+(tempDate.getMonth()+1)+'-'
					+ tempDate.getDate();
			seq++;
			//save버튼이 눌릴때마다 seq는 증가
			
			let data = new Data(brd.mName.value, brd.subject.value, 
								brd.content.value, seq, 0, now);
			db.push(data);
			storeDB();
		}
	}
	
	if(brd.btnUpdate != null){
		brd.btnUpdate.onclick=function(){
			
		}
	}
	
	// 자바의 VO같은 데이터 function
	function Data(mName, subject, content, serial, hit, mDate){
		this.mName = mName;
		this.subject = subject;
		this.content = content;
		this.serial = serial;
		this.hit = hit;
		this.mDate = mDate;
	}


