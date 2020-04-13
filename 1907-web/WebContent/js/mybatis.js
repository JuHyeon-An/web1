let getId = function(id){ return document.getElementById(id); }
let url = "./index_mybatis.jsp?inc=./mybatis/";
let btnFunc = function(){
	
	if(getId('btnInsert')!=null){
		getId('btnInsert').onclick = function(){
			frm.action = "insert.myba";
			frm.submit();
		}
	}
	
	if(getId("btnRegister")!=null){
		getId("btnRegister").onclick = function(){
			frm.action = "insertR.myba";
			frm.submit();
		}
	}
	
	if(getId('btnList')!=null){
		getId('btnList').onclick = function(){
			frm.enctype="";
			frm.action = "select.myba";
			frm.submit();
		}
	}
	
	if(getId('btnFind')!=null){
		getId('btnFind').onclick = function(){
			frm.nowPage.value = 1;
			frm.action = "select.myba";
			frm.submit();
		}
		
	}
	
	if(getId('btnAtt')!=null){
		let btn = getId('btnAtt');
		btn.onchange = function(){
			let attList = getId('attList'); // 필드셋의 아이디값
			let str = "<ul>";
			let files = btn.files; // 그 객체가 가지고 있는 files
			
			for(f of files){
				str += "<li>" + f.name + "( " + parseInt(f.size/1000) + " Kb )";
			}
			
			str+= "</ul>";
			attList.innerHTML = str;
		}
	}
	
	if(getId('btnModify')!=null){
		getId('btnModify').onclick = function(){
				frm.enctype='';
				frm.action = 'modify.myba';
				frm.submit();
		}
	}
	
	if(getId('btnUpdate')!=null){
		getId('btnUpdate').onclick = function(){
			let pwd = prompt("수정하려면 암호를 입력하세요");
			if(pwd !=null && pwd != ''){
			frm.pwd.value = pwd;
			frm.action = 'modifyR.myba';
			frm.submit();
			}
		}
	}
	
	if(getId('btnDelete')!=null){
		getId('btnDelete').onclick = function(){
			let password = prompt("삭제하려면 암호를 입력하세요");
			if(password !=null && password != ""){
				frm.pwd.value = password;
				frm.enctype='';
				frm.action = "deleteR.myba";
				frm.submit();
			}
		}
	}
	
	if(getId("btnRepl")!=null){
		getId("btnRepl").onclick = function(){
			frm.enctype='';
			frm.action = "./index_mybatis.jsp?inc=./mybatis/repl.jsp";
			frm.submit();
		}
	}
	
	if(getId("btnReplR")!=null){
		getId("btnReplR").onclick = function(){
			frm.action = "replR.myba";
			frm.submit();
		}
	}
}

let go = function(nowPage){
	frm.nowPage.value = nowPage;
	frm.enctype = '';
	frm.action = "select.myba";
	frm.submit();
}

let view = function(serial){
	frm.serial.value = serial;
	frm.viewHit.value = 'v';
	frm.action = "view.myba";
	frm.submit();
}

let delCheck = function(ev){
	//console.log(ev.parentElement);
	let tag = ev.parentElement.childNodes[1];
	// 부모 div가 가지고 있는 두번째 요소 (label)
	// 첫번째 요소(0번째 인덱스) 는 빈 공백 (text) 으로 인식함
	
	//console.log(tag);
	if(ev.checked){
		tag.style.textDecoration = "line-through";
		tag.style.color = "#f00";
	}else{
		tag.style.textDecoration = "none";
		tag.style.color = "";
	}
}
