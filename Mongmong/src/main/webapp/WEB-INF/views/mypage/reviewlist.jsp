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

</script>
</head>
<body>

  <div>
    <h2>상품리뷰</h2>
    <span>총 건</span>
    <div>
      <select id="recordPerPage">
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
      </select>
      건씩 보기
    </div>
  </div>
  
  <div>
    <table>
      <thead>
        <tr>
          <td>날짜</td>
          <td>상품정보</td>
          <td>내용</td>
          <td>별점</td>
          <td>좋아요 수</td>
        </tr>
      </thead>
      <tbody id="reviewList">
        
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