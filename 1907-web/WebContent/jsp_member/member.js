let upload = "c:/Users/JHTA/git/web1/1907-web/WebContent/upload/";

function btnFunc(){
	
	if($('#btnList')!=null){
		$('#btnList').click(function(){
			$('#frm').removeAttr('enctype');
			// enctype 속성을 없애고 select로 이동
			// 폼태그에 있는 값을 전달해줘야되는데 enctype이 있으면 null값으로 들어감.
			$('#frm').attr('action', 'select.cc').submit();
		})
	}
	
	if($('#btnFind')!=null){
		$('#btnFind').click(function(){
			$('#nowPage').val('');
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
			let result = prompt('비밀번호를 입력하세요.');
			if(result==frm.pwd.value){
				$('#frm').removeAttr('enctype');
				$('#isChanged').val('del');
				$('#frm').attr('action', 'deleteR.cc').submit();
			}else{
				alert('비밀번호를 다시 확인하세요');
			}
		})
	}
	
	if($('#btnFileDel')!=null){ //파일만 삭제할때
		$('#btnFileDel').click(function(){
			let result = prompt('비밀번호를 입력하세요.');
			if(result==frm.pwd.value){
				$('#frm').removeAttr('enctype');
				$('#frm').attr('action', 'deleteR.cc').submit();
			}else{
				alert('비밀번호를 다시 확인하세요');
			}
		})
	}

	if($('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
				$('#frm').attr('action', 'modifyR.cc').submit();
			//enctype 이 있으면 따로 지정해주지 않는 이상 폼태그 값은 null
		})
	}

	if($('#btnFile')!=null){
		$('#btnFile').change(function(e){
			$('#isChanged').val("1");
			
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

function view(mId){
	console.log(mId);
	$('#mId').val(mId);
	console.log($('#mId').val());
	$('#frm').attr('action', 'view.cc').submit();
}

let goPage = function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm').attr('action', 'select.cc').submit();
}
