function btnFunc(){
	
	if($('#btnList')!=null){
		$('#btnList').click(function(){
			$('#frm').attr('action', 'select.cc').submit();
		})
	}

	if($('#btnGoInsert')!=null){
	$('#btnGoInsert').click(function(){
		$('#frm').attr('action', 'insert.cc').submit();
	})
	}

	if($('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			$('#frm').attr('action', 'insertR.cc').submit();
		})
	}

	if($('#btnModify')!=null){
		$('#btnModify').click(function(){
			$('#frm').attr('action', 'modify.cc').submit();
		})
	}

	if($('#btnDelete')!=null){
		$('#btnDelete').click(function(){
			$('#frm').attr('action', 'deleteR.cc').submit();
		})
	}

	if($('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			$('#frm').attr('action', 'modifyR.cc').submit();
		})
	}

	if($('#btnFind')!=null){
		$('#btnFind').click(function(){
			$('#frm').attr('action', 'select.cc').submit();
		})
	}
}

