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

	$(document).ready(function() {
		$('.board_comment_textarea').on( 'keydown keyup', 'textarea', function (e){
			var text_height = parseInt($(this).css('height'));
			if (text_height < 500) {
				$(this).css('overflow', 'hidden' );
				$(this).height(1).height( $(this).prop('scrollHeight')+12 );
			} else {
				$(this).css('overflow', 'scroll' );
				$(this).height(1).height( $(this).prop('scrollHeight')+12 );
			} 
	      });
	      
	      $('.board_comment_textarea').find( 'textarea' ).keydown();
	    });
</script>


<html>
	<head>
		<meta charset="UTF-8">
		<title>${board.bdTitle}</title>
		<link href="<%=path%>/resources/css/board_detailview.css" rel="stylesheet" type="text/css">	
		<script src="//code.jquery.com/jquery.min.js"></script>
	</head>
	<body>
		
		<div class="board_detail">
			<div class="board_detail_title">
				<div id="title"><h2>${board.bdTitle}</h2></div>
				<div></div>
			</div>
			
			<div class="board_detail_name">
				<div id="name">작성자</div>	
				<div>${board.bdName}</div>
			</div>
			
			<div class="board_detail_head">
				<div class="item">
					<div id="date">작성일: ${board.bdDate}&nbsp;&nbsp;</div>
					<div id="view">조회수: ${board.bdHit}</div>
					<div id="declaration"><a href="#">신고</a></div>
					<div id="goodnum">${board.bdLike}</div>
					<div id="good"><a href="board_likey?cnt=${board.bdCno}">추천</a></div>
				</div>
			</div>
			
			<div class="board_detail_content">
			
				<div class="board_table_content">
					<div id="content_text">${board.bdContent}</div>
				</div>
				
				<div class="board_table_tail">
					<div class="board_detail_tail">
						<c:if test="${board.bdName != memId}"> <!-- board.bdName == member.getMemId() -->
							<div id="detail_null">&nbsp;</div>
						</c:if>
						<c:if test="${board.bdName == memId}"> <!-- board.bdName == member.getMemId() -->
							<a href="board_modiform?cnt=${board.bdCno}">수정</a>  
							<a href="#" onclick="del_content()">삭제</a>
						</c:if>
					</div>
				</div>
			</div>
			
			<div class="comment_view">
				<c:forEach items="${comments}" var="comment">
					<div  id="comment_text">
						<div>이름 : ${comment.comm_name}</div>
						<div id="text_size_cont">${comment.comm_content}</div>
						<div id="text_size_date">날짜 :<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${comment.comm_regDate}"/></div>
					</div>
				</c:forEach>
				
				<form action="board_comment" class="commit_comment" name="comment_form">
					<c:if test="${memId == null}"> <!-- board.bdName == member.getMemId() -->
						<div>로그인 해주세요</div>
					</c:if>
					<c:if test="${memId != null}"> <!-- board.bdName == member.getMemId() -->
						<div>${memId}</div>
					</c:if>
					<div>
						<div class="board_comment_textarea"><textarea rows="1"placeholder="댓글입력" name="comm_content" id="com_input"></textarea></div>
						<div><input type="hidden" value=${param.cnt} name="dno"></div> <!--파라미터 값을 value로 넘겨줌  -->
						<div id="comment_submit"><a href="javascript:comment_form.submit();">등록</a></div>
					</div>
				</form>
			</div>
		</div>
		

	</body>
</html>


