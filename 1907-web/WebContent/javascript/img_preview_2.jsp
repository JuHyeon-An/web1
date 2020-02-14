<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image_preview_2</title>
<style>
#btnFile{
  display: none;
}
</style>
</head>
<body>
  <h3>이미지 미리보기(II)</h3>
  <img id='target1' width='200px' height='250px'/>
  <img id='target2' width='200px' height='250px'/>
  <img id='target3' width='200px' height='250px'/>
  
  <input type='file' id='btnFile'/>
  <!-- css이용해서 파일태그가 있지만 눈에는 안 보이게! -->
  
  <script>
    let t1 = document.getElementById('target1');
    let t2 = document.getElementById('target2');
    let t3 = document.getElementById('target3');
	let btnFile = document.getElementById('btnFile');
    
    t1.onclick = imagePreView;
    t2.onclick = imagePreView;
    t3.onclick = imagePreView;
    // 이미지 클릭하면 imagePreview 호출
    // 이미지 클릭하면 file태그를 클릭한 것 처럼(파일태그는 안 보이게 숨기고)
    
    function imagePreView(event){
    	btnFile.click();
    	// 'btnFile을 클릭했다'는 신호를 다시 줌
    	
    	btnFile.onchange = function(){
    	let url = btnFile.files[0];
    	/* event가 발생한 요소가 버튼태그가 아니라 이미지태그라서
    	event.srcElement 사용할 수 없다
    	앞전에는 클릭한 것의 srcElement가 가지고 있는 files를 가져왔지만..
    	*/
    	let reader = new FileReader();
    	reader.readAsDataURL(url);
    	
    	reader.onload = function(ev){
    		let target = event.srcElement;
    		let img = new Image();
    		img.src = ev.target.result;
    		target.src = img.src;
    		}
    	}
    	// t1을 클릭하면 event.srcElement는 t1
    	// 즉, 몇번을 클릭했는지는 event가 가지고 있다
    	// 결국 event.srcElement = 이미지를 표시할 타겟
    }
    
  </script>
</body>
</html>