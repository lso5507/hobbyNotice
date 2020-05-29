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
	<c:if test="${!empty member}">
	<form action="write" method="get" enctype="multipart/form-data">
		<div class="writeForm">
			<h2>현재 접속ID:${member.getMemId()}</h2>
			<h2>제목<input type="text" name="title"></h2>		
			<input type="file", name="uploadfile" placeholder="파일 선택" accept=".gif, .jpg, .png"/><br/>
			<textarea name="content" cols="40" rows="5"></textarea><br>
			<input type="radio" name="category" value="Team">Team
			<input type="radio" name="category" value="Tip">Tip
			<input type="radio" name="category" value="FreeBoard">FreeBoard
			<button type="submit">글 등록</button>			
		    		
	
		</div>
	</form>
	</c:if>
	<c:if test="${empty member }">
		<script type="text/javascript">alert("Session이 만료되었습니다.");
		location.href="home";</script>
	</c:if>

</body>
</html>