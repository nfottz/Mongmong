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

	//모두 동의
	function fnCheckAll() {
		$('#checkAll').on('click', function(){
			$('.checkOne').prop('checked', $(this).prop('checked'));
		})
	}
	
	// 개별 선택
	function fnCheckOne() {
		let chkOne = $('.checkOne');  
		$('.checkOne').on('click', function(){
			let chkCnt = 0;
			for(let i = 0; i < chkOne.length; i++){      
				chkCnt += $(chkOne[i]).prop('checked');  
			}
			$('#checkAll').prop('checked', chkCnt == chkOne.length);  
		})
	}
	
	function fnModifyAmount() {
		$('.btnModifyAmount').on('click', function(){
			location.href = '${contextPath}/order/modifyCartAmount.do?prodNo=' + $(this).next().val() + '&amount=' + $(this).parent().prev().val();
		})
	}
	
	
	// 선택 삭제
	function fnDeleteList() {
		$('#deleteCartList').on('click', function(event){
			if($('.checkOne:checked').length == 0){
				alert('장바구니에서 선택된 상품이 없습니다.');
				event.preventDefault();
				return;
			}
			if(confirm('장바구니에서 선택한 상품을 모두 삭제할까요?') == false){
				event.preventDefault();
				return;
			}
		})
	}
	
	// 선택 구매
	function fnAddOrderList() {
		$('#addProductOrder').on('click', function(event){
			if($('.checkOne:checked').length == 0){
				alert('장바구니에서 선택된 상품이 없습니다.');
				event.preventDefault();
				return;
			}
			if(confirm('장바구니에서 선택한 상품을 모두 구매할까요?') == false){
				event.preventDefault();
				return;
			} else {
			    $('.checkOne').each(function() {
				    const isChecked = $(this).prop('checked');
				    if(!isChecked) {
				      $(this).next().remove();
					}
			    })
			}
		})
	}
	
	function fnGoShopping() {
		$('#btnGoShopping').on('click', function(event){
			if(confirm('상품목록 페이지로 이동하시겠습니까?')){
				location.href = '${contextPath}/product/pagination.do';
			} else {
				event.preventDefault();
				return;
			}
		})
		
	}
	
	function fnTotalPrice() {
	    var totalPrice = 0;
	    var totalDeliveryPrice = 0;
	    var totalPoint = 0;
	    var totalPay = 0;
	    
	    $(".tableTotalPrice").each(function() {
		      var Price = parseInt($(this).text().replace(/[^0-9]/g, ""));
		      if (!isNaN(Price)) {
		    	  totalPrice += Price;
		      }
	    });
	    
	    $(".tableDC .tablePoint").each(function() {
		      var point = parseInt($(this).text().replace(/[^0-9]/g, ""));
		      if (!isNaN(point)) {
		    	  totalPoint += point;
		      }
	    });
	    if(totalPrice <= 30000) {
			$('.tableDeliveryPrice').each(function() {
		      var deliveryPrice = parseInt($(this).val().replace(/[^0-9]/g, ""));
		      if (!isNaN(deliveryPrice) && deliveryPrice > totalDeliveryPrice) {
		    	  totalDeliveryPrice = deliveryPrice;
		        }
		    });
	    }
	    totalPay = totalPrice + totalDeliveryPrice;
	    
	    $('#totalOrderPrice').text(totalPrice.toLocaleString());
    	$('#totalDeliveryPrice').text(totalDeliveryPrice.toLocaleString());
	    $('#totalPoint').text(totalPoint.toLocaleString());
		$('#totalPay').text(totalPay.toLocaleString());
	}
	
	// 함수 호출
	$(function(){
		fnCheckAll();
		fnCheckOne();
		fnModifyAmount();
		fnDeleteList();
		fnAddOrderList();
		fnGoShopping();
		fnTotalPrice();
		//fnGoProductOrder();
		
		let modifyResult = '${modifyResult}';  
		if(modifyResult != '') {
			if(modifyResult == '1'){
				alert('상품의 수량이 수정되었습니다.');
			} else {
				alert('상품 수량 수정에 실패했습니다.');
			}
		}
		let addCartResult = '${addCartResult}';  
		if(addCartResult != '') {
			if(addCartResult == '0'){
				alert('장바구니 추가에 실패했습니다.');
			}
		}
		
	})

</script>
</head>
<body>

	<h1>장바구니</h1>
	
	<hr>
	
	<form id="frmCart">
		<div id="cartwrap">
			<table border="1">
				<thead>
					<tr>
						<td><input type="checkbox" id="checkAll"></td>
						<td>상품명/옵션</td>
						<td>수량</td>
						<td>가격</td>
						<td>할인/적립</td>
						<td>합계금액</td>
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
									<input type="checkbox" id="checkOne${cartItem.cartNo}" class="checkOne" name="cartNoList" value="${cartItem.cartNo}">
									<input type="hidden" name="prodNoList" value="${cartItem.prodNo}">
								</td>
								<td>
									<div>
										<img src="${contextPath}/resources/images/mong.png" width="50px" height="50px">
									</div>
									<span>
										<a href="${contextPath}/product/detail.do?prodNo=${cartItem.prodNo}">${cartItem.prodName}</a>
									</span>
								</td>
								<td>
									<input type="text" value="${cartItem.amount}" id="cartAmount${vs.index}" size="5">
									<div>
										<input type="button" value="수정" class="btnModifyAmount" id="modifyAmount${vs.index}">
										<input type="hidden" value="${cartItem.prodNo}">
									</div>
								</td>
								<td class="cartItemPrice">
									<fmt:formatNumber pattern="###,###,###" value="${cartItem.prodPrice}"/> <span>원</span>
								</td>
								<td class="tableDC">
									<div>할인율 : ${cartItem.discountRate} %</div>
									<div class="tablePoint">적립금 : <fmt:formatNumber pattern="###,###,###" value="${cartItem.totalPrice * 0.1}" /><span> point</span></div>
								</td>
								<td class="tableTotalPrice">
									<fmt:formatNumber pattern="###,###,###" value="${cartItem.totalPrice}" /> 원
									<input type="hidden" class="tableDeliveryPrice" value="${cartItem.deliveryPrice}" >
								</td>
							</tr>
						</c:forEach>
					</c:if>
								
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div>
								<button type="submit" formaction="${contextPath}/order/removeCartList.do" formmethod="post" id="deleteCartList">선택 삭제</button>
								<input type="button" id="btnGoShopping" value="계속쇼핑하기">
							</div>
						</td>
					<tr>
				</tfoot>
			</table>
		</div>
	
	
	<hr>
	
	<div id="paywrap">
		<div>
			총수량:<span id="totalAmount">${fn:length(cartList)}</span>개 |
			총주문금액 <span id="totalOrderPrice"></span>원 |
			배송비 <span id="totalDeliveryPrice"></span>원 |
			적립예정 적립금 <span id="totalPoint"></span>point |
			<span id="deliveryText">30,000원 이상 배송비 무료</span> |
			결제예상금액 <span id="totalPay"></span>원
		</div>
	</div>
	
	<hr>
	<div>
		<button type="submit" type="submit" formaction="${contextPath}/order/order.form" formmethod="get" id="addProductOrder">선택 상품 주문</button>
	</div>
	</form>

</body>

</html>