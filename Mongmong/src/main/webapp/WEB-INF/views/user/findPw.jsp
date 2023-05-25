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
<script src="${contextPath}/resources/js/lib/moment-with-locales.js"></script>
</head>
<body>

  <h2>비밀번호 찾기</h2>

  <form>
   
    <div>
      <label for="id">아이디</label>
      <input type="text" name="id" id="id">
    </div>
    
    <div>
      <label for="email">이메일</label>
      <input type="text" name="email" id="email">
    </div>
    
    <div>
      <input type="button" value="비밀번호찾기" id="btnFindPw">
    </div>
    
    <div>
      <a href="${contextPath}/user/login.form">로그인</a>
      <a href="${contextPath}/user/findId.form">아이디 찾기</a>
      <a href="${contextPath}/user/agree.form">회원가입</a>
    </div>
  </form>
    
    
  <hr>
  
  <div id="findResult"></div>

</body>
</html>