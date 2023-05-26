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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
  function fnFindId(){
	  $('#btnFindId').on('click', function(){
		  $.ajax({
			  type: 'post',
			  url: '${contextPath}/user/findId.do',
			  contentType: 'application/json',
			  data: JSON.stringify({
				  userName: $('#userName').val(),
			    email: $('#email').val()
			  }),
			  dataType: 'json',
			  success: function(resData){
				  console.log(resData);
				  if(resData.findUser != null){
					  let id = resData.findUser.userId;
					  moment.locale('ko-KR');
					  $('#findResult').html('회원님의 아이디는 ' + id + '입니다.<br>(가입일: ' + moment(resData.findUser.joinedAt).format("YYYY년 MM월 DD일 a h:mm:ss") + ')');
				  } else {
					  $('#findResult').text('일치하는 회원이 없습니다.');
				  }
			  }
		  });
	  });
  }
  
  $(function(){
	  fnFindId();
  })
</script>
</head>
<body>

  <div>

    <h2>아이디 찾기</h2>

    <div>
      <label for="userName">*이름</label>
      <input type="text" name="userName" id="userName">
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