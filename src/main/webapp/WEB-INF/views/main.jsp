<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취미 공유 커뮤니티</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" type="text/css" href="/hobby/resources/css/mainstyle.css">
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
						<a href="/hobby/"><img alt="" src="">나는야 로고이미지</a> 
					</div> <!-- header-logo 끝-->
					
					<!-- 검색 영역 -->
					<div id="header-search">
						<!-- form 태그 사용 -->
						<form action="??????" method="get"> <!-- 백엔드필요 -->
							<select>
								<option value="serarch_title"> 제목 </option>
								<option value="serarch_name"> 작성자 </option>
								<option value="serarch_category"> 카테고리 </option>
							</select>
							<input type="text" name="serarch_txtbox" maxlength="20">
							<input type="submit" value="검색">
						</form>
					</div><!-- header-search 끝-->
					
					<!-- 헤더 로그인 영역 -->
					<div id="header-login">
						<ul id="header-login_nav">
							<li class="header-login_nav_li">
								<a href="#" class="header-login_nav_a">로그인</a>
							</li>
							<li class="header-login_nav_li">
								<a href="#" class="header-login_nav_a">회원가입</a>
							</li>
						</ul>
					</div><!-- header-login 끝-->
				</div><!-- header_top 끝-->
			
				<!-- 메뉴바 영역 -->
				<div id="header-navigation">
					<!-- 메인메뉴 영역 -->
					<ul id="header-navigation_main">
						<li class="header-navigation_main_li">
							<a href="#" class="header-navigation_main_a">공지사항</a>
						</li>
						<li class="header-navigation_main_li">
							<a href="#" class="header-navigation_main_a">e-스포츠</a>
							<!-- 서브메뉴 영역 -->
							<ul class="header-navigation_sub">
								<li class="header-navigation_sub_li">
									<a href="#">팀원모집</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">팁과 노하우</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">질문과 답변</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">자유 게시판</a>
								</li>
							</ul> <!-- 서브메뉴 끝 -->
						</li>
						<li class="header-navigation_main_li">
							<a href="#" class="header-navigation_main_a">스포츠</a>
							<!-- 서브메뉴 영역 -->
							<ul class="header-navigation_sub">
								<li class="header-navigation_sub_li">
									<a href="#">팀원모집</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">팁과 노하우</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">질문과 답변</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">자유 게시판</a>
								</li>
							</ul> <!-- 서브메뉴 끝-->
						</li>
						<li class="header-navigation_main_li">
							<a href="#" class="header-navigation_main_a">문화생활</a>
							<!-- 서브메뉴 영역 -->
							<ul class="header-navigation_sub">
								<li class="header-navigation_sub_li">
									<a href="#">팀원모집</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">팁과 노하우</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">질문과 답변</a>
								</li>
								<li class="header-navigation_sub_li">
									<a href="#">자유 게시판</a>
								</li>
							</ul><!-- 서브메뉴 끝 --> 
						</li>
					</ul> <!-- 메인메뉴 끝 -->
				</div><!-- header_bottom 끝 -->
				
			</div><!-- 헤더 영역 끝--> 
			<!-- 중간 영역 -->
			<div id="content">
				<!-- 바로가기 영역 -->
				<div id="aside">
					<!-- 로그인 영역 -->
					<div id="aside-login">
						<div id="aside-login_buttom">
							<a href="" class="aside-login_buttom_a">로그인</a>
						</div>
						<div id="aside-login_member">
							<spen><a href="">회원가입 </a></spen>
							<spen><a href="">ID찾기</a></spen>
							<spen><a href="">PW찾기</a></spen>
						</div>
					</div><!-- 로그인 영역 끝 -->
					
					<div id="aside-notice">
						<h1> 공지사항 </h1>
						<hr>
						<a href="#" class="block">공지사항</a>
					</div>
					<div id="aside-esport">
						<h1> e-스포츠 </h1>
						<hr>
						<a href="#" class="block">팀원모집</a>
						<a href="#" class="block">팁과 노하우</a>
						<a href="#" class="block">질문과 답변</a>
						<a href="#" class="block">자유게시판</a>
					</div>
					<div id="aside-sport">
						<h1> 스포츠 </h1>
						<hr>
						<a href="#" class="block">팀원모집</a>
						<a href="#" class="block">팁과 노하우</a>
						<a href="#" class="block">질문과 답변</a>
						<a href="#" class="block">자유게시판</a>
					</div>
					<div id="aside-culture">
						<h1> 문화생활 </h1>
						<hr>
						<a href="#" class="block">팀원모집</a>
						<a href="#" class="block">팁과 노하우</a>
						<a href="#" class="block">질문과 답변</a>
						<a href="#" class="block">자유게시판</a>
					</div>
				</div><!-- aside 끝 -->
				<!-- 최신 및 인기 게시물 영역 -->
				<div id="section">
					<!-- 공지사항 영역-->
					<div id="section-notice">
						<!-- 본문 제목 -->
						<div id="section-notice_title">
							<h1>공지사항</h1>
						</div><!-- 본문 제목 끝-->
						<!-- 공지사항 게시글 -->
						<div id="section-notice_content">
							<ul class="section-notice_content_ul">
								<li class="section-notice_content_li">
									<a href="">첫번째 내용</a>
								</li>
								<li class="section-notice_content_li">
									<a href="">두번째 내용</a>
								</li>
								<li class="section-notice_content_li">
									<a href="">세번째 내용</a>
								</li>
							</ul>
						</div><!-- 공지사항 게시글 끝 -->
					</div><!-- 공지사항 영역 끝 -->
					<!-- 카테고리별 게시판 인기 및 최신 글 영역 -->
					<div id="section-category">
						<!-- 본문 제목 -->
						<div id="section-category_title">
							<h1>카테고리 별 인기 및 최신 게시물</h1>
						</div>
						<!-- 카테고리별 탭 메뉴 구현 -->
						<!-- e-스포츠 영역 -->
						<div id="section-category_tabmenu1">
							<h2> e-스포츠</h2>
							<ul class="section-category_tabmenu1_ul">
								<li data-tab="tab1" class="current">
									<a href=""> 팀원모집 </a>
								</li>
								<li data-tab="tab2" >
									<a href=""> 팁과 노하우 </a>
								</li>
								<li data-tab="tab3" >
									<a href=""> 질문과 답변 </a>
								</li>
								<li data-tab="tab4" >
									<a href=""> 자유게시판 </a>
								</li>
							</ul>
							<div id="tab1" class="section-category_tabmenu1_tabcon current">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab2" class="section-category_tabmenu1_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab3" class="section-category_tabmenu1_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab4" class="section-category_tabmenu1_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div><!-- e-스포츠 영역 끝-->
						
						<!-- 스포츠 영역 -->
						<div id="section-category_tabmenu2">
							<h2> 스포츠</h2>
							<ul class="section-category_tabmenu2_ul">
								<li data-tab="tab5" class="current">
									<a href=""> 팀원모집 </a>
								</li>
								<li data-tab="tab6" >
									<a href=""> 팁과 노하우 </a>
								</li>
								<li data-tab="tab7" >
									<a href=""> 질문과 답변 </a>
								</li>
								<li data-tab="tab8" >
									<a href=""> 자유게시판 </a>
								</li>
							</ul>
							<div id="tab5" class="section-category_tabmenu2_tabcon current">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab6" class="section-category_tabmenu2_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab7" class="section-category_tabmenu2_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab8" class="section-category_tabmenu2_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div><!-- 스포츠 영역 끝-->
						
						<!-- 문화생활 영역 -->
						<div id="section-category_tabmenu3">
							<h2> 문화생활</h2>
							<ul class="section-category_tabmenu3_ul">
								<li data-tab="tab9" class="current">
									<a href=""> 팀원모집 </a>
								</li>
								<li data-tab="tab10" >
									<a href=""> 팁과 노하우 </a>
								</li>
								<li data-tab="tab11" >
									<a href=""> 질문과 답변 </a>
								</li>
								<li data-tab="tab12" >
									<a href=""> 자유게시판 </a>
								</li>
							</ul>
							<div id="tab9" class="section-category_tabmenu3_tabcon current">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab10" class="section-category_tabmenu3_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab11" class="section-category_tabmenu3_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div id="tab12" class="section-category_tabmenu3_tabcon">
								<div>
									<h3>인기 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
										</ul>
									</div>
								</div>
								<div>
									<h3>최신 게시물</h3>
									<div class="board_content">
										<ul>
											<li><a href="">· 게시글1</a></li>
											<li><a href="">· 게시글2</a></li>
											<li><a href="">· 게시글3</a></li>
											<li><a href="">· 게시글4</a></li>
											<li><a href="">· 게시글5</a></li>
											<li><a href="">· 게시글6</a></li>
											<li><a href="">· 게시글7</a></li>
											<li><a href="">· 게시글8</a></li>
											<li><a href="">· 게시글9</a></li>
											<li><a href="">· 게시글9</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div><!-- 문화생활 영역 끝-->
					</div>
				</div><!-- section 끝 -->
			</div> <!-- content 끝 -->
			<div id="footer">
				<div id="footer-logo">
					<a href="">
						<img alt="" src="">
						로고
					</a>
				</div>
				<div id="footer-info">
					Copyright © 2020 대림대학교 소프트웨어과 승채와 쫄따구들
					<br> 각종 문의 연락처 ( 000-000-0000 )	
					
				</div>


			</div>
		</div> <!-- 메인화면 영역 끝-->
		<!-- 배너광고 영역 -->
		<div id="banner">
			<div class="banner_size">
				<a href=>
					<img alt="" src="">
					이미지1
				</a>
			</div>
			<div class="banner_size">
				<a href=>
					<img alt="" src="">
					이미지2
				</a>
			</div>
			<div class="banner_size">
				<a href=>
					<img alt="" src="">
					이미지3
				</a>
			</div>
		</div><!-- 배너광고 영역 끝-->
	</div> <!-- 메인화면 큰 틀 끝-->
	<!-- 탭메뉴 스크립트 -->	
	<script>
		$(function() {
			$('#section-category_tabmenu1 .section-category_tabmenu1_ul li').mouseover(function() { // 탭메뉴를 클릭했을때 함수 호출
				var activeTab = $(this).attr('data-tab'); //현재 선택한 data-tab의 값을 변수에 저장
				$('.section-category_tabmenu1_ul li').removeClass('current'); //모든 li의 class를 지움
				$('.section-category_tabmenu1_tabcon').removeClass('current'); //모든 div(내용)의 class를 지움
				$(this).addClass('current'); //선택한 li의 클래스에 current 추가 
				$('#' + activeTab).addClass('current'); // 변수에 저장된 값(div id)에 따라 내용 을 보여줌  
			})
		});
		
		$(function() {
			$('#section-category_tabmenu2 .section-category_tabmenu2_ul li').mouseover(function() { // 탭메뉴를 클릭했을때 함수 호출
				var activeTab = $(this).attr('data-tab'); 
				$('.section-category_tabmenu2_ul li').removeClass('current'); 
				$('.section-category_tabmenu2_tabcon').removeClass('current'); 
				$(this).addClass('current');  
				$('#' + activeTab).addClass('current');   
			})
		});
		
		$(function() {
			$('#section-category_tabmenu3 .section-category_tabmenu3_ul li').mouseover(function() { // 탭메뉴를 클릭했을때 함수 호출
				var activeTab = $(this).attr('data-tab'); 
				$('.section-category_tabmenu3_ul li').removeClass('current'); 
				$('.section-category_tabmenu3_tabcon').removeClass('current'); 
				$(this).addClass('current');  
				$('#' + activeTab).addClass('current');   
			})
		});
	</script>
</body>
</html>