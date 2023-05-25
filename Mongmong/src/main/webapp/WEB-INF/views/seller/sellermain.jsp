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

</script>
</head>
<body>
   	
   	
   	
   	
	<hr>
	   	
   	<div>
   		<a href="${contextPath}/seller/addproduct.form">상품등록하기</a>
   		<a href="${contextPath}/seller/productdetail.do">상품관리</a>
   		<a href="${contextPath}/seller/reviewdetail.do">리뷰관리</a>
   		<a href="${contextPath}/seller/qnadetail.do">문의</a>
   	</div>
   	
   	<hr>
	<table border="1">
		<thead>
			<tr>
				<td>상품번호</td>
				<td>카테고리</td>
				<td>상품명</td>
				<td>가격</td>
				<td>상품수량</td>
				<td>상품상세설명</td>
				<td>등록일</td>
				<td>수정일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${prodList}" var="product">
				<tr>
					<td>${product.prodNo}</td>
					<td><a href="${contextPath}/seller/productdetail.do">${product.prodName}</a></td>
					<td>${product.prodPrice}</td>
					<td>${product.prodStock}</td>
					<td>${product.prodContent}</td>
					<td>${product.prodRegDate}</td>
					<td>${product.prodModDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>


