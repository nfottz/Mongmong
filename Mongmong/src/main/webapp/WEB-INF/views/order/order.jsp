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

	function fnGoCart() {
		location.href = '${contextPath}/order/cartList.do'
	}

	function fnUsecouponPopup(){
		window.open("${contextPath}/order/usecoupon.form","팝업 테스트","width=500, height=600, top=10, left=10");
	}
	
	function fnTotalPrice() {
	    var totalPrice = 0;
	    var totalDeliveryPrice = 0;
	    var totalSalePrice = 0
	    var totalPoint = 0;
	    var totalPay = 0;
	    
	    $(".tableTotalPrice").each(function() {
		      var Price = parseInt($(this).text().replace(/[^0-9]/g, ""));
		      if (!isNaN(Price)) {
		    	  totalPrice += Price;
		      }
	    });
	    $(".tableDeliveryPrice").each(function() {
		      var DeliveryPrice = parseInt($(this).text().replace(/[^0-9]/g, ""));
		      if (!isNaN(DeliveryPrice)) {
		    	  totalDeliveryPrice += DeliveryPrice;
		      }
	    });
	    $(".tableDC .tableDiscount .salePrice").each(function() {
		      var salePrice = parseInt($(this).val().replace(/[^0-9]/g, ""));
		      if (!isNaN(salePrice)) {
		    	  totalSalePrice += salePrice;
		      }
	    });
	    $(".tableDC .tablePoint").each(function() {
		      var point = parseInt($(this).text().replace(/[^0-9]/g, ""));
		      if (!isNaN(point)) {
		    	  totalPoint += point;
		      }
	    });
	    totalPay = totalPrice + totalDeliveryPrice;
	    
	    $('#totalOrderPrice').text(totalPrice.toLocaleString());
	    $('#totalDeliveryPrice').text(totalDeliveryPrice.toLocaleString());
	    $('#totalSalePrice').text(totalSalePrice.toLocaleString());
	    $('#totalPoint').text(totalPoint.toLocaleString());
		$('#totalPay').text(totalPay.toLocaleString());
		
		$('#orderDeliveryPrice').val(totalDeliveryPrice);
		$('#orderTotalPrice').val(totalPay);
	}
	
	function fnUserAddress() {
		$.ajax({
			type: 'get',
			url: '${contextPath}/order/userAddresss.do',
			data: 'userNo=' + ${userInfo.userNo},
			dataType: 'json',
			success: function(resData){
				$('#postcode').val(resData.userAddresss.postcode);
				$('#roadAddress').val(resData.userAddresss.roadAddress);
				$('#jibunAddress').val(resData.userAddresss.jibunAddress);
				$('#detailAddress').val(resData.userAddresss.detailAddress);
				$('#extraAddress').val(resData.userAddresss.extraAddress); 
			}
		})
	}
	function fnInputAddress() {
		$('#directInputAddress').on('click', function(){
			$('#postcode').val('');
			$('#roadAddress').val('');
			$('#jibunAddress').val('');
			$('#detailAddress').val('');
			$('#extraAddress').val('');
		})
		$('#defaultAddress').on('click', function(){
			fnUserAddress();
		})
	}
	
	function fnFrmAgreeSubmit(){
		$('#frmOrder').on('submit', function(event){
	  		if( $('#purchaseAgreement').is(':checked') == false ){
				alert('청약의사 재확인을 동의해 주셔야 주문을 진행하실 수 있습니다.');
				event.preventDefault();
				return;
			}
		})
	}
	
	
	// 함수 호출
	$(function(){
		fnTotalPrice();
		fnUserAddress();
		fnInputAddress();
		fnFrmAgreeSubmit();
		
	})

