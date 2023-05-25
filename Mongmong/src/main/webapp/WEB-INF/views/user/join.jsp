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
  
  var verifyId = false;
  var verifyPw = false;
  var verifyRePw = false;
  var verifyName = false;
  var verifyContact = false;
  var verifyEmail = false;
  var verifyBusiness = false;
  
  function fnCheckId(){
	  $('#id').on('keyup', function(){
		  let id = $(this).val();
		  let regId = /^[a-z0-9-_]{5,20}$/;
		  
		  verifyId = regId.test(id);
		  if(verifyId == false){
			  $('#msgId').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
			  return;
		  }
		  
		  $.ajax({
			  type: 'get',
			  url: '${contextPath}/user/verifyId.do',
			  data: 'id=' + id,
			  dataType: 'json',
			  success: function(resData){
				  verifyId = resData.enableId;
				  if(verifyId){
					  $('#msgId').text('사용 가능한 아이디입니다.');
				  } else {
					  $('#msgId').text('이미 사용 중인 아이디입니다.');
				  }
			  }
		  })
	  })
  }

  function fnCheckPw(){
	  $('#pw').on('keyup', function(){
		  let pw = $(this).val();
		  let pwLength = pw.length;
		  let validCount = /[a-z]/.test(pw) + /[A-Z]/.test(pw) + /[0-9]/.test(pw) + /[^a-zA-Z0-9]/.test(pw);
		  verifyPw = (pwLength >= 8) && (pwLength <= 20) && (validCount >= 3);
		  if(verifyPw){
			  $('#msgPw').text('사용 가능한 비밀번호입니다.');
		  } else {
			  $('#msgPw').text('8~20자, 영문대문자/영문소문자/숫자/특수문자 중 3가지 이상을 포함하세요.');
		  }
	  })
  }
  
  function fnCheckPwAgain(){
	  $('#rePw').on('keyup', function(){
		  let pw = $('#pw').val();
		  let rePw = $('#rePw').val();
		  verifyRePw = (rePw != '') && (rePw == pw);
		  if(verifyRePw){
			  $('#msgRePw').text('');
		  } else {
			  $('#msgRePw').text('비밀번호 입력을 확인하세요.');
		  }
	  })
  }
  
  function fnCheckName(){
	  $('#name').on('keyup', function(){
		  verifyName = ($(this).val() != '');
	  })
  }
  
  function fnCheckContact(){
	  $('#contact').on('keyup', function(){
		  let contact = $(this).val();
		  let regContact = /^010[0-9]{7,8}$/;
		  verifyContact = regContact.test(contact);
		  if(verifyContact){
			  $('#msgContact').text('');
		  } else {
			  $('#msgContact').text('휴대전화 입력을 확인하세요.');
		  }
	  })
  }
  
  function fnCreateDate(){
	  let strMonth = '<option value="">월</option>';
	  for(let m = 1; m <= 12; m++){
		  if(m < 10){
			  strMonth += '<option value="0' + m + '">' + m + '월</option>';
		  } else {
			  strMonth += '<option value="' + m + '">' + m + '월</option>';
		  }
	  }
	  $('#birthmonth').append(strMonth);
	  $('#businessMonth').append(strMonth);
	  
	  $('#birthdate').append('<option value="">일</option>');
	  $('#birthmonth').on('change', function(){      
      $('#birthdate').empty();
      $('#birthdate').append('<option value="">일</option>');
      let endDay = 0;
      let strDay = '';
      switch($(this).val()){
      case '02':
        endDay = 29; break;
      case '04':
      case '06':
      case '09':
      case '11':
        endDay = 30; break;
      default:
        endDay = 31; break;
      }
      for(let d = 1; d <= endDay; d++){
        if(d < 10){
          strDay += '<option value="0' + d + '">' + d + '일</option>';
        } else {
          strDay += '<option value="' + d + '">' + d + '일</option>';
        }
      }
      $('#birthdate').append(strDay);
      
    });
	  
	   $('#businessDate').append('<option value="">일</option>');
    $('#businessMonth').on('change', function(){      
      $('#businessDate').empty();
      $('#businessDate').append('<option value="">일</option>');
      let endDay = 0;
      let strDay = '';
      switch($(this).val()){
      case '02':
        endDay = 29; break;
      case '04':
      case '06':
      case '09':
      case '11':
        endDay = 30; break;
      default:
        endDay = 31; break;
      }
      for(let d = 1; d <= endDay; d++){
        if(d < 10){
          strDay += '<option value="0' + d + '">' + d + '일</option>';
        } else {
          strDay += '<option value="' + d + '">' + d + '일</option>';
        }
      }
      $('#businessDate').append(strDay);
    });
  }
  
  function fnCheckEmail(){
	  $('#btnGetCode').on('click', function(){
		  let email = $('#emailAddr').val() + '@' + $('#domain').val();
		  new Promise(function(resolve, reject){
			  let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]{2,}(\.[a-zA-Z]{2,6}){1,2}$/;
			  verifyEmail = regEmail.test(email);
			  if(verifyEmail == false){
				  reject(1);
				  return;
			  }
			  
			  $.ajax({
				  type: 'get',
				  url: '${contextPath}/user/verifyEmail.do',
				  data: 'email=' + email,
				  dataType: 'json',
				  success: function(resData){
					  if(resData.enableEmail){
						  resolve();
					  } else {
						  reject(2);
					  }
				  }
			  })
		  }).then(function(){
			  
			  $.ajax({
				  type: 'get',
				  url: '${contextPath}/user/sendAuthCode.do',
				  data: "email=" + email,
				  dataType: 'json',
				  success: function(resData){
					  alert(email + '으로 인증코드를 전송했습니다.');
					  $('#btnVerifyCode').on('click', function(){
						  verifyEmail = (resData.authCode == $('#authCode').val());
						  if(verifyEmail){
							  alert('인증되었습니다.');
						  } else {
							  alert('인증에 실패했습니다. 인증번호를 확인해주세요.');
						  }
					  })
				  },
				  error: function(jqXHR){
					  alert('인증번호가 발송되지 않았습니다.');
					  verifyEmail = false;
				  }
			  })
			  
		  }).catch(function(number){
			  let msg = '';
			  switch(number){
			  case 1:
				  msg = '이메일 형식이 올바르지 않습니다.';
				  break;
			  case 2:
				  msg = '이미 사용 중인 이메일입니다.';
				  break;
			  }
			  $('#msgEmail').text(msg);
			  verifyEmail = false;
		  })
		  
	  })
  }
  
  function fnBusinessSearch(){
    $('#btnBusinessSearch').on('click', function(){
    	
    	$('#validResult').empty();
    	
      $.ajax({
      	url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=GxglCuHtwp4CJcuT52KlHO7b6Wbrih22bXKzL4adhI7UbMQt9zCNMnoyqziFiAmTxpxMcsGIbqnduYKgPQdtYg%3D%3D",
          type: "POST",
          data: JSON.stringify({
            "businesses": [
              {
                "b_no": $('#businessNo').val(),
                "start_dt": $('#businessYear').val() + $('#businessMonth').val() + $('#businessDate').val(),
                "p_nm": $('#businessName').val(),
                "p_nm2": "",
                "b_nm": "",
                "corp_no": "",
                "b_sector": "",
                "b_type": ""
              }
            ]
          }),
          dataType: "JSON",
          contentType: "application/json",
          success: function(result) {
        	  if(result.data[0].valid != 01){
        		  $('#validResult').append('해당하는 사업자가 존재하지 않습니다.');
        	  } else {
          	  var bStt = result.data[0].status.b_stt_cd;
          	  if(bStt == 01){
          		  $('#validResult').append('정보가 확인되었습니다. 사업자등록증 파일을 첨부해주세요.');
          	  } else if(bStt == 02 || bStt == 03){
          		  $('#validResult').append('휴업 또는 폐업 상태입니다. 사업자 정보를 확인해주세요.');
          	  }        		  
        	  }
          },
          error: function(result) {
          	$('#validResult').append('입력 정보를 확인해주세요.');
          }
      });

    })
  }

  function fnJoin(){
	  $('#frmJoin').on('submit', function(event){
		  if(verifyId == false){
			  alert('아이디를 확인하세요.');
			  event.preventDefault();
			  return;
		  } else if(verifyPw == false || verifyRePw == false){
			  alert('비밀번호를 확인하세요.');
			  event.preventDefault();
        return;
		  } else if(verifyName == false){
			  alert('이름을 확인하세요.');
			  event.preventDefault();
        return;
		  } else if(verifyContact == false){
			  alert('휴대전화번호를 확인하세요.');
        event.preventDefault();
        return;
		  } else if(verifyEmail == false){
        alert('가입을 위해서 이메일 인증이 필요합니다.');
        event.preventDefault();
        return;
      }
	  })
  }
  
  $(function(){
	  $('#seller').on('click', function(){
		  $('#wrapSellerInfo').show();
	  })
	  
	  $('#general').on('click', function(){
		  $('#wrapSellerInfo').hide();
	  })
	  
	  $('#wrapSellerInfo').hide();
	  
	  $('#btnCancel').on('click', function(){
      location.href = '${contextPath}/user/login.form';
    })
    
    fnCheckId();
	  fnCheckPw();
	  fnCheckPwAgain();
	  fnCheckName();
	  fnCheckContact();
	  fnCreateDate();
	  fnCheckEmail();
	  fnJoin();
	  fnBusinessSearch();
  })
  
