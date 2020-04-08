let getId = function(id){ return document.getElementById(id); }
let url = "./index_mybatis.jsp?inc=./mybatis/";
let btnFunc = function(){
	if(getId('btnInsert')!=null){
		getId('btnInsert').onclick = function(){
			frmSelect.action = "insert.myba";
			frmSelect.submit();
		}
	}
	
	if(getId('btnList')!=null){
		getId('btnList').onclick = function(){
			frmInsert.enctype="";
			frmInsert.action = "select.myba";
			frmInsert.submit();
		}
	}
	
	if(getId('btnFind')!=null){
		getId('btnFind').onclick = function(){
			frmSelect.nowPage.value = 1;
			frmSelect.action = "select.myba";
			frmSelect.submit();
		}
	}
	
}

let go = function(nowPage){
	frmSelect.nowPage.value = nowPage;
}

let view = function(serial){
	frmSelect.serial.value = serial;
	frmSelect.action = "view.myba";
	frmSelect.submit();
}
