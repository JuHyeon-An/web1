/**
 * http://usejsdoc.org/
 */

function btnFunc(){
	if($('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			$('#frm').attr('action', 'insert.jsp').submit();
		})
	}

	if($('#btnSave')!=null){
		$('#btnSave').click(function(){
			$('#frm').attr('action', 'insert_result.jsp').submit();
		})
	}
	
	if($('#btnList')!=null){
		$('#btnList').click(function(){
			$('#frm').attr('action', 'select.jsp').submit();
		})
	}
	
	if($('#btnFind')!=null){
		$('#btnFind').click(function(){
			$('#frm').attr('action', 'select.jsp').submit();
		})
	}
	
	if($('#btnModify')!=null){
		$('#btnModify').click(function(){
			$('#frm').attr('action', 'modify.jsp').submit();
		})
	}
	
	if($('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			$('#frm').attr('action', 'modify_result.jsp').submit();
		})
	}
	
	
	if($('#btnDelete')!=null){
		$('#btnDelete').click(function(){
			let yn = confirm('정말 삭제하시겠습니까????');
			if(yn){
				$('#frm').attr('action', 'delete_result.jsp').submit();
			}
		})
	}
	
}

let view = function(mId){
	frm.mId.value = mId;
	frm.method = 'post';
	// post로 주지 않으면 get타입으로 넘어가서 한번 더 명시함

	$('#frm').attr('action', 'view.jsp').submit();
	// view.ejs로 넘어가게
}

