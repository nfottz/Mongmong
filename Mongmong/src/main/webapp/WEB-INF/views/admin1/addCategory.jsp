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
	   $('#frmAddCategory').on('submit', function(event){
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

  <h1>카테고리 등록</h1>
  <form method="post" id="frmAddCategory" action="${contextPath}/admin/addCategory.do">
    <div>
      <label for="categoryName">카테고리 이름</label>
      <input type="text" id="categoryName" name="categoryName">
    </div>
    <div>
      <button>등록완료</button>
      <input type="button" value="카테고리목록" onclick="fnList()">
    </div>
  </form>
  
</body>
</html>
