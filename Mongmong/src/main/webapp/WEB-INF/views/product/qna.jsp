<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.css">
<script>
	function fnReturn() {
		history.back();
	}
	$(function(){
		$('#qnaContent').summernote({
			width: 640,
			height: 480,
			lang: 'ko-KR',
		  	toolbar: [
		    	['style', ['bold', 'italic', 'underline', 'clear']],
		    	['font', ['strikethrough', 'superscript', 'subscript']],
		    	['fontsize', ['fontsize']],
		    	['color', ['color']],
		    	['para', ['ul', 'ol', 'paragraph']],
		    	['table', ['table']],
				['insert', ['link', 'picture', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
		  	]
		})
	})
</script>
</head>
<body>
	<div id="wrap">
		<div id="headerWrap">
			header부분 가져오기
		</div>
		<div id="containerQna">
			<form method="post" enctype="multipart/form-data" action="${contextPath}/product/qnaAdd.do?prodNo=${product.prodNo}">
				<div class="qnaTitle">
					<h4>상품 문의</h4>
				</div>
				<div class="qnaContents">
					<table border="1">
						<colgroup>
							<col style="width:15%">
							<col style="width:85%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">말머리</th>
								<td>
									<div>
										<select class="qnaSelect" id="qnaCategory" name="qnaCategory">
											<option value="문의내용">문의내용</opntion>
											<option value="1" id="qna1">상품</option>
											<option value="2" id="qna2">배송</option>
											<option value="3" id="qna3">반품/환불</option>
											<option value="4" id="qna4">교환/변경</option>
											<option value="5" id="qna5">기타</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td><strong>${sessionScope.loginId}</strong></td>
							</tr>
							<tr>
								<th scope="row">상품번호</th>
								<td>${productDTO.prodNo}</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td>
									<input type="text" id="qnaTitle" name="qnaTitle">
								</td>
							</tr>
							<tr>
								<th scope="row">본문</th>
								<td>
									<textarea id="qnaContent" name="qnaContent" class="qnaContent"></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td>
									<input type="file" id="file" name="file" multiple="multiple">
									<div id="fileList"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="qnaSubmit">
					<input type="button" value="이전" onclick="fnReturn()">
					<button>제출</button>
				</div>
			</form>
		</div>
		<div id="footerWrap">
			footer부분 가져오기
		</div>
	</div>
</body>
</html>