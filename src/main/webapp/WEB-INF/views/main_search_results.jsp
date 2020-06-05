<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>취미 공유 커뮤니티</title>
</head>
<body>
	<div id="sr_main">
	
		<!-- 페이지 내 검색 -->
		<div id="sr_search"> 
			<form action="/hobby/" method=""> <!-- 변경 필요, 컨트롤러와 같은 경로 및 post or get 방식 --> 
				<select class="sr_input_select" name="sr_select">
					<option value="sr_selTitle"> 제목 </option>
					<option value="sr_selContent"> 내용 </option>
					<option value="sr_selName"> 작성자 </option>
					<option value="sr_selTitleContent"> 제목+내용 </option>
				</select>
				<input type="text" class="sr_input_text" maxlength="50" name="sr_txtContent">
				<input type="submit" class="sr_input_button" value="검색">
			</form><!-- form 태그 끝 -->
		</div> <!-- 페이지 내 검색 끝 -->
		
		<div id="sr_content">
			<!-- e-스포츠 영역 -->
			<div id="sr_list_esport">
				<!-- 제목 -->
				<div class="sr_list_header">
					<h3>e-스포츠</h3>
				</div> <!-- 제목 끝-->
				<!-- 게시물 -->
<%--			
				적용할때 이것만 있으면 됌  나머진 지워도 됨
 				<c:forEach var="list" items="${____}" varStatus="status">
 					<div class="sr_list_content">	
						<span class="sr_span_title"><a href="${list.link}">${list.title}</a></span>
						<span class="sr_span_content">${list.content}</span>
						<div class="sr_list_content_">
							<span><a href="${list.?}">${list.?}</a></span>
							<span>${list.date}</span>
						</div>
					</div>
				</c:forEach> 
				<div class="sr_list_more">
					<span><a href="">더 보기</a></span>
				</div>
--%>
				<div class="sr_list_content">
					<span class="sr_span_title"><a href="">제목1 </a></span> <!-- 제목 -->
					<span class="sr_span_content">이성훈♡하지훈 </span> <!-- 내용 -->
					<div class="sr_list_content_">
						<span><a href="">경로</a></span>
						<span>작성일자</span>
					</div>
				</div>
				<div class="sr_list_content">
					<span><a href="">제목2</a></span>
					<span>윤찬호♡이석운</span>
					<div class="sr_list_content_">
						<span><a href="">경로</a></span>
						<span>작성일자</span>
					</div>
				</div>
				<div class="sr_list_content">
					<span><a href="">제목3</a></span>
					<span>김정태♡한승채</span>
					<div class="sr_list_content_">
						<span><a href="">경로</a></span>
						<span>작성일자</span>
					</div>
				</div><!-- 게시물 끝 -->
				<!-- 더 보기 -->
				<div class="sr_list_more">
					<span><a href="">더 보기</a></span>
				</div><!-- 더 보기 -->
				
			</div> <!-- e-스포츠 끝-->
			
			<!-- 스포츠 영역 -->
			<div id="sr_list_sport">
				<!-- 제목 -->
				<div class="sr_list_header">
					<h3>스포츠</h3>
				</div> <!-- 제목 끝-->
				<!-- 게시물 -->
<%--			
				적용할때 이것만 있으면 됌  나머진 지워도 됨
 				<c:forEach var="list" items="${????}" varStatus="status">
 					<div class="sr_list_content">	
						<span class="sr_span_title"><a href="${list.link}">${list.title}</a></span>
						<span class="sr_span_content">${list.content}</span>
						<div class="sr_list_content_">
							<span><a href="${list.?}">${list.?}</a></span>
							<span>${list.date}</span>
						</div>
					</div>
				</c:forEach>
				<div class="sr_list_more">
					<span><a href="">더 보기</a></span>
				</div>
--%>
			</div> <!-- 스포츠 끝-->
			
			<!-- 문화생활 영역 -->
			<div id="sr_list_culture">
				<!-- 제목 -->
				<div class="sr_list_header">
					<h3>문화생활</h3>
				</div> <!-- 제목 끝-->
				<!-- 게시물 -->
<%--			
				적용할때 이것만 있으면 됌  나머진 지워도 됨
 				<c:forEach var="list" items="${????}" varStatus="status">
 					<div class="sr_list_content">	
						<span class="sr_span_title"><a href="${list.link}">${list.title}</a></span>
						<span class="sr_span_content">${list.content}</span>
						<div class="sr_list_content_">
							<span><a href="${list.?}">${list.?}</a></span>
							<span>${list.date}</span>
						</div>
					</div>
				</c:forEach> 
				<div class="sr_list_more">
					<span><a href="">더 보기</a></span>
				</div>
--%>
			</div> <!-- 문화생활 끝-->
		</div>
	</div>
</body>
</html>