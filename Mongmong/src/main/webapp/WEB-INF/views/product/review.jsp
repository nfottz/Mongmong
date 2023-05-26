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
	function fnProductDetail() {
		location.href = '${contextPath}/product/detail.do?prodNo=1';
	}
	function fnFileCheck(vThis) {
		let maxSize = 1024 * 1024 * 10;
		let files = vThis.files;
		$('#fileList').empty();
		$.each(files, function(i, file) {
			if(file.size > maxSize) {
				alert('각 첨부파일의 최대 크기는 10MB입니다.');
				$(vThis).val();
				$('#fileList').text('첨부 파일의 목록이 이 곳에 표시됩니다.');
				return;
			}
			$('#fileList').append('<div>' + file.name + '</div>');
		})
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="headerWrap">
			header부분 가져오기
		</div>
		<div id="containerReview">
			<form method="post" enctype="multipart/form-data" action="${contextPath}/product/addReview.do">
				<div class="reviewTitle">
					<h4>리뷰 작성하기</h4>
					<hr>
				</div>
				<div class="reviewContents">
					<div class="reviewWriter">
						<span>작성자</span>
						<span>${review.reviewWriter}</span>
					</div>
					<div class="sellerReview">
						<div class="reviewTitle">
							<img src="${contextPath}/resources/images/mong.png" width="20px">
							<span class="reviewTitleContent">판매자 서비스 평가 - '스토어명 가져오기'</span>
						</div>
						<div class="reviewSubTitle">
							<span class="reviewSubTitleContent">배송, 포장, 질문, 응대, 상품 가격 등 판매자에 대한 만족도는 어떠셨는지 솔직한 평가 부탁드립니다.</span>
						</div>
						<div class="reviewStar">
							<button class="sellerStar1" role="radio" aria-checked="false" data-value="1">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="sellerStar2" role="radio" aria-checked="false" data-value="2">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="sellerStar3" role="radio" aria-checked="false" data-value="3">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="sellerStar4" role="radio" aria-checked="false" data-value="4">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="sellerStar5" role="radio" aria-checked="false" data-value="5">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
						</div>
					</div>
					<div class="productReview">
						<div class="reviewTitle">
							<img src="${contextPath}/resources/images/product.png" width="15px">
							<span class="reviewTitleContent">상품 품질 평가 - '상품명 가져오기'</span>
						</div>
						<div class="reviewSubTitle">
							<span class="reviewSubTitleContent">구매하신 상품의 품질에 대해 얼마나 만족하셨는지 솔직한 평가 부탁드립니다.</span>
						</div>
						<div class="reviewStar">
							<button class="productStar1" role="radio" aria-checked="false" data-value="1">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="productStar2" role="radio" aria-checked="false" data-value="2">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="productStar3" role="radio" aria-checked="false" data-value="3">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="productStar4" role="radio" aria-checked="false" data-value="4">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
							<button class="productStar5" role="radio" aria-checked="false" data-value="5">
								<span class="blind"><img src="${contextPath}/resources/images/nostar.png" width="13px"></span>
							</button>
						</div>
					</div>
					<div class="reviewWrite">
						<textarea id="reviewContent" name="reviewContent" class="reviewContent" cols="100" rows="10" placeholder="리뷰를 작성해주세요."></textarea>
						<div class="reviewFiles">
							<div class="UploadFile">
								<input type="file" id="file" name="file" multiple="multiple" onchange="fnFileCheck(this)">
								<div id="fileList">첨부파일의 최대 크기는 10MB입니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="reviewSubmit">
					<input type="button" value="이전" onclick="fnProductDetail()">
					<button>리뷰 등록</button>
				</div>
			</form>
		</div>
		<div id="footerWrap">
			footer부분 가져오기
		</div>
	</div>	
</body>
</html>