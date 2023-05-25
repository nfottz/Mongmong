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
	
	let addResult = '${addResult}';
	if(addResult != ''){
		if(addResult == '1'){
			alert('등록 성공');
		} else {
			alert('등록 실패');
		}
	}

	function fnList(){
		location.href = '${contextPath}/seller/sellermain.do' 
	}
	
</script>
</head>
<body>
    <div>
        <input type="text" placeholder="상품명을 입력해주세요." id="manageSearch" name="manageSearch" >
        <input type="button" value="검색" id="manageSearch">
        <select id="showUnit">
            <option value="ten" selected="selected">10개</option>
            <option value="twenty">20개</option>
            <option value="thirty">30개</option>
        </select>
    </div>
    <hr>
    <table border="1">
        <thead>
               <tr>
                   <td>사진</td>
                   <td>판매상태</td>
                   <td>상품명</td>
                   <td>가격</td>
                   <td>재고수량</td>
                   <td>최근수정일</td>
               </tr>
        </thead>
     </table>
     <div>
     	<input type="button" value="목록" onclick="fnList()">
     </div>
</body>
</html>