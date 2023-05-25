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
   fnInit();
 })

  function fnInit() {
    let editResult = '${editResult}';
    if(editResult != '') {
      if(editResult == '1'){
        alert('카테고리가 수정되었습니다.');
      } else {
        alert('카테고리가 수정되지 않았습니다.');
      }
    }
  }
 
  function fnList() {
    location.href = '${contextPath}/admin/categoryList.form';
  }
  
  function fnEditCategory(n){
    $('#frm').attr('action', '${contextPath}/admin/editCategory.form?categoryNo='+n);
    $('#frm').submit();
  }
  
</script>
<style>
  table {
    width: 500px;
    border-collapse: collapse;
  }
  
  table thead,
  table td {
    padding: 10px;
    border: 1px solid #ccc;
  }
  
  table thead {
    background-color: #ffeb99; /* 연한 노란색 배경색 */
    font-weight: bold;
    text-align: center;
  }
  
  table td {
    text-align: center;
  }
  
  /* 추가된 스타일 */
  table thead tr {
    background-color: #ffcc66; /* 더 진한 노란색 배경색 */
  }
  
  table tfoot tr td {
    background-color: #f2f2f2;
    text-align: center;
  }

</style>
</head>
<body>

  <div>
  <h1>${category.categoryNo}번 카테고리 상세보기</h1>
  </div>
  <form id="frm" method="post">
   <div>
      <table border="1">
        <thead>
        <tr> 
          <td>순번</td>
          <td>카테고리</td>
        </tr>
        </thead>
        <tbody>
           <tr>
             <td>${category.categoryNo}</td>
             <td>${category.categoryName }</td>
           </tr>
        </tbody>
      </table>
    </div>
  </form>
  <hr>
  <div>
    <input type="button" value="수정하기" onclick="fnEditCategory(${category.categoryNo})">
    <input type="button" value="카테고리목록" onclick="fnList()">
  </div>
    
</body>
</html>