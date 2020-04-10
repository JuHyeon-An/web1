<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="mybatis" class="container">
	<h2>게시물 작성</h2>
	<form name="frm" method="post" enctype="multipart/form-data">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">작성자</span>
			</div>
			<input type="text" class="input" name="id" value="${vo.id }"/>
		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<input type="text" class="input" name="subject" value="${vo.subject }"/>
		</div>
		
		
		<label for="content">내용</label>
		<textarea class="input" rows="" cols="" name="content">${vo.content }</textarea>
		
		<label for="pwd">암호</label>
		<input class="input" type="password" name="pwd" value="${vo.pwd }"/>
		<br/>

			
		
		<br/>


			<div class="file has-name is-boxed">
				<label class="file-label"> <input class="file-input"
					type="file" name="att" multiple id="btnAtt"> <span class="file-cta"> <span
						class="file-icon"> <i class="fas fa-upload"></i>
					</span> <span class="file-label"> 파일 첨부 </span>
				</span> <span id = "attList" class="file-name"> 
				첨부된 파일 목록 
				</span>
				</label>
			</div>
					<c:forEach var="i" items="${attList }">
						<div>
							<label>${i.oriFile }</label>
							<input class="checkbox" type="checkbox" name="delFile" value="${i.sysFile }"  
							onclick="delCheck(this);">
						</div>					
					</c:forEach>
	<br/>

			<input class="btn btn-success" type="button" value="저장" id="btnUpdate">
		<input class="btn btn-success" type="button" value="취소" id="btnList">
		<input type="text" name="nowPage" value="${param.nowPage}">
		<input type="text" name="findStr" value="${param.findStr }">
	</form>
</div>
