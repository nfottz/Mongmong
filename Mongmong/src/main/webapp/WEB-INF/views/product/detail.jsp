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
	function fnCart() {
		location.href='${contextPath}/order/addCart.do'
	}
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
			location.href='${contextPath}/product/review.do?prodNo=' + $(this).data('prod_no') + '&column=' + $(this).data('column') + '&order=' + $(this).data('order') + '&page=${page}';
		})
	})
</script>
</head>
<body>
	<div id="wrap">	
		<div id="containerDetailProd">
			<div id="contents">
				<div id="subContent">
					<div class="navigation">
						<a href="${contextPath}" class="naviHome"><img src="${contextPath}/resources/images/home.png"></a>
					</div>
				</div>
				<div class="contentProd">
					<div class="prodInfo">
						<div class="infoImg">
							<img src="${contextPath}/resources/images/product3-1.jpg" width="600px">
						</div>
						<div class="prodCartlink">										
							<a href="${contextPath}/order/addCart.do"><img src="${contextPath}/resources/images/cart.png"></a>
						</div>
						<div class="prodInfoBox">
							<form method="post" id="frmProduct" name="frmProduct">
								<ul>
									<li><h3>${product.prodName}</h3></li>
									<li>정가 <span class="prodOriginPrice"><fmt:formatNumber pattern="###,###,###" value="${product.prodPrice}"/>원</span></li>
									<li>판매가 <span class="prodPrice"><fmt:formatNumber pattern="###,###,###" value="${((product.prodPrice * (100 - product.productSellerDTO.discountRate)) * 0.01)}"/>원</span></li>
									<li>할인율 <span class="discountRate">${product.productSellerDTO.discountRate}%</span></li>
									<li>구매혜택(예상 적립금) <span class="benefit"><fmt:formatNumber pattern="###,###,###" value="${((product.prodPrice * (100 - product.productSellerDTO.discountRate)) * 0.1)}"/>원</span></li>
									<li>배송비/주문시 결제(선결제) <span class="deliveryPrice"><fmt:formatNumber pattern="###,###,###" value="${product.productSellerDTO.deliveryPrice}"></fmt:formatNumber>원</span>
										<p class="delivery_guide">배송비 안내</p>
										<div class="deliveryInfo">
											<div class="deliveryDetail" style="display:block">
												<div class="detailClose"><img src="${contextPath}/resources/images/close.png" alt="닫기"></div>
												<h3>금액별 배송비</h3>
												<h5>3만원 이상 무료 배송</h5>
												<h3>지역별 추가 배송비</h3>
												<h5>제주도 : 4000원</h5>
												<h5>도서산간 : 4000원~9000원</h5>
											</div>
										</div>
									</li>
								</ul>										
								<hr>											
								<div>
									수량(최대 구매 가능한 상품개수는 10개입니다.)
									<span class="CountCheck">
										<select name="amount">
                    						<c:forEach begin="1" end="10" var="i">
                    							<option value="${i}">${i}</option>
                    						</c:forEach>
               							</select>
               							&nbsp;개
									</span>
								</div>
							</form>					
						</div>	
						<hr>
						<div>
							총 상품금액 <span class="totalPrice"></span>
						</div>							
						<div>
							<input type="hidden" name="prodNo" value="${product.prodNo}">
							<input type="button" value="바로구매" onclick="fnCart()">
						</div>
					</div>
					<div class="prodDetailInfo">
						<div class="prodDetailContent">
							<div class='prodDetailTab'>
								<ul>
									<li class="on">
										<a href="#detail">상품상세정보</a>
									</li>
									<li class="on">
										<a href="#review">상품리뷰</a>
									</li>
									<li class="on">
										<a href="#qna">상품문의</a>
									</li>
									<li class="on">
										<a href="#delivery">배송/교환/반품</a>
									</li>
								</ul>
							</div>
							<div class="detail" id="detail">
								<div><h1>${product.prodContent}</h1></div>								
							</div>
							<div class="review" id="review">
								<h4>상품리뷰</h4>
								<hr>
								<div class="reviewContent">
									<div class="reviewGrade">
										<div class="reviewGradeInfpo">
											<h5>평점</h5>
											<strong>'리뷰 평점 가져오기'</strong>
											<div>'리뷰 발바닥 가져오기'</div>
										</div>
										<div class="reviewGradeCount">
											<ul>
												<li>
													<span><img src="${contextPath}/resources/images/star5.png"></span>
													<span>총 + '리뷰 개수 가져오기' + 개 작성</span>
												</li>
												<li>
													<span><img src="${contextPath}/resources/images/star4.png"></span>
													<span>총 + '리뷰 개수 가져오기' + 개 작성</span>
												</li>
												<li>
													<span><img src="${contextPath}/resources/images/star3.png"></span>
													<span>총 + '리뷰 개수 가져오기' + 개 작성</span>
												</li>
												<li>
													<span><img src="${contextPath}/resources/images/star2.png"></span>
													<span>총 + '리뷰 개수 가져오기' + 개 작성</span>
												</li>
												<li>
													<span><img src="${contextPath}/resources/images/star.png" width="18px"></span>
													<span>총 + '리뷰 개수 가져오기' + 개 작성</span>
												</li>
											</ul>
										</div>
										<div class='storePickInfo'>
											<div class="pickTitle">
												<span><img src="${contextPath}/resources/images/pick.png" width="15px"></span>
												<span><strong>스토어PICK</strong></span>
												<span>(판매자가 직접 선정한 베스트 리뷰)</span>
											</div>
											<div class="pickContent">
												<div class="pickReview">
													<div class="pickReviewInfo">
														<c:forEach items="${reviews}" var="review">
															<c:if test="${review.bestReview == 1}">
																<div class="pickReviewTitle">
																	<img src="${contextPath}/resources/images/mong.png" width="20px">
																	<span class="reviewStar">${review.prodScore}</span>
																	<span class="reviewWriter">${review.reviewWriter}</span>
																	<span class="reviewRegDate">${review.reviewRegDate}</span>
																</div>
																<div class="reviewContentInfo">${review.reviewContent}</div>															
															</c:if>
															<c:if test="${reviews.bestReview == 0}">
																<h2>판매자가 선정한 베스트 리뷰가 없습니다.</h2>
															</c:if>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="btnReviewWrite">
										<div class="reviewInfomation">
											<div>구매하신 상품에 대한 리뷰를 작성 즉시 최대 500원의 적립금을 즉시 지급해드립니다.</div>
											<div>(텍스트 리뷰 300원/포토 리뷰 500원)</div>
											<div>단, 동일한 상품/옵션에 대해서는 최초 1회에 한해 적립금이 지급됩니다.</div>
										</div>
										<span><a href="${contextPath}/product/review.do?prodNo=${product.prodNo}">리뷰 작성하러가기</a></span>
									</div>
									<div class="reviewBox">
										<div class="reviewSort">
											<span class="sort" data-prod_no="${prodNo}" data-column="PROD_REG_DATE" data-order="DESC">등록일순</span>
											<span class="sort" data-prod_no="${prodNo}" data-column="PROD_SCORE" data-order="DESC">평점높은순</span>
											<span class="sort" data-prod_no="${prodNo}" data-column="PROD_SCORE" data-order="ASC">평점낮은순</span>
										</div>
										<div class="reviewMain">	
											<img src="${contextPath}/resources/images/mong.png" width="20px">
											<c:forEach items="${reviews}" var="review">
												<div class="reviewStarInfo">
													<span class="reviewStar">${review.prodScore}</span>
												</div>
												<div class="reviewWriterInfo">
													<span class="reviewWriter">${review.reviewWriter}</span>
													<span class="reviewRegDate">${review.reviewRegDate}</span>
												</div>
												<div class="reviewContentInfo">${review.reviewContent}</div>											
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
										<a href="${contextPath}/product/qna.do?prodNo=${product.prodNo}">문의 작성하러가기</a>
									</div>
									<div class="qnaBox">
										<div class="qnaList">
											<table>
												<thead>
													<tr>
														<td>문의번호</td>
														<td>상품명/제목</td>
														<td>작성자</td>
														<td>작성일자</td>
														<td>답변상태</td>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${qnaList}" var="qna" varStatus="q">
														<tr>
															<td>${qna.qnaNo - q.index}</td>
															<td>${qna.ProductDTO.prodName}/${qna.qnaTitle}'</td>
															<td>${qna.qnaWriter}</td>
															<td>${qna.qnaRegDate}</td>
															<td>
																<c:choose>
																	<c:when test="${qna.qnaNo == 1}">상품</c:when>
																	<c:when test="${qna.qnaNo == 2}">배송</c:when>
																	<c:when test="${qna.qnaNo == 3}">반품/환불</c:when>
																	<c:when test="${qna.qnaNo == 4}">교환/변경</c:when>
																	<c:when test="${qna.qnaNo == 5}">기타</c:when>
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
			</div>
		</div>
	</div>
</body>
</html>