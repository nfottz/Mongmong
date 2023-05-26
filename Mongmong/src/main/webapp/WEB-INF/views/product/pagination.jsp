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
	$(function(){
		// recordPerPage의 변경
		$('#recordPerPage').on('change', function(){
			location.href = '${contextPath}/product/change/record.do?recordPerPage=' + $(this).val();	// session에 recordPerPage 올리기
		})
		// 세션에 저장된 recordPerPage값으로 <select> 태그의 값을 세팅
		let recordPerPage = '${sessionScope.recordPerPage}' == '' ? '12' : '${sessionScope.recordPerPage}';
		$('#recordPerPage').val(recordPerPage);
		// 제목을 클릭하면 정렬을 바꿈
		$('.sort').on('click', function(){
			location.href='${contextPath}/product/pagination.do?categoryNo=' + $(this).data('category_no') + '&column=' + $(this).data('column') + '&order=' + $(this).data('order') + '&page=${page}';
		})
	})
</script>
<style>
	* {
		margin: 0;
		padding: 0;
	}
	.prodInfoName {
		text-decoration: none;
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
		text-decoration: none;
	}
	body {
		width: 100%;
		height: 100%;
	}
	.subMain {
		padding-top: 30px;
		width: 20%;
		float: left;
	}
	.Main {
		box-sizing: border-box;
		width: 80%;
		float: right;
	}
	.sortList {
		display:flex;
		gap: 15px;
	}
	.prodList {
		display:flex;
		flex-wrap: wrap;
		gap: 8px;
	}
	.listStyle {
		width: 20%;
		min-width: 200px;
	}
	.pagination {
		padding-left: 200px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="containerMainlist">
			<div id="contents">
				<div id="subContent">
					<div class="navigation">
						<a href="${contextPath}" class="naviHome"><img src="${contextPath}/resources/images/home.png"></a>
					</div>
					<div class="subMain">
						<div class="cateMenu">
							<div class="cateTitle"><h3>카테고리</h3></div>
							<ul class="cateDepth0">
								<li class="cateParent on">
									<div><strong>사료</strong></div>
									<ul class="cateDepth1">
										<li><a href="${contextPath}/product/pagination.do?categoryNo=1">퍼피(1세 미만)</a></li>
										<li><a href="${contextPath}/product/pagination.do?categoryNo=2">시니어(7세 이상)</a></li>
										<li><a href="${contextPath}/product/pagination.do?categoryNo=3">전연령</a></li>
									</ul>
								</li>
								<li class="cateParent on">
									<div><strong>간식</strong></div>
									<ul class="cateDepth1">
										<li><a href="${contextPath}/product/pagination.do?categoryNo=4">껌</a></li>
										<li><a href="${contextPath}/product/pagination.do?categoryNo=5">동결건조간식</a></li>
										<li><a href="${contextPath}/product/pagination.do?categoryNo=6">육포</a></li>
									</ul>
								</li>
								<li class="cateParent on">
									<div><strong>장난감</strong></div>										
									<ul class="cateDepth1">
										<li><a href="${contextPath}/product/pagination.do?categoryNo=7">노즈워크</a></li>
										<li><a href="${contextPath}/product/pagination.do?categoryNo=8">봉제장난감</a></li>
									</ul>
								</li>
								<li class="cateParent on">
									<div><strong>배변용품</strong></div>
									<ul class="cateDepth1">
										<li><a href="${contextPath}/product/pagination.do?categoryNo=9">배변패드</a></li>
										<li><a href="${contextPath}/product/pagination.do?categoryNo=10">기저귀/팬티</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="Main">
						<div class="contentProduct">							
							<div class="Prods">
								<div class="prodContents">
									<div class="prodListTitle">
										<div class="prodCateTitle">
											<c:choose>
												<c:when test="${categoryNo == 1}"><h2>퍼피(1세 미만)</h2></c:when>
												<c:when test="${categoryNo == 2}"><h2>시니어(7세 이상)</h2></c:when>
												<c:when test="${categoryNo == 3}"><h2>전연령</h2></c:when>
												<c:when test="${categoryNo == 4}"><h2>껌</h2></c:when>
												<c:when test="${categoryNo == 5}"><h2>동결건조간식</h2></c:when>
												<c:when test="${categoryNo == 6}"><h2>육포</h2></c:when>
												<c:when test="${categoryNo == 7}"><h2>노즈워크</h2></c:when>
												<c:when test="${categoryNo == 8}"><h2>봉제장난감</h2></c:when>
												<c:when test="${categoryNo == 9}"><h2>배변패드</h2></c:when>
												<c:when test="${categoryNo == 10}"><h2>기저귀/팬티</h2></c:when>
											</c:choose>
										</div>
										<div class="sortList">
											<div class="prodSort">
												<span class="sort" data-category_no="${categoryNo}" data-column="PROD_STOCK" data-order="DESC">추천순</span>
												<span class="sort" data-category_no="${categoryNo}" data-column="DISCOUNT_RATE" data-order="DESC">판매인기순</span>
												<span class="sort" data-category_no="${categoryNo}" data-column="PROD_PRICE" data-order="ASC">낮은가격순</span>
												<span class="sort" data-category_no="${categoryNo}" data-column="PROD_PRICE" data-order="DESC">높은가격순</span>
												<span class="sort" data-category_no="${categoryNo}" data-column="PROD_REG_DATE" data-order="DESC">등록일순</span>
											</div>
											<div class="recordPerPage">
												<select id="recordPerPage">
													<option value="12" selected="selected">12개</option>
													<option value="24">24개</option>
													<option value="40">40개</option>
												</select>											
											</div>
										</div>
									</div>
									<ul class="prodList">
										<c:forEach items="${products}" var="prod">																								
											<li class="listStyle">
												<div class="prodBox">
													<input type="hidden" name="categoryName" value="${prod.productCategoryDTO.categoryName}">
													<input type="hidden" name="categoryNo" value="${categoryNo}">
													<div class="prodImgBox">
														<a href="${contextPath}/product/detail.do?prodNo=${prod.prodNo}"><img src="${contextPath}/resources/images/mong.png" width="200px"></a>
													</div>
													<div class="prodInfoBox">
														<div class="prodInfoName">
															<a href="${contextPath}/product/detail.do?prodNo=${prod.prodNo}"><strong class="prodName">${prod.prodName}</strong></a>
														</div>
														<div class="prodInfoPrice">
															<span><fmt:formatNumber pattern="###,###,###" value="${prod.prodPrice}"/>원</span>
															<div>
																<strong><span><fmt:formatNumber pattern="###,###,###" value="${((prod.prodPrice * (100 - prod.productSellerDTO.discountRate)) * 0.01)}"/>원</span></strong>
																<span>${prod.productSellerDTO.discountRate}%</span>																
															</div>
														</div>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>		
								</div>
							</div>
							<div class="pagination">
								${pagination}
							</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>