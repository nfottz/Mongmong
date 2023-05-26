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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

  function fnGoJoinlist(){
	  location.href = "${contextPath}/user/joinlist.form";
  }
  
  function fnLogin(){
	  
	  $('#frmLogin').on('submit', function(event){
		  if($('#id').val() == '' || $('#pw').val() == ''){
			  alert('아이디와 비밀번호를 모두 입력하세요.');
			  event.preventDefault();
			  return;
		  }
		
		if($('#chkRememberId').is(':checked')){
			$.cookie('rememberId', $('#id').val());
		} else P
		$.cookie('rememberId', '');
	  })
	  
  }
  
  function fnDisplayRememberId(){
	  
	  let rememberId = $.cookie('rememberId');
	  if(rememberId == ''){
		  $('#id').val('');
		  $('#chkRemeberId').prop('checked', false);
	  } else {
		  $('#id').val(rememberId);
	    $('#chkRemeberId').prop('checked', true);
	  }
	  
  }
  
  $(function(){
	  
	  $('#user').on('click', function(){
		  $('#wrapGuest').hide();
		  $('#wrapUser').show();
	  })
	  
	  $('#guest').on('click', function(){
		  $('#wrapUser').hide();
		  $('#wrapGuest').show();
	  })

	  $('#wrapGuest').hide();
	  
	  fnLogin();
	  fnDisplayRememberId();
  })
</script>
</head>
<body>

  <h2>로그인</h2>
  
  <span id="user">회원 로그인</span>
  <span id="guest">비회원 로그인</span>
  
  <div id="wrapUser">
    <form id="frmUser" method="post" action="${contextPath }/user/login.do">
      <input type="hidden" name="url" value="${url }">
      <div>
        <input type="text" name="id" placeholder="아이디">
      </div>
      <div>
        <input type="password" name="pw" placeholder="비밀번호">
      </div>
      <div>
        <button>로그인</button>
      </div>
      
      <div>
        <label for="chkRememberId">
          <input type="checkbox" id="chkRememberId" name="chkRememberId">
          아이디 저장
        </label>
        <label for="chkAutoLogin">
          <input type="checkbox" id="chkAutoLogin" name="chkAutoLogin">
          자동 로그인
        </label>
      </div>
    </form>
    
    <div>
      <a href="${contextPath }/user/findId.form">아이디 찾기</a>
      <a href="${contextPath }/user/findPw.form">비밀번호 찾기</a>
    </div>
    
    <!-- 
    <div>
      네이버/카카오 로그인
    </div>
     -->
     
    <div>
      <div>
        아직도 몽몽 회원이 아니신가요?
        지금 바로 가입하고 특별한 혜택을 받아보세요!
      </div>
      <input type="button" id="goJoinlist" value="회원가입" onclick="fnGoJoinlist()">
    </div>
  </div>
  

  <div id="wrapGuest">
    <form id="frmGuest" method="post" action="#">
      <div>
        <input type="text" name="orderNo" placeholder="주문번호">
      </div>
      <div>
        <input type="text" name="contact" placeholder="연락처">
      </div>
      <div>
        <button>주문조회하기</button>
      </div>
      <div></div>
    </form>
  </div>
  
  <div>

  </div>

</body>
</html>