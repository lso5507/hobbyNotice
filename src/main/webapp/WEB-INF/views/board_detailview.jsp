<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <!-- Date포맷팅을 위한 import -->
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
				<div>${board.bdTitle};</div>
			</div>
			
			<div class="board_detail_name">
				<div id="name">작성자</div>	
				<div>${board.bdName};</div>
			</div>
			
			<div class="board_detail_head">
				<div class="item">
					<div id="date">작성일: ${board.bdDate}</div>
					<div id="view">조회수: ${board.bdHit}</div>
					<div id="detail_null"></div>
					<div id="declaration">신고</div>
					<div id="goodnum">${board.bdLike}</div>
					<div id="good">추천</div>
				</div>
			</div>
			
			<div class="board_detail_content">
				<div class="board_table_content">
						${board.bdContent}
				</div>
				<div class="board_detail_tail">
					<div>
					<a href="board_modiform?cnt=${board.bdCno}">수정</a>
					<a href="board_delform?cnt=${board.bdCno}">삭제</a>
					</div>
				</div>
			</div>

		</div>
		<c:forEach items="${comments}" var="comment">
		<tr>
			<td style="width:300px">이름 :${comment.comm_name} </td>
			<td> 날짜 :<fmt:formatDate pattern="yyyy-MM-dd-hh:mm" value="${comment.comm_regDate}"/>/</td>  <!-- 데이터 방식 포맷   -->
			<td style="width:500px">${comment.comm_content}</td>
			<br>
		</tr>
		</c:forEach>
	
		<form action="board_comment">
			
			댓글 : <input type="text" name="comm_content">
			<input type="hidden" value=${param.cnt} name="dno"> <!--파라미터 값을 value로 넘겨줌  -->
			<input type="submit" value="댓글입력">
		</form>

	</body>
</html>