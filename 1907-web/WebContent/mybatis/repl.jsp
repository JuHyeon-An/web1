<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="mybatis">
<h2>자유게시판 댓글달기</h2>

<form name="frm" method="post" enctype="multipart/form-data">
		<div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">작성자</label>
    </div>
    <div class="field-body">
      <div class="field">
        <p class="control is-expanded has-icons-left">
          <input class="input" type="text" placeholder="Name" name="id">
          <span class="icon is-small is-left">
            <i class="fas fa-user"></i>
          </span>
        </p>
      </div>
     
    </div>
  </div>
  
  <div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">비밀번호</label>
    </div>
    <div class="field-body">
      <div class="field">
        <p class="control is-expanded has-icons-left">
          <input class="input" type="password" name="pwd">
          <span class="icon is-small is-left">
            <i class="fas fa-password"></i>
          </span>
        </p>
      </div>
     
    </div>
  </div>
 
  <div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">제목</label>
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <input class="input" type="text" placeholder="제목을 입력하세요." name="subject">
        </div>
        
      </div>
    </div>
  </div>
  
  <div class="field is-horizontal">
    <div class="field-label is-normal">
      <label class="label">내용</label>
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <textarea class="textarea" placeholder="내용을 입력하세요" name="content"></textarea>
        </div>
      </div>
    </div>
  </div>
  <div class="field is-horizontal">
  <div class="field-label">
</div>
<div class="field-body">
  <div class="file has-name is-boxed">
    <label class="file-label"> <input class="file-input"
        type="file" name="att" multiple id="btnAtt"> <span class="file-cta"> <span
            class="file-icon"> <i class="fas fa-upload"></i>
        </span> <span class="file-label"> 파일선택 </span>
    </span> <span id = "attList" class="file-name"> </span>
    </label>
</div>
</div>
</div>
  <div class="field is-horizontal">
    <div class="field-label">
      <!-- Left empty for spacing -->
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <button class="button is-primary" id="btnReplR">
            		저장
          </button>
          <button class="button is-primary" id="btnList">
          		  취소
          </button>
        </div>
      </div>
    </div>
  </div>

		<input type="text" name="nowPage" value="${param.nowPage}">
		<input type="text" name="findStr" value="${param.findStr }">
		<input type="text" name="serial" value="${param.serial }">
		<input type="text" name="pSerial" value="${param.serial }">
	</form>

</div>
