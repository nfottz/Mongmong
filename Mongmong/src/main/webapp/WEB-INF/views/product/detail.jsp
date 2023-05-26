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
<link rel="stylesheet" href="${contextPath}/resources/jquery-ui-1.13.2/jquery-ui.css" />
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/jquery-ui-1.13.2/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
	   $('#spinner').spinner({
		  min:0,
	      max:10,
	      step:1,
	      spin: function(event, ui){
	         $('.sum').html((${((product.prodPrice * (100 - product.productSellerDTO.discountRate)) * 0.01)} * ui.value).toLocaleString('ko-KR') + '원');
	      }
	   });
	});
	$(function(){
		// recordPerPage의 변경
		$('#recordPerPage').on('change', function(){
			location.href = '${contextPath}/product/change/record.do?recordPerPage=' + $(this).val();	// session에 recordPerPage 올리기
		})
		// 세션에 저장된 recordPerPage값으로 <select> 태그의 값을 세팅
		let recordPerPage = '${sessionScope.recordPerPage}' == '' ? '3' : '${sessionScope.recordPerPage}';
		$('#recordPerPage').val(recordPerPage);
		// 제목을 클릭하면 정렬을 바꿈
		$('.sort').on('click', function(){
			location.href='${contextPath}/product/detail.do?prodNo=' + $(this).data('prod_no')  + '&column=' + $(this).data('column') + '&order=' + $(this).data('order') + '&page=${page}';
		})
	})
	function fnDeliveryInfo() {
	  var popup = window.open("", "deliveryInfo", "width=400,height=300");
	

	  var deliveryInfoContent = document.getElementById("deliveryInfo").innerHTML;
	  popup.document.write(deliveryInfoContent);
	}
</script>
<style>
	* {
		margin: 0;
		padding: 0;
	}
	a {
		text-decoration: none;
	}
	button {
		border: 0;
		cursor: pointer;
	}
	ul, li {
		list-style: none;
	}
	.wrap {
		width: 100%;
		height: 100%;
		backgroun-color: #fff;
	}
	#spinner1 {
        border: none;       
        width: 100px; 
        height: 15px;
     }
     .prodInfo {
     	width: 100%
     }
     .infoImg {
     	width: 40%;
     	height: 100%;
     	float: left;
     }
     .prodInfoBox {
     	width: 60%;
     	height: 100%;
     	float: right;
     	padding-top: 70px;
     	padding-botton: 70px;
     }
     #deliveryInfo {
     	display: none;
     }
     .prodDetailInfo {
     	padding-top: 30
     }
     .delivery_guide {
     	color: blue;
     	text-decoration: underline;
     }
     .contents {
     	display:flex;
     	flex-direction: column;
     	gap: 16px;
     }
     .linkStyle {
     	font-size: 1.1em;
     }
     .reviewMain{
     	display:flex;
     	flex-direction: column;
     	gap:12px;
     }
     .reviewStyle {
     	border-bottom: 1px solid grey;
     }
     .writeLink {
     	display: block;
     	margin-bottom: 16px;
     }