</script>
</head>
<body>

  <h2>회원가입</h2>
  
  <form id="frmJoin" method="post" action="${contextPath }/user/join.do" enctype="multipart/form-data">
    
    <input type="hidden" name="location" value=${location }>
    <input type="hidden" name="event" value="${event }">
    
    <div>
      <input type="radio" name="userType" id="general" value="1">
      <label for="general">일반 회원</label>
      <input type="radio" name="userType" id="seller" value="3">
      <label for="seller">판매자 회원</label>
    </div>
    
    <div id="wrapCommon">
    
      <div>필수 입력 정보</div>
      
      <div id="wrapRequired">
      
        <div id="wrapId">
          <div>
            <label for="id">아이디</label>
          </div>
          <div>
            <input type="text" name="id" id="id">
          </div>
          <div id="msgId"></div>
        </div>
      
        <div id="wrapPw">
          <div>
            <label for="pw">비밀번호</label>
          </div>
          <div>
            <input type="password" name="pw" id="pw">
            <div id="msgPw"></div>
          </div>
        </div>
        
        <div id="wrapRePw">
          <div>
            <label for="rePw">비밀번호 확인</label>
          </div>
          <div>
            <input type="password" name="rePw" id="rePw">
            <div id="msgRePw"></div>
          </div>
        </div>
        
        <div id="wrapName">
          <div>
            <label for="name">이름</label>
          </div>
          <div>
            <input type="text" name="name" id="name">
          </div>
        </div>
        
        <div id="wrapContact">
          <div>
            <label for="contact">휴대전화</label>
          </div>
          <div>
            <input type="text" name="contact" id="contact" placeholder="하이픈(-)을 제외하고 입력해주세요.">
            <div id="msgContact"></div>
          </div>
        </div>
        
        <div id="wrapEmail">
          <div>
            <label for="emailAddr">이메일</label>
          </div>
          <div>
            <input type="text" name="emailAddr" id="emailAddr">
            @
            <input type="text" list="domainList" id="domain" name="domain" placeholder="직접입력">
            <datalist id="domainList">
              <option value="naver.com" />
              <option value="gmail.com" />
              <option value="kakao.com" />
            </datalist>
            <input type="button" value="인증요청" id="btnGetCode">
          </div>
          <div id="msgEmail"></div>
          <div>
            <input type="text" id="authCode" placeholder="인증코드 입력">
            <input type="button" value="인증하기" id="btnVerifyCode">
          </div>
        </div>
      
      </div>
    
      <div>선택 입력 정보</div>
      
      <div id="wrapOptional">
          
        <div id="wrapBirthday">
          <div>
            <label for="birthyear">생년월일</label>
          </div>
          <div>
            <input type="text" name="birthyear" placeholder="년(4자)">
            <select name="birthmonth" id="birthmonth"></select>
            <select name="birthdate" id="birthdate"></select>
          </div>
        </div>
        
        <div id="wrapGender">
          <div>성별</div>
          <select name="gender">
            <option value="female">여자</option>
            <option value="male">남자</option>
            <option value="none">선택안함</option>
          </select>
        </div>
        
        <div id="wrapAddress">
          <div>주소</div>
          <input type="text" onclick="execDaumPostcode()" name="postcode" id="postcode" placeholder="우편번호" readonly="readonly">
          <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
          <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
          <input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소"><br>
          <span id="guide" style="color:#999;display:none"></span>
          <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
          <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
          <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
          <script>
          function execDaumPostcode() {
          	new daum.Postcode({
          		oncomplete: function(data) {
          			var roadAddr = data.roadAddress;
                var extraRoadAddr = '';
                
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	extraRoadAddr += data.bname;
                }
            
                if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                if(extraRoadAddr !== ''){
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
            
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
            
                if(roadAddr !== ''){
                	document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                	document.getElementById("extraAddress").value = '';
                }
            
                var guideTextBox = document.getElementById("guide");
            
                if(data.autoRoadAddress) {
                  var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                  guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                  guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                	var expJibunAddr = data.autoJibunAddress;
                	guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                	guideTextBox.style.display = 'block';
                } else {
                	guideTextBox.innerHTML = '';
                	guideTextBox.style.display = 'none';
                }
              }
          	}).open();
          }
          </script>
        </div>
      </div>
    </div>
    
    <div id="wrapSellerInfo">
      
      <div>판매자 정보</div>
      
      <div id="businessSearch">
        
        <div id="businessNoWrap">
          <div><label for="businessNo">사업자등록번호</label></div>
          <div>
            <input type="text" name="businessNo" id="businessNo">
          </div>
        </div>
        
        <div id="businessNameWrap">
          <div><label for="businessName">대표자 성명</label></div>
          <div>
            <input type="text" name="businessName" id="businessName">
          </div>
        </div>
        
        <div id="businessDateWrap">
          <div><label for="businessYear">개업일자</label></div>
          <div>
            <input type="text" id="businessYear" name="businessYear" placeholder="년(4자)">
            <select name="businessMonth" id="businessMonth"></select>
            <select name="businessDate" id="businessDate"></select>
          </div>
        </div>
        
        <div>
          <input type="button" id="btnBusinessSearch" value="사업자조회">
          <span id="validResult"></span>
          <span id="statusResult"></span>
        </div>
        
      </div>
      
      <div id="businessFileWrap">
        <div>사업자등록증 파일첨부</div>
        <div>
          <input type="file" id="businessFile" name="businessFile" onchange="fnFileCheck(this)">
          <div>10KB 이하의 jpg, pdf 파일만 첨부할 수 있습니다.</div>
          <div>첨부파일제목</div>
        </div>
      </div>
      
    </div>
    
    <input type="button" id="btnCancel" value="취소">
    <button>가입하기</button>
    
  </form>
  
</body>
</html>