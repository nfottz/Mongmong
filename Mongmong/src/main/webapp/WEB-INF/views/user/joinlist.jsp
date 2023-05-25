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
  function fnGoJoin(){
	  location.href="${contextPath}/user/agree.form"
  }
</script>
</head>
<body>

  <h2>회원가입</h2>
  
  <div>
    <div><h4>몽몽 회원가입</h4></div>
    <div>
      <input type="button" id="goJoin" value="일반 회원가입" onclick="fnGoJoin()">
    </div>
    <div>
      판매자 회원가입은 몽몽회원가입으로만 가능하며, 승인에는 1~7일이 소요됩니다.
    </div>
  </div>
  
  <div>
    <div><h4>SNS 계정 회원가입</h4></div>
    <div>
      <input type="button" id="goNaverJoin" value="네이버 아이디로 회원가입" onclick="fnGoNaverJoin()">
    </div>
    <div>
      <input type="button" id="goKakaoJoin" value="카카오 아이디로 회원가입" onclick="fnGoKakaoJoin()">
    </div>
    <div>
      SNS계정을 연동하여 빠르고 쉽고 안전하게 회원가입 할 수 있습니다.
      이 과정에서 고객님의 데이터는 철저하게 보호됩니다.
    </div>
  </div>

</body>
</html>