</style>
</head>
<body>
	<div class="wrap">	
		<div class="containerDetailProd">
			<div class="contents">
				<div class="subContent">
					<div class="navigation">
						<a href="${contextPath}" class="naviHome"><img src="${contextPath}/resources/images/home.png"></a>
					</div>
				</div>
				<div class="contentProd">
					<div class="prodInfo">
						<div class="infoImg">
							<img src="${contextPath}/resources/images/mong.png" width="500px" height="400px">
						</div>					
						<div class="prodInfoBox">
							<form method="post" id="frmProduct" name="frmProduct" action="${contextPath}/order/addCart.do">
								<ul>
									<li><h3>${product.prodName}</h3></li>
									<li>정가 <span class="prodOriginPrice"><fmt:formatNumber pattern="###,###,###" value="${product.prodPrice}"/>0원</span></li>
									<li>판매가 <span class="prodPrice"><fmt:formatNumber pattern="###,###,###" value="${((product.prodPrice * (100 - product.productSellerDTO.discountRate)) * 0.01)}"/>원</span></li>
									<li>할인율 <span class="discountRate">${product.productSellerDTO.discountRate}%</span></li>
									<li>구매혜택(예상 적립금) <span class="benefit"><fmt:formatNumber pattern="###,###,###" value="${((product.prodPrice * (100 - product.productSellerDTO.discountRate)) * 0.1)}"/>원</span></li>
									<li>배송비/주문시 결제(선결제) <span class="deliveryPrice"><fmt:formatNumber pattern="###,###,###" value="${product.productSellerDTO.deliveryPrice}"></fmt:formatNumber>원</span>
										<a class="delivery_guide" onclick="fnDeliveryInfo()">배송비 안내(자세히 보기)</a>
										<div id="deliveryInfo">
											<h3><strong>금액별 배송비</strong></h3>
											<h5>3만원 이상 무료 배송</h5>
											<h3><strong>지역별 추가 배송비</strong></h3>
											<h5>제주도 : 4000원</h5>
											<h5>도서산간 : 4000원~9000원</h5>
										</div>
									</li>
								</ul>										
								<hr>											
								<div>
									수량(최대 구매 가능한 상품개수는 10개입니다.)
								    <div>
					                    <label for="spinner">주문수량</label>
					                    <span><input type="text" id="spinner" name="amount" value="0"/></span>
					                    <div><input type="text" id="spinner1" value="총 상품금액 :" readOnly=readOnly size= "3"/><span class="sum">0원</span></div>
					                </div>
								</div>
								<div>
									<input type="hidden" name="prodNo" value="${product.prodNo}">
									<button>장바구니로 담기</button>
								</div>
							</form>					
						</div>													
					</div>															
				</div>
				<div class="prodDetailTab">
					<a href="#detail" class="linkStyle">상품상세정보</a>
					<a href="#review" class="linkStyle">상품리뷰</a>
					<a href="#qna" class="linkStyle">상품문의</a>
					<a href="#delivery" class="linkStyle">배송/교환/반품</a>
				</div>
				<div class="detail" id="detail">
					<div><h1>${product.prodContent}</h1></div>								
				</div>
				<form action="${contextPath}/product/review.do?prodNo=${product.prodNo}" method="post">
				
				</form>
				
				<div class="review" id="review">
					<hr>
					<div class="reviewContent">
						<div class="btnReviewWrite">
							<div class="reviewInfomation">
								<div>구매하신 상품에 대한 리뷰를 작성 즉시 최대 500원의 적립금을 즉시 지급해드립니다.</div>
								<div>(텍스트 리뷰 300원/포토 리뷰 500원)</div>
								<div>단, 동일한 상품/옵션에 대해서는 최초 1회에 한해 적립금이 지급됩니다.</div>
							</div>
							<div>
								<input type="hidden" name="userId" value="${sessionScope.loginId}">
								<input type="hidden" name="orderDetailNo" value="${review.orderDetailNo}">
								<a href="${contextPath}/product/review.do?prodNo=${product.prodNo}" class="writeLink">리뷰 작성하러가기</a>
							</div>
						</div>
						<div class="reviewBox">
							<div class="reviewMain">	
								<c:forEach items="${reviews}" var="review">
									<div class="reviewStyle">
										<div class="reviewStarInfo">
											<img src="${contextPath}/resources/images/mong.png" width="20px">
											<span class="reviewStar">${review.prodScore}</span>
										</div>
										<div class="reviewWriterInfo">
											<span class="reviewWriter">${review.reviewWriter}</span>
											<span class="reviewRegDate">${review.reviewRegDate}</span>
										</div>
										<div class="reviewContentInfo">${review.reviewContent}</div>
									</div>										
								</c:forEach>										
							</div>
							<div>
								${pagination}
							</div>
						</div>
					</div>
				</div>
				<div class="qna" id="qna">
					<h4>상품문의</h4>
					<hr>
					<div class="qnaContent">
						<div class="btnQnaWrite">
							<a href="${contextPath}/product/qna.do?prodNo=${product.prodNo}" class="writeLink">문의 작성하러가기</a>
						</div>
						<div class="qnaBox">
							<div class="qnaList">
								<table>
									<thead>
										<tr>
											<td>문의번호</td>
											<td>상품명/제목</td>
											<td>작성일자</td>
											<td>답변상태</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qnaList}" var="qna" varStatus="q">
											<tr>
												<td>${qna.qnaNo}</td>
												<td>${qna.productDTO.prodName}/${qna.qnaTitle}'</td>
												<td>${qna.qnaRegDate}</td>
												<td>
													<c:choose>
														<c:when test="${qna.isAnswer == 0}">답변대기중</c:when>
														<c:when test="${qna.isAnswer == 1}">답변완료</c:when>
													</c:choose>
												</td>
											</tr>													
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div>
								${pagination}
							</div>
						</div>
					</div>
				</div>
				<div class="delivery" id="delivery">
					<h4>배송/교환/반품</h4>
					<hr>
					<ul>
						<li>배송, 취소, 교환, 반품 안내 내용 작성</li>
						<li>판매자 지정 택배사 : 몽몽택배</li>
						<li>소비자 부담 배송비 : 반품의 경우 편도 2,500원(단, 최초 배송비 무료인 경우 5,000원), 교환의 경우 5,000원</li>
						<li>보내실 주소 : (주)몽몽</li>
						<li>배송방법 : 순차 배송</li>
						<li>
							반품/교환 사유에 따른 요청가능 기간
							<ul>
								<li>구매자 단순 변심은 상품 수령 후 7일 이내(구매자 반품 배송비 부담)</li>
								<li>표시/광고와 상이하거나 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내(판매자 반품 배송비 부담)</li>
							</ul>
						</li>
						<li>
							반품/교환 불가능 사유
							<ul>
								<li>반품요청기간이 지난 경우</li>
								<li>구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우</li>
								<li>구매자의 책임 있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우</li>
								<li>구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
								<li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
								<li>고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우</li>
								<li>복제가 가능한 상품 등의 포장을 훼손한 경우</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>