<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

 <!-- 
	처음 메인 화면, 이 body 구역은 다른 페이지로 전환이 됨.
	나머지는 고정.
	
	---- 설명 ----
	a태그 안의 hraf는 각 페이지가 펼처지는 url을 기입하면됨. 
	예를 들어 login 페이지를 연다고 한다면 <a href="/hobby/logon>와 같이 하면됨
 -->

<!-- 최신 및 인기 게시물 영역 -->
<div id="section">
	<!-- 공지사항 영역-->
	<div id="section-notice">
		<!-- 본문 제목 -->
		<h1 class="section-title">공지사항</h1>
		<hr>
		<!-- 공지사항 게시글 -->
		<div id="section-notice-content">
			<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
				<c:forEach var="list" items="${noticeList}" varStatus="status">
				    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
				</c:forEach>
--%>
				<li><a href="">첫번째 내용</a></li>
				<li><a href="">두번째 내용</a></li>
				<li><a href="">세번째 내용</a></li>
			</ul>
		</div><!-- 공지사항 게시글 끝 -->
	</div><!-- 공지사항 영역 끝 -->
	
	<!-- 카테고리별 게시판 인기 및 최신 글 영역 -->
	<div id="section-category">
		<!-- e-스포츠 영역 -->
		<div id="section-esport">
			<!-- e-스포츠 본문 제목 -->
			<h1 class="section-title">e-스포츠</h1>
			<hr>
			<!-- e-스포츠 탭 메뉴 구현 -->
			<div id="section-category-esport">
				<ul id="esport_ul">
					<li data-tab="tab1" class="current"><a href="board/board_team?val=0"> 팀원모집 </a></li> 
					<li data-tab="tab2" ><a href="board_tip?val=0"> 팁과 노하우 </a></li>
					<li data-tab="tab3" ><a href="board_qa?val=0"> 질문과 답변 </a></li>
					<li data-tab="tab4" ><a href="board_free?val=0"> 자유게시판 </a></li>
				</ul>
				<!-- 탭 메뉴에 해당하는 인기 및 최신 게시글 영역 -->
				<!-- 팀원모집 -->
				<div id="tab1" class="section-category-esport-context current">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">팀원 모집 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팀원모집 끝 -->
				<!-- 팁과 노하우 -->
				<div id="tab2" class="section-category-esport-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">팁과 노하우 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팁과 노하우 끝 -->
				<!-- 질문과 답변 -->
				<div id="tab3" class="section-category-esport-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">질문과 답변 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 질문과 답변 끝 -->
				<!-- 자유 게시판 -->
				<div id="tab4" class="section-category-esport-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">자유 게시판 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 자유 게시판 끝 -->
			</div><!-- e-스포츠 탭 메뉴 끝 -->
		</div><!-- e-스포츠 영역 끝 -->
		
		<!-- 스포츠 영역 -->
		<div id="section-sport">
			<!-- 스포츠 본문 제목 -->
			<h1 class="section-title">스포츠</h1>
			<hr>
			<!-- 스포츠 탭 메뉴 구현 -->
			<div id="section-category-sport">
				<ul id="sport_ul">
					<li data-tab="tab5" class="current"><a href="board_team?val=1"> 팀원모집 </a></li>
					<li data-tab="tab6" ><a href="board_tip?val=1"> 팁과 노하우 </a></li>
					<li data-tab="tab7" ><a href="board_qa?val=1"> 질문과 답변 </a></li>
					<li data-tab="tab8" ><a href="board_free?val=1"> 자유게시판 </a></li>
				</ul>
				<!-- 탭 메뉴에 해당하는 인기 및 최신 게시글 영역 -->
				<!-- 팀원모집 -->
				<div id="tab5" class="section-category-sport-context current">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">팀원 모집 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팀원모집 끝 -->
				<!-- 팁과 노하우 -->
				<div id="tab6" class="section-category-sport-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">팁과 노하우 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팁과 노하우 끝 -->
				<!-- 질문과 답변 -->
				<div id="tab7" class="section-category-sport-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">질문과 답변 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 질문과 답변 끝 -->
				<!-- 자유 게시판 -->
				<div id="tab8" class="section-category-sport-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">자유 게시판 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 자유 게시판 끝 -->
			</div><!-- 스포츠 탭 메뉴 끝 -->
		</div><!-- 스포츠 영역 끝 -->
		
		<!-- 문화생활 영역 -->
		<div id="section-culture">
			<!-- 문화생활 본문 제목 -->
			<h1 class="section-title">문화생활</h1>
			<hr>
			<!-- 스포츠 탭 메뉴 구현 -->
			<div id=section-category-culture>
				<ul id="culture_ul">
					<li data-tab="tab9" class="current"><a href="board/board_team?val=2"> 팀원모집 </a></li>
					<li data-tab="tab10" ><a href="board_tip?val=2"> 팁과 노하우 </a></li>
					<li data-tab="tab11" ><a href="board_qa?val=2"> 질문과 답변 </a></li>
					<li data-tab="tab12" ><a href="board_free?val=2"> 자유게시판 </a></li>
				</ul>
				<!-- 탭 메뉴에 해당하는 인기 및 최신 게시글 영역 -->
				<!-- 팀원모집 -->
				<div id="tab9" class="section-category-culture-context current">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">팀원 모집 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팀원모집 끝 -->
				<!-- 팁과 노하우 -->
				<div id="tab10" class="section-category-culture-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">팁과 노하우 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팁과 노하우 끝 -->
				<!-- 질문과 답변 -->
				<div id="tab11" class="section-category-culture-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">질문과 답변 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 질문과 답변 끝 -->
				<!-- 자유 게시판 -->
				<div id="tab12" class="section-category-culture-context ">
					<!-- 인기 게시물 -->
					<div class="popularity-context">
						<h2 class="section-subtitle">자유 게시판 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 3개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-context">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
