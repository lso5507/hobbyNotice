<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <!-- Date포맷팅을 위한 import -->
<%
	String path = request.getContextPath();
%>

<script type="text/javascript">
<!--
	
//-->
	function del_content() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href = "board_delform?cnt=${board.bdCno}";
	        return true;
		 }else{   //취소
		     return false;
		 }
	}

</script>

<html>
	<head>
		<meta charset="UTF-8">
		<title>${board.bdTitle}</title>
		<link href="<%=path%>/resources/css/board_detailview.css" rel="stylesheet" type="text/css">	
	</head>
	<body>
	
		<div class="board_detail">
			<div class="board_detail_title">
				<div id="title"><h2>제목</h2></div>
				<div>${board.bdTitle}</div>
			</div>
			
			<div class="board_detail_name">
				<div id="name">작성자</div>	
				<div>${board.bdName}</div>
			</div>
			
			<div class="board_detail_head">
				<div class="item">
					<div id="date">작성일: ${board.bdDate}</div>
					<div id="view">조회수: ${board.bdHit}</div>
					<div id="detail_null"></div>
					<div id="declaration"><a href="#">신고</a></div>
					<div id="goodnum">${board.bdLike}</div>
					<div id="good"><a href="#">추천</a></div>
				</div>
			</div>
			
			<div class="board_detail_content">
				<div class="board_table_content">
					<div class="board_detail_tail">
						<c:if test="${board.bdName != member.getMemId()}"> <!-- board.bdName == member.getMemId() -->
							<div id="detail_null"></div>
						</c:if>
						<c:if test="${true}"> <!-- board.bdName == member.getMemId() -->
							<a href="board_modiform?cnt=${board.bdCno}">수정</a>  
							<a href="#" onclick="del_content()">삭제</a>
						</c:if>
					</div>
					<div id="content_text">${board.bdContent}</div>
				</div>
				
			</div>
			
			<div class="comment_view">
				<c:forEach items="${comments}" var="comment">
					<tr>
						<td>이름 : ${comment.comm_name} 날짜 :<fmt:formatDate pattern="yyyy-MM-dd-hh:mm" value="${comment.comm_regDate}"/></td>
						<br><td>${comment.comm_content}</td>
						<br>
					</tr>
				</c:forEach>
				
				<form action="board_comment">
					댓글 : <input type="text" name="comm_content">
					<input type="hidden" value=${param.cnt} name="dno"> <!--파라미터 값을 value로 넘겨줌  -->
					<input type="submit" value="댓글입력">
				</form>
			</div>
		</div>
		

	</body>
</html>


