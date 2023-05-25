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
<link rel="stylesheet" href="${contextPath }/resources/css/default.css">
</head>
<body>

  <!-- 상단바 영역 -->
  <div id="mypageTop">
    <table>
      <tr>
        <td rowspan="2">
          ${sessionScope.loginId}님!
        </td>
        <td>주문/배송</td>
        <td>쿠폰</td>
        <td>적립금</td>
      </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
        </tr>
    </table>
  </div>
  
  <!-- 좌측 목록 -->
  <div id="mypageSidebar">
    <div>
      <h4>주문 관리</h4>
      <ul>
        <li><a href="${contextPath }/mypage/orderlist.form">주문조회</a></li>
        <li><a href="${contextPath }/mypage/cancelOrder.form">취소/반품/교환</a></li>
      </ul>
    </div>
    <div>
      <h4>혜택 관리</h4>
      <ul>
        <li><a href="${contextPath }/mypage/coupon.form">쿠폰 조회</a></li>
        <li><a href="${contextPath }/mypage/point.form">적립금 조회</a></li>
      </ul>
    </div>
    <div>
      <h4>나의 활동</h4>
      <ul>
        <li><a href="${contextPath }/mypage/reviewlist.form">상품리뷰</a></li>
        <li><a href="${contextPath }/mypage/productqnalist.form">상품문의</a></li>
        <li><a href="${contextPath }/mypage/csqnalist.form">1:1문의</a></li>
      </ul>
    </div>
    <div>
      <h4>정보 관리</h4>
      <ul>
        <li><a href="${contextPath }/mypage/modifyInfo.form">개인 정보 수정</a></li>
        <li><a href="${contextPath }/mypage/addresslist.form">배송지 관리</a></li>
        <li><a href="${contextPath }/mypage/leave.form">회원 탈퇴</a></li>
      </ul>
    </div>
    <div>
      <h4><a href="#">판매자 페이지</a></h4>
    </div>
  </div>

</body>
</html>