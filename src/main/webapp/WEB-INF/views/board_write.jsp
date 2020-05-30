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
		<title>게시글 작성</title>
		<link href="<%=path%>/resources/css/board_writestyle.css" rel="stylesheet" type="text/css">	
	</head>
	<body>
		<form action="" method="get">
			<div class="board_write">
				<div class="board_write_headCategory">
					<div class="select_name">게시판</div>
					<div class="select_Categori">
						<select>
							<option>게시판 선택</option>
							<option value="Team">팀원모집</option>
							<option value="Tip">팁과 노하우</option>
							<option value="FreeBoard">자유게시판</option>
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
						<input type="text" name="title" id="write_title" />
					</div>
				</div>
				
				<div class="board_write_headCategory">
					<div class="write_content">
						<textarea name="content"></textarea>
					</div>
				</div>
			
				<div class="write_submit">
					<button type="button" id="btn_write_submit">작성완료</button>	
					<button type="button" id="btn_write_cansel">취     소</button>	
				</div>	
			</div>
		</form>
	</body>
</html>