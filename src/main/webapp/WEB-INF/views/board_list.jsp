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
<title>E-Sports 게시판</title>
<link href="<%=path%>/resources/css/board_liststyle.css" rel="stylesheet" type="text/css">			
</head>
<body>
	<form action="" method="post">
		<div class="board_list_wrap">
			<div class="board_categori">E-Sports</div>
			
				<div class="board_list">
					<div class="board_list_head">
						<div class="num"></div>
						<div class="tit">제목</div>
						<div class="date">작성일</div>
						<div class="writer">작성자</div>
						<div class="HitChk">조회</div>
						<div class="goodview">추천</div>
					</div>
					<div class="board_list_body">
						<!-- DTO에서  -->
						<c:forEach items="${list}" var="boardVO">
						<div class="item">
							<div class="num"><c:out value="${boardVO.bdCno}"/></div>
							<!--  cnt 파라미터를 이용하여 원하는 게시글 상세보기 -->
							<div class="tit"><a href="board_detailview?cnt=${boardVO.bdCno}"><c:out value="${boardVO.bdTitle}"/></a>(${boardVO.dno})</div>
							<div class="date"><c:out value="${boardVO.bdDate}"/></div>
							<div class="writer"><c:out value="${boardVO.bdName}"/></div>
							<div class="HitChk"><c:out value="${boardVO.bdHit}"/></div>
							<div class="goodview">0</div>
						</div>
						</c:forEach>
					</div>
					
					<div class="board_btn_writer">
						<input type="button" value="글쓰기" id="btn_writer" onclick="location.href='<%=path%>/board_writeform'"/>
					</div>		
				</div>
				
				
				
			</div>
		</form>
</body>
</html>