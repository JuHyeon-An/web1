<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image_preview_3</title>
<style>
#att_file{
  border:1px solid powderblue;
  padding:10px;
  box-sizing:border-box;
  /* box-sizing 줬을때와 주지 않았을때 차이 알아보기 */
  width:600px;
}
#att_file>div{
  position:relative;
  display: inline-block;
  margin:3px;
}

#att_file .btnDel{
  position: absolute;
  right : 2px;
  bottom :2px;
  width:35px;
  height:35px;
  font-size:30px;
  border:0px;
  opacity:0.5;
}

</style>
</head>
<body>
<h3>첨부 이미지 동적 삽입/삭제</h3>
<form name='frm'>
<label>첨부이미지</label>
<div id='att_file'></div>

<!-- att_file영역에 file 태그들이 n개 만들어지고
이미지도 이곳에 보일것 -->
</form>
<script>
  let main = document.querySelector('#att_file');
  let cnt = 0;
  
  makeDiv(main);
  
  function makeDiv(main){
	  let div = document.createElement('div');
	  div.setAttribute('style', 
			  'border:1px solid powderblue; width:120px; height:180px');
	  
	  // image tag를 추가
	  let img = document.createElement('img');
	  img.setAttribute('name', 'img'+cnt);
	  // <img name='img0'>, <img name='img1'> ... 누를때마다 증가
	  // name을 같게하면 배열처리 되는데, 그렇게 되면 버거워짐
	  img.setAttribute('width', '120px');
	  img.setAttribute('height', '180px');
	  img.src = 'http://placehold.it/120x180';
	  //src는 다이렉트로 집어넣을 수 있다
	  div.appendChild(img);
	  
	  // 삭제버튼 추가
	  let btnDel = document.createElement('input');
	  btnDel.setAttribute('name', 'delBtn'+cnt);
	  btnDel.setAttribute('type', 'button');
	  btnDel.setAttribute('value', 'X');
	  btnDel.setAttribute('class', 'btnDel');
	  
	  btnDel.onclick = function(ev){
		  let obj = ev.srcElement;
		  let parent = obj.parentNode;
		  // parentNode : 부모태그 div
		  let tag = parent.getElementsByTagName('input')[1];
		  // input태그들 중에서 두번째 태그를 가져와라
		  
		  if(tag.getAttribute('modify')=='yes'){
			  main.removeChild(parent);
		  }
	  }
	  
	  div.appendChild(btnDel);
	  
	  
	  
	  // 이미지당 file tag
	  let file = document.createElement('input');
	  file.setAttribute('type', 'file');
	  file.setAttribute('name', 'attfile'+cnt);
	  file.setAttribute('style', 'display:none');
	  file.setAttribute('modify', 'no');
	  
	  div.appendChild(file);
	  
	  // 이미지를 클릭하면
	  img.onclick = function(){
		  file.click();
	  }
	  
	  file.onclick =  function imagePreView(event){
		  	let btn = event.srcElement;
		  	
		  	console.log(btn);
		  	console.log(btn.value);
		  	
		  	btn.onchange = function(){
		  	let url = btn.files[0];
		  	let reader = new FileReader();
		  	reader.readAsDataURL(url);
		  	
		  	reader.onload = function(ev){
		  		let target = event.srcElement;
		  		let temp = new Image();
		  		temp.src = ev.target.result;
		  		img.src = temp.src;
		  		}
		  	if(file.getAttribute('modify')=='no'){
		  	makeDiv(main);
		  	// 이미지 불러오고 나면 div를 하나 더 추가해라
		  	}
		  	file.setAttribute('modify', 'yes');
		  	}
		  }
	  
	  main.appendChild(div);
	  cnt++;
  }
  

</script>
</body>
</html>