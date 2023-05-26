<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/mypage.css?dt=${dt}">
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
<style>
* {
  margin-bottom: 10px;
}
#wrapBody {
  display: flex;
}
h2 {
  margin-bottom: 10px;
}
h4 {
  margin-bottom: 10px;
}
#leaveInfo {
  width: 650px;
  height: 240px;
  line-hieght: 230px;
  margin-bottom: 10px;
}
#leaveT {
  border: 1px solid #393E46;
  margin-bottom: 10px;
}
#leaveT tr, td {
  padding: 10px;
}
.tableTitle {
  text-align: center;
  background-color: #eeeeee;
}
#wrapBtn {
  width: 500px;
  display: flex;
  justify-content: space-around;
}
.btn {
  width: 200px;
  height: 50px;
}
</style>
</head>
<%@ include file="/WEB-INF/layout/header.jsp" %>
<body>

  <!-- 상단바 영역 -->
  <div id="mypageTop">
    <h1><a href="${contextPath }/mypage/mypageMain.form">${sessionScope.userName }(${sessionScope.loginId })님 반갑습니다!</a></h1>
  </div>
  
  <div id="wrapBody">
   <!-- 좌측 목록 -->
  <div id="mypageSidebar">
    <div>
      <h4><i class="fa-solid fa-paw fa-2x" style="color: #ffd369;"></i> 주문 관리</h4>
      <ul>
        <li><a href="${contextPath }/mypage/orderlist.form">주문조회</a></li>
        <li><a href="${contextPath }/mypage/cancelOrder.form">취소/반품/교환</a></li>
      </ul>
    </div>
    <div>
      <h4><i class="fa-solid fa-paw fa-2x" style="color: #ffd369;"></i> 혜택 관리</h4>
      <ul>
        <li><a href="${contextPath }/mypage/coupon.form">쿠폰 조회</a></li>
        <li><a href="${contextPath }/mypage/point.form">적립금 조회</a></li>
      </ul>
    </div>
    <div>
      <h4><i class="fa-solid fa-paw fa-2x" style="color: #ffd369;"></i> 나의 활동</h4>
      <ul>
        <li><a href="${contextPath }/mypage/reviewlist.form">상품리뷰</a></li>
        <li><a href="${contextPath }/mypage/productqnalist.form">상품문의</a></li>
        <li><a href="${contextPath }/mypage/csqnalist.form">1:1문의</a></li>
      </ul>
    </div>
    <div>
      <h4><i class="fa-solid fa-paw fa-2x" style="color: #ffd369;"></i> 정보 관리</h4>
      <ul>
        <li><a href="${contextPath }/mypage/modifyInfo.form">개인 정보 수정</a></li>
        <li><a href="${contextPath }/mypage/addresslist.form">배송지 관리</a></li>
        <li><a href="${contextPath }/mypage/leave.form">회원 탈퇴</a></li>
      </ul>
    </div>
    <div>
      <h4><i class="fa-solid fa-paw fa-2x" style="color: #ffd369;"></i> <a href="${contextPath }/seller/sellermain.do">판매자 페이지</a></h4>
    </div>
  </div>
  
  <div id="WrapLeave">
    <h2>회원탈퇴</h2>
    
    <div>
      <h4>회원 탈퇴 안내</h4>
    </div>
    <div>
      <textarea id="leaveInfo" readonly>
        
        몽몽 탈퇴안내

        불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
        
        ■ 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.
        
        1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에
        의거한 고객정보 보호정책에따라 관리 됩니다.
        
        2. 탈퇴 시 회원님께서 보유하셨던 쿠폰과 마일리지는 삭제 됩니다.
        
        3. 탈퇴 후 6개월 (180일) 동안 재가입 불가합니다.
      </textarea>
    </div>
    
    <div>
      <h4>회원 탈퇴</h4>
    </div>
    <form id="frmLeave" action="${contextPath }/user/leave.do">
      <table id="leaveT">
        <tr>
          <td class="tableTitle">탈퇴사유</td>
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
          <td class="tableTitle">남기실 말씀</td>
          <td>
            <textarea name="msg" rows="10" cols="50" placeholder="선택입력사항입니다."></textarea>
          </td>
        </tr>
      </table>
      <div id="wrapBtn">
        <input class="btn" type="button" value="취소">
        <button class="btn" id="btnLeave">탈퇴하기</button>
      </div>
    </form>
  </div>
  </div>
 
</body>
<footer>
<%@ include file="/WEB-INF/layout/footer.jsp" %>
</footer>
</html>