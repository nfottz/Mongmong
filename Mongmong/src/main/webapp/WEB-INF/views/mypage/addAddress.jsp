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
</head>
<body>

  <div>
    <h2>배송지 등록</h2>
  </div>
  
  <form>
    <div>
      <input type="checkbox" id="defaultAddress" name="defaultAddress">
      <label for="defaultAddress">기본 배송지로 설정합니다.</label>
    </div>
    
    <div>
      <table>
        <tr>
          <td>배송지 별명</td>
          <td><input type="text" id="addrNickname" name="addrNickname"></td>
        </tr>
        <tr>
          <td>받으실 분</td>
          <td><input type="text" id="addrName" name="addrName"></td>
        </tr>
        <tr>
          <td>주소</td>
          <td>
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
          </td>
        </tr>
        
        <tr>
          <td>연락처</td>
          <td><input type="text" id="addrContact" name="addrContact" placeholder=""></td>
        </tr>
      </table>
    </div>
    
    <div>
      <input type="button" id="btnCancel" value="취소">
      <button>저장</button>
    </div>
  </form>
</body>
</html>