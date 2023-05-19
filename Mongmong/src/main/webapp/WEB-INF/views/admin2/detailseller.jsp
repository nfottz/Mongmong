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
</head>
<body>
	<div id="list">
			<h1 id="">회원관리</h1>
				<ul>
					<li><a href="" id="">회원정보</a></li>
					<li><a href="" id="">회원분석</a></li>
					<li><a href="" id="">블랙리스트 관리</a></li>
				</ul>
			<h1 id="">판매자관리</h1>
				<ul>
					<li><a href="" id="">회원정보</a></li>
					<li><a href="" id="">회원분석</a></li>
					<li><a href="" id="">블랙리스트 관리</a></li>
				</ul>
			<h1 id="">페이지관리</h1>
				<ul>
					<li><a href="" id="">회원정보</a></li>
					<li><a href="" id="">회원분석</a></li>
					<li><a href="" id="">블랙리스트 관리</a></li>
				</ul>
			<h1 id="">고객센터</h1>
				<ul>
					<li><a href="" id="">공지사항</a></li>
					<li><a href="" id="">1:1문의</a></li>
				</ul>
	</div>
	
	<div>
		<h1>회원 상세보기(판매자)</h1>
	</div>
	<div>일반회원 님의 상세정보</div>
	<div><a id="">정보수정</a><a id="">판매승인</a><a id="">판매자삭제</a><a id="">블랙리스트 등록</a></div>
	<div>
		<table>
			<tbody>
				<tr>
					<td>회원구분</td>
					<td>${회원구분}</td>
					<td>아이디</td>
					<td>${아이디}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${이름}</td>
					<td>연락처</td>
					<td>${연락처}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${이메일}</td>
					<td>주소</td>
					<td>${주소}</td>
				</tr>
				<tr>
					<td>이메일<span id=""><a>메일발송</a></span></td>
					<td>${이메일}</td>
					<td>주소</td>
					<td>${주소}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${생년월일}</td>
					<td>성별</td>
					<td>${성별}</td>
				</tr>
				<tr>
					<td>위치동의여부</td>
					<td>${위치동의여부}</td>
					<td>프로모션동의여부</td>
					<td>${프로모션동의여부}</td>
				</tr>
				<tr>
					<td>기업일</td>
					<td>${기업일}</td>
					<td>최근방문일자</td>
					<td>${최근방문일자}</td>
				</tr>
				<tr>
					<td>사업자번호</td>
					<td>${사업자번호}</td>
					<td>대표자</td>
					<td>${대표자}</td>
				</tr>
				<tr>
					<td>판매승인여부</td>
					<td>${판매승인여부}</td>
					<td>승인일자</td>
					<td>${승인일자}</td>
				</tr>
				<tr>
					<td>블랙리스트여부</td>
					<td>${블랙리스트여부}</td>
					<td>블랙리스트 등급</td>
					<td>${블랙리스트 등급}</td>
				</tr>
			</tbody>
		</table>
	</div>	
	<div><a href="" id="">목록</a></div>

</body>
</html>