</script>
</head>
<body>
	
	<div id="frmwrap">
		<form id="frmOrder" method="post" action="${contextPath}/order/order.do">
		<div id="orderitemswrap">
			<div id="orderTitlewrap">
				<h1>주문/결제</h1>
			</div>
			<div id="orderListwrap">
				<table border="1">
					<thead>
						<tr>
							<td>상품명/옵션</td>
							<td>수량</td>
							<td>가격</td>
							<td>할인/적립</td>
							<td>합계금액</td>
							<td>배송비</td>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty cartList}">
							<tr>
								<td colspan="6">장바구니가 비어있습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty cartList}">
							<c:forEach items="${cartList}" var="cartItem" varStatus="vs">
								<tr>
									<td>
										<div>
											<img src="#" width="50px" height="50px">
										</div>
										<div>${cartItem.prodName}</div>
									</td>
									<td>
										<div>${cartItem.amount}</div>
										<input type="hidden" name="prodNo" value="${cartItem.prodNo}">
										<input type="hidden" name="prodName" value="${cartItem.prodName}">
										<input type="hidden" name="prodAmount" value="${cartItem.amount}">
									</td>
									<td class="cartItemPrice">
										<fmt:formatNumber pattern="###,###,###" value="${cartItem.prodPrice}"/> <span>원</span>
									</td>
									<td class="tableDC">
										<div class="tableDiscount">
											할인율 : ${cartItem.discountRate} %
											<input type="hidden" class="salePrice" value="${(cartItem.prodPrice * cartItem.amount) - cartItem.totalPrice}">
										</div>
										<div class="tablePoint">적립금 : <fmt:formatNumber pattern="###,###,###" value="${cartItem.totalPrice * 0.1}" /><span>point</span></div>
									</td>
									<td class="tableTotalPrice"><fmt:formatNumber pattern="###,###,###" value="${cartItem.totalPrice}" /> 원</td>
									<td class="tableDeliveryPrice"><fmt:formatNumber pattern="###,###,###" value="${cartItem.deliveryPrice}" /> 원</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
								<div>
									<input type="button" value="장바구니로 가기" id="goCart" onclick="fnGoCart()">
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	
	
		
		<div id="senderinfowrap">
			<div id="senderinfoTitlewrap">
				<h3>주문자 정보</h3>
			</div>
			
			<div>
		        <span class="necessary">*</span><label for="senderName">보내는 분</label>
		        <input type="text" name="senderName" id="senderName" value="${userInfo.userName}">
		    </div>
			<div>
				<span class="necessary">*</span><label for="senderTel">연락처</label>
		        <input type="text" name="senderTel" id="senderTel" value="${userInfo.contact}">
			</div>
			<div>
				<span class="necessary">*</span><label for="senderEmail">이메일</label>
		        <input type="text" name="senderEmail" id="senderEmail" value="${userInfo.email}">
		        <select name="selectEmailList" id="selectEmailList">
		        	<option value="@naver.com">naver.com</option>
		        	<option value="@hanmail.net">hanmail.net</option>
		        	<option value="@daum.com">daum.net</option>
		        	<option value="@nate.com">nate.com</option>
		        	<option value="@gmail.com">gmail.com</option>
		        </select>
			</div>
		</div>
				
		<div id="deliveryinfowrap">
			<div id="deliveryinfoTitlewrap">
				<h3>배송 정보</h3>
			</div>
			<div id="deliveryinfoList">
				<div>
					<div>
						배송지 확인
					</div>
					<div>
						<input type="radio" name="address" id="defaultAddress" value="defaultAddress" checked="checked">
						<label for="defaultAddress">기본 배송지</label>
						<input type="radio" name="address" id="directInputAddress" value="directInputAddress">
						<label for="directInputAddress">직접 입력</label>
						<input type="button" id="btnMyAddress" value="내 주소">집 회사 머머머 3개 나오게끔 버튼이벤트
					</div>
				</div>
				<div>
					<div>
						<span class="necessary">*</span><label for="orderName">받는 분</label>
						<input type="text" name="orderName" id="orderName" value="${userInfo.userName}">
					</div>
				</div>
				<div>
					<div>
						<span class="necessary">*</span>주소
					</div>
					<div>
						<input type="text" onclick="execDaumPostcode()" name="postcode" id="postcode" placeholder="우편번호" readonly="readonly">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
						<input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
						<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
						
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
							function execDaumPostcode() {
								new daum.Postcode({
									oncomplete: function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
										// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var roadAddr = data.roadAddress; // 도로명 주소 변수
										var extraRoadAddr = ''; // 참고 항목 변수
						
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
											extraRoadAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if(data.buildingName !== '' && data.apartment === 'Y'){
											extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if(extraRoadAddr !== ''){
											extraRoadAddr = ' (' + extraRoadAddr + ')';
										}
						
										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document.getElementById('postcode').value = data.zonecode;
										document.getElementById("roadAddress").value = roadAddr;
										document.getElementById("jibunAddress").value = data.jibunAddress;
										
										// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
										if(roadAddr !== ''){
											document.getElementById("extraAddress").value = extraRoadAddr;
										} else {
											document.getElementById("extraAddress").value = '';
										}
						
										var guideTextBox = document.getElementById("guide");
										// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
										if(data.autoRoadAddress) {
											var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
											guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
											guideTextBox.style.display = 'block';
						
										} else if(data.autoJibunAddress) {
											var expJibunAddr = data.autoJibunAddress;
											guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
											guideTextBox.style.display = 'block';
										} else {
											guideTextBox.innerHTML = '';
											guideTextBox.style.display = 'none';
										}
									}
								}).open();
							}
						</script>
					</div>
				</div>
				<div>
					<div>
						<span class="necessary">*</span><label for="contact">연락처</label>
						<input type="text" name="contact" id="contact" value="${userInfo.contact}">
					</div>
				</div>
				<div>
					<div>
						<label for="orderRequest">배송 요청사항</label>
						<input type="text" name="orderRequest" id="orderRequest" maxlength="100">
					</div>
				</div>
				<div>
					<div>
						
					</div>
				</div>
			</div>
		</div>

		<div id="paymentmethodwrap">		
			<div id="paymentmethodTitlewrap">
				<h3>결제 수단</h3>
			</div>
			<div id="paymentmethod">
				<div>
					<div>
						일반결제
					</div>
					<div>
						<input type="radio" name="payMethod" id="kakaopay" value="kakaopay" checked="checked">
						<label for="kakaopay">카카오페이</label>
						<input type="radio" name="payMethod" id="creditcard" value="creditcard">
						<label for="creditcard">신용카드</label>
						<input type="radio" name="payMethod" id="accountTransfer" value="accountTransfer">
						<label for="accountTransfer">계좌이체</label>
						<input type="radio" name="payMethod" id="가상계좌" value="virtualAccount">
						<label for="가상계좌">가상계좌</label>
					</div>
				</div>
			</div>
		</div>

		<div id="paymentdetailwrap">
			<div id="paymentdetailTitle">
				<h3>결제 내용</h3>
			</div>
			<div id="paymentdetail">
				<div>
					상품 합계 금액 <span id="totalOrderPrice"></span> 원
				</div>
				<div>
					배송비 <span id="totalDeliveryPrice"></span> 원
					<input type="hidden" name="deliveryPrice" id="orderDeliveryPrice">
				</div>
				<div>
					할인 및 적립 
					할인 : (-)<span id="totalSalePrice"></span> 원 
					적립 : (+)<span id="totalPoint"></span> point
				</div>
					
				<div>
					쿠폰 사용
					주문할인 : (-) 3,000원
					<div>
						<input type="button" value="쿠폰 조회 및 적용" onclick="fnUsecouponPopup()">
					</div>
				</div>
				<div>
					적립금 사용
					<input type="text" id="membershipPoint" name="membershipPoint" value="0"> 원
				</div>
				<div>
					<input type="checkbox" id="usePointAll" onclick="fnUsePointAll()">
					<label for="usePointAll">전액 사용하기</label>
					<span class="myPointSum">(보유 적립금 : 0 원)</span>
				</div>
				<div>
					<span>30,000원</span> 구매시 무료배송
				</div>
				<div>
					최종 결제 금액
					 <strong id="totalPay"></strong> 원
					 <input type="hidden" id="orderTotalPrice" name="orderTotalPrice">
				</div>
			</div>

			<hr>

			<div>
				<input type="checkbox" name="purchaseAgreement" id="purchaseAgreement">
				<label for="purchaseAgreement">(필수) 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
			</div>
			<div id="btnpay">
				<button>결제하기</button>
			</div>
		</div>

		</form>
	</div>
</body>
</html>