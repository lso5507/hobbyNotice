<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
	기본적으로 중간영역 좌측에 바로가기 메뉴가 보이는 left 페이지입니다.

	---- 설명 ----
	a태그 안의 hraf는 각 페이지가 펼처지는 url을 기입하면됨.
	예를 들어 login 페이지를 연다고 한다면 <a href="/hobby/logon>와 같이 하면됨
 -->

<!-- 바로가기 영역 -->
<div id="aside">
	<!-- 로그인 영역 -->
	<div id="aside-login">
		<div id="aside-login_buttom">
			<a href="login_page">로그인</a> <!-- 로그인 페이지 이동 -->
		</div>
		
		<div id="aside-login_member">
			<a href="create_account_view">회원가입 </a> <!-- 회원가입 페이지 이동 -->
			<a href="idSearch_page">ID찾기</a> <!-- ID찾기 페이지 이동 -->
			<a href="pwSearch_page">PW찾기</a> <!-- PW찾기 페이지 이동 -->
		</div>
	</div><!-- 로그인 영역 끝 -->

	<!-- 공지사항 영역 -->
	<div id="aside-notice">
		<!-- 제목 -->
		<h2 class="aside-link_title">공지사항</h2>
		<!-- 바로가기 링크 -->
		<a href="board_notice?val=9" class="aside-link_menu">┗ 공지사항</a> <!-- 공지사항 게시판 이동 -->
	</div>
	<!-- 카테고리별 영역 -->
		<!-- e-스포츠 영역 -->
	<div id="aside-esport">
		<h2 class="aside-link_title">e-스포츠</h2>
		<hr>
		<a href="board_team?val=0" class="aside-link_menu">┗ 팀원모집</a> 	<!-- e-스포츠 팀원모집 게시판 이동 -->
		<a href="board_tip?val=0" class="aside-link_menu">┗ 팁과 노하우</a><!-- e-스포츠 팁과노하우 게시판 이동 -->
		<a href="board_qa?val=0" class="aside-link_menu">┗ 질문과 답변</a><!-- e-스포츠 질문과답변 게시판 이동 -->
		<a href="board_free?val=0" class="aside-link_menu">┗ 자유게시판</a>	<!-- e-스포츠 자유게시판 게시판 이동 -->
	</div>
		<!-- 스포츠 영역 -->
	<div id="aside-sport">
		<h2 class="aside-link_title">스포츠</h2>
		<hr>
		<a href="board_team?val=1" class="aside-link_menu">┗ 팀원모집</a>	<!-- 스포츠 팀원모집 게시판 이동 -->
		<a href="board_tip?val=1" class="aside-link_menu">┗ 팁과 노하우</a><!-- 스포츠 팁과노하우 게시판 이동 -->
		<a href="board_qa?val=1" class="aside-link_menu">┗ 질문과 답변</a><!-- 스포츠 질문과답변 게시판 이동 -->
		<a href="board_free?val=1" class="aside-link_menu">┗ 자유게시판</a> <!-- 스포츠 자유게시판 게시판 이동 -->
	</div>
		<!-- 문화생활 영역 -->
	<div id="aside-culture">
		<h2 class="aside-link_title">문화생활</h2>
		<hr>
		<a href="board_team?val=2" class="aside-link_menu">┗ 팀원모집</a>	<!-- 문화생활 팀원모집 게시판 이동 -->
		<a href="board_tip?val=2" class="aside-link_menu">┗ 팁과 노하우</a><!-- 문화생활 팁과노하우 게시판 이동 -->
		<a href="board_qa?val=2" class="aside-link_menu">┗ 질문과 답변</a><!-- 문화생활 질문과답변 게시판 이동 -->
		<a href="board_free?val=2" class="aside-link_menu">┗ 자유게시판</a> <!-- 문화생활 자유게시판 게시판 이동 -->
	</div>
</div><!-- 바로가기 영역 끝 -->
