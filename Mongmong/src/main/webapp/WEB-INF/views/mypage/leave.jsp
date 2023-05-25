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
  $(function(){
	  $('#frmLeave').on('submit', function(event){
		  if(confirm('동일한 아이디로 재가입이 불가능합니다. 회원 탈퇴 하시겠습니까?') == false){
        event.preventDefault();
        return;
		  }
	  })
  })
</script>
</head>
<body>

    <h2>회원탈퇴</h2>
    
    <div>
      <h4>회원 탈퇴 안내</h4>
    </div>
    <div>
      <textarea readonly>탈퇴시 어찌구 저찌구,,하는 거</textarea>
    </div>
    
    <div>
      <h4>회원 탈퇴</h4>
    </div>
    <form id="frmLeave" action="${contextPath }/user/leave.do">
      <table>
        <tr>
          <td>탈퇴사유</td>
          <td>
            <div>
              <ul>
                <li>
                  <input type="checkbox" name="reason" id="reason1" value=1>
                  <label for="reason1">방문 빈도 낮음</label>
                </li>
                <li>
                  <input type="checkbox" name="reason" id="reason2" value=2>
                  <label for="reason2">배송 불만족</label>
                </li>
                <li>
                  <input type="checkbox" name="reason" id="reason3" value=4>
                  <label for="reason3">상품 불만족</label>
                </li>
                <li>
                  <input type="checkbox" name="reason" id="reason4" value=8>
                  <label for="reason4">고객상담 불만족</label>
                </li>
              </ul>
            </div>
          </td>
        </tr>
        <tr>
          <td>남기실 말씀</td>
          <td>
            <textarea name="msg" placeholder="선택입력사항입니다."></textarea>
          </td>
        </tr>
      </table>
      <input type="button" value="취소">
      <button>탈퇴하기</button>
    </form>
    

</body>
</html>