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
		<h1>공지사항</h1>
			<select>
				<option>10개씩보기</option>
				<option>5개씩보기</option>
			</select>
	</div>
	<div>
		<input type="text" placeholder="궁금하신 키워드를 입력해주세요">
		<button>
			<img alt="돋보기" src="">
		</button>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>날짜</td>
					<td>작성자</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${번호}</td>
					<td>${제목}</td>
					<td>${날짜}</td>
					<td>${작성자}</td>
					<td>${이메일}</td>
				</tr>
			</tbody>
		</table>
	</div>	

</body>
</html>