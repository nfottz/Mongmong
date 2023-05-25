<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath }/resources/css/default.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/js/lib/moment-with-locales.js"></script>
<script>
  $(function(){
	  $('#btnActive').on('click', function(){
		  location.href = '${contextPath}/user/active.do';
	  })
	  $('#btnCancel').on('click', function(){
		  location.href = '${contextPath}/index.do';
	  })
  })
</script>
</head>
<body>

    <h2>휴면계정 복구</h2>
    
    <div>
      <span id="id">${sessionScope.sleepUserId}</span>님은 1년 이상 로그인하지 않아 관련 법령에 의해서 휴면회원으로 전환되었습니다.
    </div>
    
    <div>
      <input type="button" value="휴면해제하기" id="btnActive">
      <input type="button" value="취소" id="btnCancel">
    </div>

</body>
</html>