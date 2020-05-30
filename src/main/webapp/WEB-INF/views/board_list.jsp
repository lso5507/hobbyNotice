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
<title>Insert title here</title>
<link href="/notice/resources/css/style_list.css" rel="stylesheet" type="text/css">			
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
							<div class="num"><c:out value="${boardVO.count}"/></div>
							<div class="tit"><a href="detailview?cnt=${boardVO.count}"><c:out value="${boardVO.title}"/></a>(${boardVO.dno})</div>
							<div class="date"><c:out value="${boardVO.date}"/></div>
							<div class="writer"><c:out value="${boardVO.name}"/></div>
							<div class="HitChk"><c:out value="${boardVO.hit}"/></div>
							<div class="goodview">0</div>
						</div>
						</c:forEach>
					</div>
					
					<div class="board_btn_writer">
						<input type="button" value="글쓰기" class="btn_writer" onclick="location.href='<%=path%>/writeform'"/>
					</div>
					
							
				</div>
				
			</div>
		</form>
</body>
</html>