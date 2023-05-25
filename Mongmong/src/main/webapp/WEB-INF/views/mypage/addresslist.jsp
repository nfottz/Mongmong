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
  $(function(){
	  
	  $('#btnAddAddress').on('cilck', function(){
		  
	  })
	  
  })
</script>
</head>
<body>

  <div>
    <h2>배송지 관리</h2>
    <span>배송지 관리 내역 총 건</span>
    <input type="button" id="btnAddAddress" value="+ 배송지 추가하기">
  </div>
  
  <div>
    <table>
      <thead>
        <tr>
          <td>배송지 이름</td>
          <td>받으실 분</td>
          <td>주소</td>
          <td>연락처</td>
          <td>수정/삭제</td>
        </tr>
      </thead>
      <tbody id="addresslist">
             
      </tbody>
      <tfoot>
        <tr>
          <td colspan="5">페이지네이션공간</td>
        </tr>
      </tfoot>
    </table>
  </div>
  
</body>
</html>