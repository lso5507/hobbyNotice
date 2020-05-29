<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/notice/resources/css/board.css" rel="stylesheet" type="text/css">			
</head>
<body>
	
	
	<table class="box" border="1"> 
		<h2>현재 접속ID:${member.getMemId()}</h2>
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
			
		</tr>
		<c:forEach items="${lists}" var="boardVO">
		<tr>
			<td><c:out value="${boardVO.count}"/></td>
			<td><c:out value="${boardVO.name}"/></td>
			<td><c:out value="${boardVO.title}"/></td>
			<td><c:out value="${boardVO.date}"/></td>
			<td><c:out value="${boardVO.hit}"/></td>
		</tr>
		</c:forEach>

	</table>
		<a href="writeform">글 작성</a>
		<a href="home">Home</a>
</body>
</html>