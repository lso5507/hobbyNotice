<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sr_main">
	
	<div id="sr_content">
		<!-- e-스포츠 영역 -->
		<div id="sr_list_esport">
			<!-- 제목 -->
			<div class="sr_list_header">
				<h3>E-스포츠</h3>
			</div> <!-- 제목 끝-->
			<!-- 게시물 -->
			<c:forEach var="list" items="${list}" varStatus="status">
				<div class="sr_list_content">	
					<span class="sr_span_title"><%--<a href="<c:out value="${list.link}"/>">제목 링크--%><c:out value="${list.bdTitle}"/></span>
					<span class="sr_span_content"><c:out value="${list.bdContent}"/></span>
					<div class="sr_list_content_">
						<%--<span><a href="<c:out value="${list.?}"/>"> <c:out value="${list.?}"/></a></span>경로 링크--%>
						<span><c:out value="${list.bdDate}"/></span>
					</div>
				</div>
			</c:forEach> 
			<div class="sr_list_more">
				<span><a href="">더 보기</a></span>
			</div>
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
			<c:forEach var="list" items="${____}" varStatus="status">
				<div class="sr_list_content">	
					<span class="sr_span_title"><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></span>
					<span class="sr_span_content"><c:out value="${list.content}"/></span>
					<div class="sr_list_content_">
						<span><a href="<c:out value="${list.?}"/>"> <c:out value="${list.?}"/></a></span>
						<span><c:out value="${list.date}"/></span>
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
			<c:forEach var="list" items="${____}" varStatus="status">
				<div class="sr_list_content">	
					<span class="sr_span_title"><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></span>
					<span class="sr_span_content"><c:out value="${list.content}"/></span>
					<div class="sr_list_content_">
						<span><a href="<c:out value="${list.?}"/>"> <c:out value="${list.?}"/></a></span>
						<span><c:out value="${list.date}"/></span>
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
