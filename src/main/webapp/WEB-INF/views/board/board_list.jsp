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
							<div class="tit"><a href="board_detailview?cnt=${boardVO.bdCno}"><c:out value="${boardVO.bdTitle}"/></a>${boardVO.dno}</div>
							<div class="date"><c:out value="${boardVO.bdDate}"/></div>
							<div class="writer"><c:out value="${boardVO.bdName}"/></div>
							<div class="HitChk"><c:out value="${boardVO.bdHit}"/></div>
							<div class="goodview"><c:out value="${boardVO.bdLike}"/></div>
						</div>
						</c:forEach>
					</div>
					
					<div class="board_btn_writer">
					<form action="board_writeform">
						<input type="hidden" value=${param.val} name="val"> <!-- hidden 타입으로 val변수 컨트롤러로 보냄 -->
						<input type="submit" value="글쓰기" id="btn_writer"/>
					</form>
					</div>		
				</div>
				
				<div class="board_list_pageNum">
					<c:set var="page" value="${(param.p == null)?1:param.p}" />
					<c:set var="startNum" value="${page-(page-1)%5}" />
					<c:set var="lastNum" value="6" /> <!-- 목록의 개수 불러와서 지정해주어야함 -->
					
					<c:if test="${startNum != 1}">
						<div><a href="?p=${(startNum == 1)?1:startNum-5}">이전</div>
					</c:if>
					<c:if test="${startNum == 1}">
						<div></div>
					</c:if>
					
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${startNum+i <= lastNum}">
							<div><a href="?p=${startNum+i}">${startNum+i}</a></div>
						</c:if>
						
					</c:forEach>
					
					<c:if test="${startNum+5<=lastNum}">
						<div><a href="?p=${startNum+5}">다음</a></div>
					</c:if>
					
					<c:if test="${startNum+5>lastNum}">
						<div></div>
					</c:if>
					
				</div>
				
			</div>
		</form>
</body>
</html>