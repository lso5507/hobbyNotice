<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
%>

<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="<%=path%>/resources/css/board_writestyletest.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<form action="board_modify" method="POST">
		<div class="board_write">
			<div class="board_write_headCategory">
				<div class="select_name">게시판</div>
				<div class="select_Categori">
					<select name="bdCategory">
						<c:choose>

							<c:when test="${board.bdCategory eq 'Team'}">
								<option>게시판 선택</option>
								<option value="Team" selected="selected">팀원모집</option>
								<option value="Tip">팁과 노하우</option>
								<option value="FreeBoard">자유게시판</option>
							</c:when>

							<c:when test="${board.bdCategory eq 'Tip'}">
								<option>게시판 선택</option>
								<option value="Team" selected="selected">팀원모집</option>
								<option value="Tip">팁과 노하우</option>
								<option value="FreeBoard">자유게시판</option>
							</c:when>
							<c:when test="${board.bdCategory eq 'FreeBoard'}">
								<option>게시판 선택</option>
								<option value="Team" selected="selected">팀원모집</option>
								<option value="Tip">팁과 노하우</option>
								<option value="FreeBoard">자유게시판</option>
							</c:when>
							<c:otherwise>
								<!-- else -->
								<option>게시판 선택</option>
								<option value="Team" selected="selected">팀원모집</option>
								<option value="Tip">팁과 노하우</option>
								<option value="FreeBoard">자유게시판</option>
							</c:otherwise>

						</c:choose>
					</select>
				</div>
				<div class="select_horsehead">
					<select>
						<option value="">말머리 선택</option>
					</select>
				</div>
			</div>

			<div class="board_write_headCategory">
				<div class="select_name">제목</div>
				<div class="select_Categori">
					<input type="text" name="bdTitle" id="write_title"
						value="${board.bdTitle}" />
				</div>
			</div>

			<div class="board_write_headCategory">
				<div class="write_content">
					<textarea name="bdContent">${board.bdContent}</textarea>
				</div>
			</div>

			<div class="write_submit">
				<button type="submit" id="btn_write_submit">수정</button>
				<input type="hidden" value=${param.cnt } name="cnt">
				<!--파라미터 값을 value로 넘겨줌  -->
				<button type="button" id="btn_write_cansel" onclick="history.back()">취
					소</button>
			</div>
		</div>
	</form>
</body>
</html>