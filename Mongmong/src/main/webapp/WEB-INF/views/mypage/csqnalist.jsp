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
    <h2>1:1문의</h2>
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
          <td>구분</td>
          <td>제목</td>
          <td>답변여부</td>
        </tr>
      </thead>
      <tbody id="csQnaList">
        
      </tbody>
      <tfoot>
        <tr>
          <td colspan="4">페이지네이션공간</td>
        </tr>
      </tfoot>
    </table>
  </div>
  
</body>
</html>