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

$(function (){
    $('#frmEditCategory').on('submit', function(event){
      let categoryName = $('#categoryName').val();
      
      if(categoryName == ''){
        alert('카테고리명을 입력해주세요.');
        event.preventDefault();
        return;
      } 
      
      if(isNaN(categoryName) == false) {
        alert('숫자는 입력할 수 없습니다.');
        event.preventDefault();
        return;
      }
      
    })
 })

  function fnList() {
    location.href = '${contextPath}/admin/categoryList.form';
  }

</script>
</head>
<body>

  <div>
    <h1>카테고리 수정하기</h1>
  </div>
  <div>
    <form method="post" id="frmEditCategory" action="${contextPath}/admin/editCategory.do?categoryNo=${category.categoryNo}">
    <div>
      <label for="categoryName">카테고리</label>
      <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}">
    </div>
    <div>
      <button>수정완료</button>
      <input type="button" value="카테고리목록" onclick="fnList()">
    </div>
  </form>
  </div>
    
</body>
</html>