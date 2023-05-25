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
<style>
  #footerWrapper {
  height: 100px;
  background-color: #f8f8f8;
  position: relative;
  display: flex;
  }
</style>
<script>
  $(function(){
	  
	  $('#btnCs').on('click', function(){
		  location.href="${contextPath}/1:1문의 매핑";
	  })
	  
	  $('#btnNotice').on('click', function(){
		  location.href="${contextPath}/공지사항 매핑";
	  })
	  
  })
</script>
</head>
<body>

  <div id="footerWrapper">
    <div id="info">
      <div>몽몽 고객센터</div>
      <div>1234-5678</div>
      <div>평일 오전 09:00 ~ 오후 06:00<br>주말 및 공휴일은 휴무입니다.</div>
    </div>
    <div id="button">
      <div><input type="button" id="btnCs" value="1:1 문의"></div>
      <div><input type="button" id="btnNotice" value="공지사항"></div>
    </div>
  </div>

</body>
</html>