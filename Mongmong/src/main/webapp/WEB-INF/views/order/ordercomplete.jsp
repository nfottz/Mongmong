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
	    $(".tableSalePrice .salePrice").each(function() {
		      var salePrice = parseInt($(this).val().replace(/[^0-9]/g, ""));
		    	  console.log(salePrice);
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

	function fnGoIndex(){
		$('#btnok').on('click', function(){
			location.href = '${contextPath}/index.do';
		})
	}
	$(function(){
		fnTotalPrice();
		fnGoIndex();
	})
</script>
</head>
<body>

	<h1>주문 완료</h1>
	<div id="colmpleteTextwrap">
		<div>
			결제가 완료되었습니다.
		</div>
		<div>
			감사합니다.
		</div>
	</div>
	<div id="completeContentwrap">
		<table border="1">
			<tbody>
				<tr>
					<td>결제수단</td>
					<td>
						${order.payMethod} <br>
						결제금액 : <fmt:formatNumber pattern="###,###,###" value="${order.orderTotalPrice}" /> 원
					</td>
				</tr>
				<tr>
					<td>주문번호</td>
					<td>${order.orderNo}</td>
				</tr>
				<tr>
					<td>주문일자</td>
					<td>${order.orderDate}</td>
				</tr>
				<tr>
					<td>주문상품</td>
					<td class="tableSalePrice">
						<c:forEach items="${cartList}" var="item">
							<div>${item.prodName} <c:if test="${item.amount > 1}" > ${item.amount}개 </c:if> </div>
							<input type="hidden" class="salePrice" value="${item.prodPrice * item.amount - item.totalPrice}">
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>주문자명</td>
					<td>${order.senderName}</td>
				</tr>
				<tr>
					<td>배송정보</td>
					<td>${order.orderName}</td>
				</tr>
				<tr>
					<td>상품금액</td>
					<td>
						<fmt:formatNumber pattern="###,###,###" value="${order.orderTotalPrice - order.deliveryPrice}" /> 원
					</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${order.deliveryPrice}" /> 원</td>
				</tr>
				<tr>
					<td>할인 및 적립</td>
					<td>할인: (-) <span id="totalSalePrice"></span> 원<br>
						적립 적립금: (+) <fmt:formatNumber pattern="###,###,###" value="${(order.orderTotalPrice - order.deliveryPrice) * order.pointRate * 0.01}" /> point</td>
				</tr>
				<tr>
					<td>총 결제금액</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${order.orderTotalPrice + order.deliveryPrice}" /> 원</td>
				</tr>
			</tbody>
		</table>
		<div id="btnokwrap">
			<input type="button" id="btnok" value="확인"> <!-- 메인페이지로 이동 -->
		</div>
	</div>
</body>
</html>