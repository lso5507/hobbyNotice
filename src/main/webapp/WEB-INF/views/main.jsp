<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취미 공유 커뮤니티</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link href="/hobby/resources/css/mainstyle.css" rel="stylesheet">
</head>
<body>
	<!-- 메인화면 큰 틀 -->
	<div id="mainLayout">
		<!-- 메인화면 영역 -->
		<div id="main">
			<!-- 헤더 영역 -->
			<div id="header">
				<!-- 헤더 로고, 검색, 로그인 영역 -->
				<div id="header-top">
					<!-- 로고 영역 -->
					<div id="header-logo">
						<a href="/hobby/"><img alt="로고" src=""></a> 
					</div> <!-- 로고 영역 끝-->
					
					<!-- 검색 영역 -->
					<div id="header-search">
						<!-- form 태그 사용 -->
						<form action="??????" method="get"> <!-- 백엔드필요 -->
							<select class="input_select">
								<option value="serarch_title"> 제목 </option>
								<option value="serarch_content"> 내용 </option>
								<option value="serarch_name"> 작성자 </option>
								<option value="serarch_category"> 카테고리 </option>
							</select>
							<input type="text" class="input_text" maxlength="20">
							<input type="submit" class="input_button" value="검색">
						</form>
					</div><!-- 검색 영역 끝-->
					
					<!-- 헤더 로그인 영역 -->
					<div id="header-login">
						<ul>
							<li>
								<a href="#">로그인</a>
							</li>
							<li>
								<a href="#">회원가입</a>
							</li>
						</ul>
					</div><!-- 헤더 로그인 영역 끝-->
				</div><!-- 헤더 로고, 검색, 로그인 영역 끝-->
			
				<!-- 메뉴바 영역 -->
				<div id="header-navigation">
					<!-- 메인메뉴 영역(일반 보여지는 메뉴) -->
					<ul id="header-navigation-main">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">e-스포츠</a>
							<!-- 서브메뉴 영역(메인 메뉴위에 마우스가 올라오면 보여지는 메뉴) -->
							<ul class="header-navigation-sub">
								<li><a href="#">팀원모집</a></li>
								<li><a href="#">팁과 노하우</a></li>
								<li><a href="#">질문과 답변</a></li>
								<li><a href="#">자유 게시판</a></li>
							</ul> <!-- 서브메뉴 끝 -->
						</li>
						<li><a href="#">스포츠</a>
							<!-- 서브메뉴 영역(메인 메뉴위에 마우스가 올라오면 보여지는 메뉴) -->
							<ul class="header-navigation-sub">
								<li><a href="#">팀원모집</a></li>
								<li><a href="#">팁과 노하우</a></li>
								<li><a href="#">질문과 답변</a></li>
								<li><a href="#">자유 게시판</a></li>
							</ul> <!-- 서브메뉴 끝 -->
						</li>
						<li><a href="#">문화생활</a>
							<!-- 서브메뉴 영역(메인 메뉴위에 마우스가 올라오면 보여지는 메뉴) -->
							<ul class="header-navigation-sub">
								<li><a href="#">팀원모집</a></li>
								<li><a href="#">팁과 노하우</a></li>
								<li><a href="#">질문과 답변</a></li>
								<li><a href="#">자유 게시판</a></li>
							</ul> <!-- 서브메뉴 끝 -->
						</li>
					</ul> <!-- 메인메뉴 끝 -->
				</div><!-- 메뉴바 끝 -->		
			</div><!-- 헤더 영역 끝--> 
			
			<!-- 중간 영역 -->
			<div id="content">
				<!-- 바로가기 영역 -->
				<div id="aside">
					<!-- 로그인 영역 -->
					<div id="aside-login">
						<div id="aside-login_buttom">
							<a href="">로그인</a>
						</div>
						<div id="aside-login_member">
							<a href="">회원가입 </a>
							<a href="">ID찾기</a>
							<a href="">PW찾기</a>
						</div>
					</div><!-- 로그인 영역 끝 -->
					
					<!-- 공지사항 영역 -->
					<div id="aside-notice">
						<!-- 제목 -->
						<h2 class="aside-link_title">공지사항</h2>
						<hr>
						<!-- 바로가기 링크 -->
						<a href="#" class="aside-link_menu">┗ 공지사항</a>
					</div>
					<!-- 카테고리별 영역 -->
						<!-- e-스포츠 영역 -->
					<div id="aside-esport">
						<h2 class="aside-link_title">e-스포츠</h2>
						<hr>
						<a href="#" class="aside-link_menu">┗ 팀원모집</a>
						<a href="#" class="aside-link_menu">┗ 팁과 노하우</a>
						<a href="#" class="aside-link_menu">┗ 질문과 답변</a>
						<a href="#" class="aside-link_menu">┗ 자유게시판</a>
					</div>
						<!-- 스포츠 영역 -->
					<div id="aside-sport">
						<h2 class="aside-link_title">스포츠</h2>
						<hr>
						<a href="#" class="aside-link_menu">┗ 팀원모집</a>
						<a href="#" class="aside-link_menu">┗ 팁과 노하우</a>
						<a href="#" class="aside-link_menu">┗ 질문과 답변</a>
						<a href="#" class="aside-link_menu">┗ 자유게시판</a>
					</div>
						<!-- 문화생활 영역 -->
					<div id="aside-culture">
						<h2 class="aside-link_title">문화생활</h2>
						<hr>
						<a href="#" class="aside-link_menu">┗ 팀원모집</a>
						<a href="#" class="aside-link_menu">┗ 팁과 노하우</a>
						<a href="#" class="aside-link_menu">┗ 질문과 답변</a>
						<a href="#" class="aside-link_menu">┗ 자유게시판</a>
					</div>
				</div><!-- 바로가기 영역 끝 -->
				
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
									<li data-tab="tab1" class="current"><a href="#"> 팀원모집 </a></li>
									<li data-tab="tab2" ><a href="#"> 팁과 노하우 </a></li>
									<li data-tab="tab3" ><a href="#"> 질문과 답변 </a></li>
									<li data-tab="tab4" ><a href="#"> 자유게시판 </a></li>
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
									<li data-tab="tab5" class="current"><a href="#"> 팀원모집 </a></li>
									<li data-tab="tab6" ><a href="#"> 팁과 노하우 </a></li>
									<li data-tab="tab7" ><a href="#"> 질문과 답변 </a></li>
									<li data-tab="tab8" ><a href="#"> 자유게시판 </a></li>
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
									<li data-tab="tab9" class="current"><a href="#"> 팀원모집 </a></li>
									<li data-tab="tab10" ><a href="#"> 팁과 노하우 </a></li>
									<li data-tab="tab11" ><a href="#"> 질문과 답변 </a></li>
									<li data-tab="tab12" ><a href="#"> 자유게시판 </a></li>
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
			</div> <!-- content 끝 -->
			
			<!-- 각종 정보 제공 footer 영역 -->
			<div id="footer">
				<!-- 로고 영역 -->
				<div id="footer-logo">
					<a href="/hobby/"><img alt="로고" src=""></a>
				</div><!-- 로고 영역 끝-->
				<!-- 제작자 정보 영역 -->
				<div id="footer-info">
					Copyright © 2020 대림대학교 소프트웨어과 팀명
					<br> 각종 문의 연락처 ( 000-000-0000 )	
				</div><!-- 제작자 정보 끝 -->
			</div><!-- footer 끝 -->
		</div> <!-- 메인화면 영역 끝-->
		
		<!-- 배너광고 영역 -->
		<div id="banner">
			<div class="banner_size">
				<a href=""><img alt="광고1" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고2" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고3" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고4" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고5" src=""></a>
			</div>
		</div><!-- 배너광고 영역 끝-->
	</div> <!-- 메인화면 큰 틀 끝-->
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
</body>
</html>