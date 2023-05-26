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
<title>몽몽 카테고리 관리</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<%@ include file="/WEB-INF/layout/header.jsp" %>
<script>

$(function(){
    
     // 자동 완성 목록 초기화
     $('#columnsearch').on('change', function(){ // 검색 칼럼이 바뀔 때마다
        $('#auto_complete').empty();              // 자동완성 목록 초기화
        $('#query').val('');                     // 검색어 초기화
     })
     
      // recordPerPage의 변수
      $('#recordPerPage').on('change', function(){
         location.href = '${contextPath}/admin/change/record.do?recordPerPage=' + $(this).val();
         
      })
     // pageContext, request, session, application - 속성을 저장하는 이 네군데는 EL문법으로 가져올 수 있다.
     let recordPerPage = '${sessionScope.recordPerPage}' == '' ? '5' : '${sessionScope.recordPerPage}';
     $('#recordPerPage').val(recordPerPage);
      
      // pagination은 현재 페이지, 현재 페이지의 정렬상태를 알아야 한다.
      $('.title').on('click', function(){
        location.href = '${contextPath}/admin/categoryList.form?columnorder=' + '${columnorder}' + '&columnsearch=' + '${columnsearch}'+ '&query=' + '${query}' + '&order=' + $(this).data('order') + '&page=' + ${page}
      }) 
      
  function fnAutoComplete() {
     // 자동완성 목록 가져오기
     // 글자 입력할 때마다 fucntion을 실행시킨다.
  
     $('#query').on('input', function(){ // 내 키보드가 두번 눌려서 keyp이벤트 및 ajax요청이 전부 다 2번 실행된 것이다.
        $('#auto_complete').empty(); // 검색어 계속 입력할때마다 초기화.
        
   //   if($('#columnsearch').val() == 'CATEGORY_NO'){  이렇게 if문으로 조건을 걸어 ajax가 동작하지 않게 할 수 있다.
   //     return;
   //   }
        $.ajax({
          // 요청
          type: 'get',
          url: '${contextPath}/admin/autoComplete.do',
          data: $('#frmSearch').serialize(),
         
          // 응답
          dataType: 'json',
          success: function(resData){
            console.log(resData.categoryComplete);
             
            // 검색할시 해당하는 칼럼이 1개뿐므로 each문 돌릴 필요가 없다. (코드 남겨두기)
            $.each(resData.categoryComplete, function(i, category){
            // 속성이 문자열로 되어있다면 객체['속성'] 방법으로 속성을 꺼내와야한다.
            //  switch($('#columnsearch').val()){
            //    case "CATEGORY_NO":
            //      $('#auto_complete').append('<option value="' + category.categoryNo + '" />');
            //      break;
            //    case "CATEGORY_NAME":
                  $('#auto_complete').append('<option value="' + category.categoryName + '" />');
            //      break;
            //  }
            })
           }
        }) // ajax 끝

     })
  } // fnAutoComplete() 끝
      
      fnInit();
      fnAutoComplete();
      
    }) // 온로드이벤트 끝
    
  function fnInit(){
      let addResult = '${addResult}'; 
      if(addResult != '') {  // 카테고리 리스트 페이지엔 원래 addResult값이 없으므로 빈문자열도 if문 조건에 넣어준다.
        if(addResult == '1'){
          alert('카테고리가 등록되었습니다.');
        } else {
          alert('카테고리가 등록되지 않았습니다.');
        }
      }
      
      let removeResult = '${removeResult}';
      if(removeResult != '') {
        if(removeResult == '1'){
          alert('카테고리가 삭제되었습니다.');
        } else {
          alert('카테고리가 삭제되지 않았습니다.');
        }
      }
  }
  
   function fnAddCategory() {
      location.href='${contextPath}/admin/addCategory.form';
   }
   function fnDetailCategory(n) {
      location.href='${contextPath}/admin/detailCategory.form?categoryNo=' + n;
   }
   function fnRemoveCategory(n){
      if(confirm('카테고리를 정말 지우시겠습니까?')) {
        $('#frm').attr('action', '${contextPath}/admin/removeCategory.do?categoryNo='+n);
        $('#frm').submit();
      }
    }

</script>
<style>
  table {
    width: 100%;
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
  
  table tbody tr:hover {
    background-color: #eaeaea;
  }
  
  /* 추가된 스타일 */
  table thead tr {
    background-color: #ffcc66; /* 더 진한 노란색 배경색 */
  }
  
  table tfoot tr td {
    background-color: #f2f2f2;
    text-align: center;
  }
  
  #recordPerPage {
    display: block;
    padding: 5px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  #orderPage {
    display: block;
    padding: 5px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  
  }
  .pagination{ 
    width: 700px;
    text-align: center;
    margin: 0 auto;
  }
  .pagination span, .pagination a{
    display: inline-block;
    width: 50px;
  }
 
  .strong {
    font-weight: 900;
  }
  .link {
    color: orange;
  }
  table {
    width: 600px;
  }
  table td:nth-of-type(1) { width: 50px }
  table td:nth-of-type(2) { width: 150px }
  table td:nth-of-type(3) { width: 100px }
  table td:nth-of-type(4) { width: 100px }
  
  .title {
    display: inline-block;
    padding: 5px 5px;
    cursor: pointer;
    font-weight: bold;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f2f2f2;
  }
</style>  
</head>
<body>

  <div>
    <a href="${contextPath}/">메인페이지 이동</a>
  </div>
 
   <h1>카테고리 목록</h1>
    <div>
      <div>
        <select id="recordPerPage">
          <option value="5">목록 5개</option>
          <option value="10">목록 10개</option>
          <option value="15">목록 15개</option>
        </select>
        <span class="title" data-columnorder="CATEGORY_NO" data-order="${order}">순번 정렬</span>
        <span class="title" data-columnorder="CATEGORY_NAME" data-order="${order}">카테고리 정렬</span>
      </div>
      <hr>  
      <form method="post" id="frm"> 
          <table border="1">
             <thead>
                <tr>
                  <td>카테고리 번호</td>
                  <td>카테고리 이름</td>
                  <td>수정 및 삭제</td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${categoryList}" var="category">
                  <tr>
                    <td class="tableBody">${category.categoryNo}</td>
                    <td class="tableBody">${category.categoryName }</td>
                    <td>
                      <div>
                         <input type="button" value="상세보기" onclick="fnDetailCategory(${category.categoryNo})">
                         <input type="button" value="삭제하기" onclick="fnRemoveCategory(${category.categoryNo})">
                      </div>  
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="4">
                    ${pagination}
                  </td>
               </tr>
              </tfoot>
          </table>
        </form>
      <hr>
        <div>
          <input type="button" class="btn" value="카테고리 등록" onclick="fnAddCategory()">
        </div>
        
        <div>       
           <form id="frmSearch" action="${contextPath}/admin/categoryList.form">
            <!-- submit 할 때 선택된 <option>태그의 value값이 파라미터 name columnsearch 으로 넘어간다. -->
              <select name="columnsearch" id="columnsearch">
                  <option value="CATEGORY_NAME">카테고리 이름</option>
              </select>
              <input list="auto_complete" type="text" name="query" id="query"> <!-- 목록을 고를 수도 있고 입력을 할 수도 있고 -->
              <datalist id="auto_complete">
              <!-- <option> 태그의 value속성으로 자동완성 목록을 뿌려준다. -->
              
              </datalist> 
              <button>검색</button>
           </form>
        </div>
     </div>
</body>
<%@ include file="/WEB-INF/layout/footer.jsp" %>
</html>