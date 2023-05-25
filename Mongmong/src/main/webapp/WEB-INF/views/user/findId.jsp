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
<script>
  function fnFindId(){
	  $('#btnFindId').on('click', function(){
		  $.ajax({
			  type: 'post',
			  url: '${contextPath}/user/findId.do',
			  contentType: 'apllication/json',
			  data: JSON.stringify({
				  name: $('#name').val();
			    email: $('#email').val();
			  }),
			  dataType: 'json',
			  success: function(resData){
				  if(resData.findUser != null){
					  let id = resData.findUser.id;
					  
				  } else {
					  $('#findResult').text('일치하는 회원이 없습니다.');
				  }
			  }
		  })
	  })
  }
</script>
</head>
<body>

  <div>

    <h2>아이디 찾기</h2>

    <div>
      <label for="name">*이름</label>
      <input type="text" name="name" id="name">
    </div>
    <div>
      <label for="email">*이메일</label>
      <input type="text" name="email" id="email">
    </div>
    <div>
      <input type="button" value="아이디찾기" id="btnFindId">
    </div>
    <div>
      <a href="${contextPath}/user/login.form">로그인</a>
      <a href="${contextPath}/user/findPw.form">비밀번호 찾기</a>
      <a href="${contextPath}/user/agree.form">회원가입</a>
    </div>
    
  </div>
  
  <hr>
  
  <div id="findResult"></div>

</body>
</html>