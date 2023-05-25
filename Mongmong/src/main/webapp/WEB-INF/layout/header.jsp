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
<link rel="stylesheet" href="${contextPath }/resources/css/header.css">
</head>
<body>

  <div id="main">
    <div id="mongmonglogo">
      <img src="${contextPath}/resources/images/mongmonglogo.png">
    </div>
    
    <div id="search">
      <form action="#">
        <input id="textSearch" type="text" placeholder="검색어를 입력해주세요"> 
        <button>검색</button>
      </form>
    </div>
    
      <div id="mypage">
        <a href="${contextPath }/mypage/mypageMain.form">마이 페이지</a>
      </div>
    
    <c:if test="${sessionScope.userType eq 0 }">
      <div id="adminpage">
        <a href="#"><img src="">관리자 페이지</a>
      </div>
    </c:if>
    
    <div id="cart1">
      <div id="cartCount">${cartCount }</div>
      <a href="${contextPath }/order/cartList.do" id="cart2"><img src="">장바구니</a>
    </div>
  </div>
  
  <div id="topbar">
    <ul id="leftTopbar">
      <li><a href="${contextPath }/">상품</a></li>
      <li><a href="${contextPath }/">정기배송</a></li>
      <li><a href="${contextPath }/">판매자 모아보기</a></li>
      <li><a href="${contextPath }/">포토리뷰</a></li>
    </ul>
    <ul>
      <c:if test="${sessionScope.loginId == null}">
        <li><a href="${contextPath }/user/joinlist.form">회원가입</a></li>
        <li><a href="${contextPath }/user/login.form">로그인</a></li>
      </c:if>
      <c:if test="${sessionScope.loginId != null }">
        <li><a href="${contextPath }/user/logout.do">로그아웃</a></li>
      </c:if>
      <li><a href="${contextPath }/">주문조회</a></li>
      <li><a href="${contextPath }/">고객센터</a></li>
    </ul>
  </div>

</body>
</html>