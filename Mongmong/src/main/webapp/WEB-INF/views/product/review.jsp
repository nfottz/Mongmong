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
	function fnReturn() {
		history.back();
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
	$('input[name="reviewStar1"]').on('change', function() {
	    var rating = $(this).val();
	    $('#rating-text').text('평가: ' + rating + '점');
	});
	$('input[name="reviewStar2"]').on('change', function() {
	    var rating = $(this).val();
	    $('#rating-text').text('평가: ' + rating + '점');
	});
</script>
<style>
	.star-rating {
	  unicode-bidi: bidi-override;
	  direction: rtl;
	  text-align: center;
	}
	
	.star-rating .star {
	  display: inline-block;
	  font-size: 20px;
	  color: #ccc;
	  cursor: pointer;
	}
	
	.star-rating .star:before {
	  content: '\2605';
	}
	
	.star-rating .star.active:before,
	.star-rating .star:hover:before {
	  color: #ff9800;
	}
	#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="headerWrap">
			header부분 가져오기
		</div>
		<div id="containerReview">
			<form method="post" enctype="multipart/form-data" action="${contextPath}/product/addReview.do?prodNo=${product.prodNo}" name="myform" id="myform">
				<div class="reviewTitle">
					<h2>리뷰 작성하기</h2>
					<hr>
				</div>
				<div class="reviewContents">
					<div class="reviewWriter">
						<span><strong>작성자 - ${sessionScope.loginId}</strong></span>
					</div>
					<hr>
					<div class="sellerReview">
						<div class="reviewTitle">
							<img src="${contextPath}/resources/images/mong.png" width="20px">
							<span class="reviewTitleContent">판매자 서비스 평가</span>
						</div>
						<div class="reviewSubTitle">
							<span class="reviewSubTitleContent">배송, 포장, 질문, 응대, 상품 가격 등 판매자에 대한 만족도는 어떠셨는지 솔직한 평가 부탁드립니다.</span>
						</div>
						<div class="reviewStar1" id="revieStar1">
							<fieldset>
								<input type="radio" name="reviewStar1" value="1" id="seller_rate1"><label for="seller_rate1">★</label>
								<input type="radio" name="reviewStar1" value="2" id="seller_rate2"><label for="seller_rate2">★</label>
								<input type="radio" name="reviewStar1" value="3" id="seller_rate3"><label for="seller_rate3">★</label>
								<input type="radio" name="reviewStar1" value="4" id="seller_rate4"><label for="seller_rate4">★</label>
								<input type="radio" name="reviewStar1" value="5" id="seller_rate5"><label for="seller_rate5">★</label>
							</fieldset>
						</div>
						<p id="rating-text"/>
					</div>
					<div class="productReview">
						<div class="reviewTitle">
							<img src="${contextPath}/resources/images/product.png" width="15px">
							<span class="reviewTitleContent">상품 품질 평가</span>
						</div>
						<div class="reviewSubTitle">
							<span class="reviewSubTitleContent">구매하신 상품의 품질에 대해 얼마나 만족하셨는지 솔직한 평가 부탁드립니다.</span>
						</div>
						<div class="reviewStar2" id="reviewStar2">
							<fieldset>
								<input type="radio" name="reviewStar2" value="1" id="product_rate1"><label for="product_rate1">★</label>
								<input type="radio" name="reviewStar2" value="2" id="product_rate2"><label for="product_rate2">★</label>
								<input type="radio" name="reviewStar2" value="3" id="product_rate3"><label for="product_rate3">★</label>
								<input type="radio" name="reviewStar2" value="4" id="product_rate4"><label for="product_rate4">★</label>
								<input type="radio" name="reviewStar2" value="5" id="product_rate5"><label for="product_rate5">★</label>
							</fieldset>
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
					<input type="button" value="이전" onclick="fnReturn()">
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