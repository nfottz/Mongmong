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
</head>
<body>
	<h1>쿠폰 적용하기</h1>
	<div>가능한 쿠폰만 노출됩니다. 실제 보유한 쿠폰과 차이가 날 수 있습니다.</div>
	<hr>
	<h3>상품쿠폰(여긴 상품에 적용할 쿠폰만,, 구현할 수 있나..)</h3>
	<table>
		<thead>
			<tr>
				<td>상품/옵션 정보</td>
				<td>상품금액/수량</td>
				<td>쿠폰 적용</td>
				<td>쿠폰 혜택</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="list" var="item">
				<tr>
					<td><img src="#" width="50px" height="50px">${productName}</td>
					<td>${price}</td>
					<td>사용 가능한 쿠폰이 없습니다.</td>
					<td>-</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h3>주문쿠폰</h3>
	<table>
		<thead>
			<tr>
				<td>(선택용)</td>
				<td>쿠폰</td>
				<td>사용조건</td>
				<td>사용기한</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="couponList" var="coupon" varStatus="vs">
				<tr id="coupon${vs.index}">
					<td><input type="checkbox" name="coupon" class="coupon"></td>
					<td>쿠폰이름</td>
					<td>쿠폰내용</td>
					<td>쿠폰유효기간</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">총 할인금액 ${price * coupon.couponDcRate} 원</td>
			<tr>
		</tfoot>
	</table>
	
	<hr>
	
	<div>
		<input type="button" id="btnUseCoupon" value="쿠폰 적용">
		<input type="button" id="btnCancel" value="취소">
	</div>
	
</body>
</html>