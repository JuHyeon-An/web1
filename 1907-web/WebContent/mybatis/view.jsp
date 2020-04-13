<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<div id="mybatis" class="container">
		<h2>상세보기</h2>
		<form name="frm" method="post" enctype="multipart/form-data">
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<span class="label">작성자</span>
				</div>
				<div class="field-body">
					<p class="control is-expanded has-icons-left">
						<input class="input" type="text" name="id" value="${vo.id }" /> <span
							class="icon is-small is-left"> <i class="fas fa-user"></i>
						</span>
					</p>
				</div>
			</div>

			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<span class="label">제목</span>
				</div>
				<div class="field-body">
					<div class="field">
						<div class="control">
							<input class="input" type="text" name="subject"
								value="${vo.subject }" />
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
							<textarea class="textarea" name="content">${vo.content }</textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">파일 첨부</label>
				</div>


				<div class="field-body" id="attList">
					<div class="field">
						<div class="control">
							<input class="file" type="file" name="att" multiple />
							<ul>
								<c:forEach var="att" items="${attList }">
									<li><a href="./upload/${att.sysFile }"
										download="${att.oriFile }">${att.oriFile }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="field is-horizontal">
				<div class="field-label"></div>
				<div class="field-body">
					<div class="field">
						<div class="control">
							<input class="button is-primary" type="button" value="수정"
								id="btnModify"> <input class="button is-primary"
								type="button" value="삭제" id="btnDelete"> <input
								class="button is-primary" type="button" value="댓글" id="btnRepl">
							<input class="button is-primary" type="button" value="취소"
								id="btnList">
						</div>
					</div>
				</div>
			</div>
			<input type="text" name="nowPage" value="${param.nowPage}"> <input
				type="text" name="findStr" value="${param.findStr }"> <input
				type="text" name="serial" value="${vo.serial }" />
				<input type="text" name="pwd"/>
		</form>
	</div>
</body>
</html>