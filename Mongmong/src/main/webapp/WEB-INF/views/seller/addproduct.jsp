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
<script>
	function fnList(){
		location.href = '${contextPath}/seller/sellermain.do'
	}
	
	function fnFileCheck(vThis){

		let maxSize = 1024 * 1024 * 10;
		
		// 첨부된 파일 목록
		let files = vThis.files;
		
		// 첨부된 파일 순회(크기 체크 + 첨부된 파일명 표시)
		$('#fileList').empty();
		$.each(files, function(i, file){
			
			if(file.size > maxSize){
				alert('각 첨부파일의 최대 크기는 10MB입니다.');
				$(vThis).val('');  // 첨부된 파일을 모두 지운다.
				$('#fileList').text('첨부 파일의 목록이 이 곳에 표시됩니다');
				return;
			}
			
			$('#fileList').append('<div>' + file.name + '</div>');
			
		})
		
	}
</script>
</head>
<body>
	<h1>상품등록</h1>
	<form method="post" enctype="multipart/form-data" action="${contextPath}/seller/prodAdd.do">
		<div>
			<label for="files"><img src="#"></label>
			<input type="file" id="files" name="files" multiple="multiple" onchange="fnFileCheck(this)">
		</div>
		<div>
			<label for="prodName">상품명</label>
			<input type="text" placeholder="상품명을 입력하세요." id="prodName" name="prodName">
		</div>
		<div>
			<label for="prodContent">내용</label>
			<textarea rows="15" cols="100" name="prodContent" placeholder="내용을 입력하세요."></textarea>
		</div>
		<div>
			<label for="prodPrice">가격</label>
			<input type="text" placeholder="가격을 입력하세요." id="prodPrice" name="prodPrice">
			<label for="prodDelevery">배송비포함</label>
			<input type="checkbox" id="prodDelevery">
		</div>
		<div>
			<label for="prodStock">수량</label>
			<input type="text" placeholder="수량을 입력하세요." id="prodStock" name="prodStock">
		</div>

		<div>
			<button>등록</button>
			<input type="button" value="목록" onclick="fnList()">
		</div>
	</form>	
	
	
</body>
</html>