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
		<title>게시글 세부사항</title>
		<link href="<%=path%>/resources/css/board_detailviewstyle.css" rel="stylesheet" type="text/css">	
	</head>
	<body>
	
		<div class="board_detail">
			<div class="board_detail_title">
				<div id="title"><h2>제목</h2></div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
			</div>
			
			<div class="board_detail_name">
				<div id="name">작성자</div>
				<div>aaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
			</div>
			
			<div class="board_detail_head">
				<div class="item">
					<div id="date">작성일</div>
					<div id="view">조회수</div>
					<div id="detail_null"></div>
					<div id="declaration">신고</div>
					<div id="goodnum">추천수</div>
					<div id="good">추천</div>
				</div>
			</div>
			
			<div class="board_detail_content">
				<div class="board_table_content">
						한승채 멍충아
				</div>
				<div class="board_detail_tail">
					<div>수정 삭제</div>
				</div>
			</div>
			
				
			
			
		</div>




	</body>
</html>