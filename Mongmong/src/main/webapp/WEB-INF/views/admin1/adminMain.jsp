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
<title>몽몽 관리자 메인페이지</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<%@ include file="/WEB-INF/layout/header.jsp" %>
<style>

#mypageSidebar {
    padding: 10px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 1px 1px 1px grey;
  }

  #mypageSidebar h4 {
    color: #333;
    font-size: 16px;
    margin-top: 0;
    padding-left: 10px;
  }

  #mypageSidebar ul {
    list-style-type: none;
    padding-left: 15px;
  }

  #mypageSidebar ul ul {
    padding-left: 15px;
  }

  #mypageSidebar li {
    margin-bottom: 5px;
    padding-left: 5px;
  }

  #mypageSidebar a {
    text-decoration: none;
    color: #333;
    display: inline-block;
  }

  #mypageSidebar a:hover {
    color: #000;
    font-weight: bold;
  }
  
  .container {
  display: flex;
}

.container h3 {
  flex: 1; /* 화면의 너비를 공유하여 같은 라인에 위치하도록 설정합니다. */
  margin-left: 30px; /* h1과 사이드바 사이의 간격을 조정합니다. 원하는 만큼 조절할 수 있습니다. */
}

</style>  
</head>
<body>
        <div class="container">
          
          <div id="mypageSidebar">
            <div>
              <h4>회원 관리</h4>
              <ul>
                <li>회원 정보</li>
                <li>회원 분석</li>
                <li>블랙리스트 관리</li>
              </ul>
            </div>
            <div>
              <h4>판매자 관리</h4>
              <ul>
                <li>판매자 승인대기</li>
                <li>판매자 분석</li>
                <li>정산 관리</li>
              </ul>
            </div>  
            <div>
              <h4>페이지 관리</h4>
              <ul>
                <li><a href="${contextPath }/admin//categoryList.form">카테고리 관리</a></li>
              </ul>
            </div>
            <div>
              <h4>고객센터</h4>
              <ul>
                <li>공지사항</li>
                <li>1:1문의</li>
              </ul>
             </div>
            <div>
              <h4>정보 관리</h4>
              <ul>
                <li>개인 정보 수정</li>
                <li>배송지 관리</li>
              </ul>
            </div>
            <div>
              <h4><a href="#">판매자 페이지</a></h4>
            </div>
          </div>
          <h3>관리자님 환영합니다.</h3>
        </div>
</body>
<%@ include file="/WEB-INF/layout/footer.jsp" %>
</html>