<%--			게시글의 제목과 링크 경로를 가져와 데이터를 집어 넣는다. 최대 10개만 가져오도록 설정해야함 			
								<c:forEach var="list" items="${noticeList}" varStatus="status">
								    <li><a href="<c:out value="${list.link}"/>"> <c:out value="${list.title}"/></a></li>
								</c:forEach>
--%>
								<li><a href="#">· 게시글1</a></li>
								<li><a href="#">· 게시글2</a></li>
								<li><a href="#">· 게시글3</a></li>
								<li><a href="#">· 게시글4</a></li>
								<li><a href="#">· 게시글5</a></li>
								<li><a href="#">· 게시글6</a></li>
								<li><a href="#">· 게시글7</a></li>
								<li><a href="#">· 게시글8</a></li>
								<li><a href="#">· 게시글9</a></li>
								<li><a href="#">· 게시글10</a></li>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 자유 게시판 끝 -->
			</div><!-- 문화생활 탭 메뉴 끝 -->
		</div><!-- 문화생활 끝 -->
	</div><!-- 카테고리별 게시판 인기 및 최신 글 영역 끝 -->
</div><!-- section 끝 -->


<!-- 탭메뉴 스크립트 -->	
<script>
	$(function() {
		$('#esport_ul li').mouseover(function() { // 탭메뉴위에 마우스가 있을때 함수 호출
			var activeTab = $(this).attr('data-tab'); //현재 선택한 data-tab의 값을 변수에 저장
			$('#section-category-esport ul li').removeClass('current'); // 모든 li의 class를 지움
			$('.section-category-esport-context').removeClass('current'); // 모든 div(내용)의 class를 지움
			$(this).addClass('current'); //선택한 li의 클래스에 current 추가 
			$('#' + activeTab).addClass('current'); // 변수에 저장된 값(div id)에 따라 내용을 보여줌  
		})
	});
	
	$(function() {
		$('#sport_ul li').mouseover(function() { // 탭메뉴위에 마우스가 있을때 함수 호출
			var activeTab = $(this).attr('data-tab'); 
			$('#section-category-sport ul li').removeClass('current'); 
			$('.section-category-sport-context').removeClass('current'); 
			$(this).addClass('current');  
			$('#' + activeTab).addClass('current');   
		})
	});
	
	$(function() {
		$('#culture_ul li').mouseover(function() { // 탭메뉴위에 마우스가 있을때 함수 호출
			var activeTab = $(this).attr('data-tab');
			$('#section-category-culture ul li').removeClass('current'); 
			$('.section-category-culture-context').removeClass('current'); 
			$(this).addClass('current');  
			$('#' + activeTab).addClass('current');   
		})
	});
</script>