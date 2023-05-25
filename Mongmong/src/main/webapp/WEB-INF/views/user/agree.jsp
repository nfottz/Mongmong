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
  function fnCancel(){
	  $('#btnCancel').on('click', function(){
		  history.back();
	  })
  }
  
  function fnCheckAll(){
	  $('#checkAll').on('click', function(){
		  $('.checkOne').prop('checked', $(this).prop('checked'));
	  })
  }

  function fnCheckOne(){
	  let chkOne = $('.checkOne');
	  chkOne.on('click', function(){
		  let chkCnt = 0;
		  for(let i = 0; i < chkOne.length; i++){
			chkCnt += $(chkOne[i]).prop('checked');
			}
		  $('#checkAll').prop('checked', chkCnt == chkOne.length);
	  })
  }
  
  function fnGoJoinlist(){
	  $('#frmAgree').on('submit', function(event){
		  if($('#service').is(':checked') == false || $('#privacy').is(':checked') == false){
			  alert('필수 약관에 동의해야 가입할 수 있습니다.');
			  event.preventDefault();
			  return;
		  }
	  })
  }
  
  $(function(){
	  fnCancel();
	  fnCheckAll();
	  fnCheckOne();
	  fnGoJoinlist();
  })
</script>
</head>
<body>

  <h2>이용약관</h2>
  
  <form id="frmAgree" action="${contextPath }/user/join.form">
    <div>
      <input type="checkbox" id="checkAll">
      <label for="checkAll">몽몽 이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.</label>
    </div>
    
    <br>
    
    <div>
      <input type="checkbox" id="service" name="service" class="checkOne">
      <label for="service">몽몽 이용약관 동의(필수)</label>
      <div>
        <textarea>약관어찌구저찌구</textarea>
      </div>
    </div>
    
    <div>
      <input type="checkbox" id="privacy" name="privacy" class="checkOne">
      <label for="privacy">개인정보 수집 및 이용 동의(필수)</label>
      <div>
        <textarea>개인정보어찌구저찌구</textarea>
      </div>
    </div>
    
    <div>
      <input type="checkbox" id="location" name="location" class="checkOne">
      <label for="location">위치기반서비스 이용약관 동의(선택)</label>
      <div>
        <textarea>위치서비스 어찌구저찌구</textarea>
      </div>
    </div>
    
    <div>
      <input type="checkbox" id="event" name="event" class="checkOne">
      <label for="event">프로모션 정보 수신 동의(선택)</label>
      <div>
        <textarea>프로모션 어찌구저찌구</textarea>
      </div>
    </div>
    
    <br>
    
    <div>
      <input type="button" value="취소" id="btnCancel">
      <button>확인</button>
    </div>
  </form>

</body>
</html>