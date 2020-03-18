function btnFunc(){
	
	if($('#btnList')!=null){
		$('#btnList').click(function(){
			$('#frm').removeAttr('enctype');
			// enctype 속성을 없애고 select로 이동
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

	if($('#btnFile')!=null){
		$('#btnFile').change(function(e){
			let ele = e.target; //event.srcElement : 순수 자바스크립트 코드로 처리했을 때.
			let url = ele.files[0];
			// 이벤트가 발생한 파일의 경로
			
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			  reader.onload = function(ev){
				  // 읽기가 다 끝나면, 파일을 다 읽으면.
				    let img = new Image();
				    img.src = ev.target.result;
					// 실제로 읽혀진 파일
					$('#photo').attr('src', img.src);
				  }
		})
		}
	}
	
	/*
	if($('#btnFile')!=null){
		frm.oriFile.onchange = function(e){
			let ele = e.srcElement;
			
			console.log('srcElement', ele);
			  console.log('value : ', ele.value);
			  
			  let url = ele.files[0];
			  // 타입이 파일인 파일버튼이 가지고있는 태그가 가지고 있는 파일
			  
			  //files의 배열값 선택하면 해당 파일의 경로가 떨어짐
			  let reader = new FileReader();
			  //반드시 필요한 객체 filereader
			  reader.readAsDataURL(url);
			  // 리더에 URL 패턴으로 들어온 파일을 읽어라
			  
			  reader.onload = function(ev){
			  // 읽기가 다 끝나면, 파일을 다 읽으면.
			    let img = new Image();
			    img.src = ev.target.result;
				// 실제로 읽혀진 파일
				frm.photo.src = img.src;
			  }
		}
	}
	*/

