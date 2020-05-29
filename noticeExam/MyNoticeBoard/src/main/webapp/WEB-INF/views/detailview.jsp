<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <!-- Date포맷팅을 위한 import -->



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/notice/resources/css/board.css" rel="stylesheet" type="text/css">			
</head>
<body>
	

	
	<table  border="1"> 
	
		<h2>현재 접속ID:${member.getMemId()}</h2>
		<h2>제목 : ${board.title}</h2>
		<h2>이름 " ${board.name}</h2>
		<span>${board.content}</span><br>
		

	
		<c:forEach items="${comments}" var="comment">
		<tr>
			<td style="width:300px">이름 :${comment.name}  <br>
			 날짜 :<fmt:formatDate pattern="yyyy-MM-dd-hh:mm" value="${comment.date}"/></td>  <!-- 데이터 방식 포맷  -- dao 반환값에  hh:mm가 포함되지않아서 에러 -->
			<td style="width:500px">${comment.content}</td>
		</tr>
		</c:forEach>
	</table>
	<form action="comment">
		
		댓글 : <input type="text" name="content">
		<input type="hidden" value=${param.cnt} name="dno"> <!--파라미터 값을 value로 넘겨줌  -->
		<input type="submit" value="댓글입력">
	</form>
</body>
</html>