<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<script>
 function search() {

	let searchType = document.getElementsByName("main_select")[0].value;
	let keyword =  document.getElementsByName("main_txtContent")[0].value;

	if (keyword == ""){
		alert('검색 내용 입력 오류\n한글자 이상 검색해주세요');
	}else{
		location.href = "listpagesearch?&searchtype="+ searchType +"&keyword="+keyword;
	}

};
</script>
<!--
	기본적으로 메인메뉴가 보이는 header 페이지입니다.

	---- 설명 ----
	a태그 안의 hraf는 각 페이지가 펼처지는 url을 기입하면됨.
	예를 들어 login 페이지를 연다고 한다면 <a href="/hobby/logon>와 같이 하면됨
	나중에 백엔드 작업 끝나면 주석 삭제
 -->

<!-- 헤더 영역 -->
<div id="header">
	<!-- 헤더 로고, 검색, 로그인 영역 -->
	<div id="header-top">

		<!-- 로고 영역 -->
		<div id="header-logo">
			<a href="/hobby/"><img alt="로고" src="/hobby/resources/img/logo.png"></a> <!-- 로고는 기본적으로 홈으로 이동 -->
		</div> <!-- 로고 영역 끝-->

		<!-- 검색 영역 -->
		<div id="header-search">

			<!-- form 태그 사용 -->
			<form action="/hobby/listPageSearch" method="POST"> <!-- 변경 필요, 컨트롤러와 같은 경로 및 post or get 방식 -->
				<select class="input_select" name="main_select">
					<option value="title"> 제목 </option>
					<option value="content"> 내용 </option>
					<option value="writer"> 작성자 </option>
					<option value="title_content"> 제목+내용 </option>
				</select>
				<input type="text" class="input_text" maxlength="50" name="main_txtContent">
				<input type="button" id="searchBtn" class="input_button" value="검색" onclick="search()">
			</form><!-- form 태그 끝 -->
		</div><!-- 검색 영역 끝-->

		<!-- 헤더 로그인 영역 -->
		<div id="header-login">
			<ul>
				<c:choose>
					<c:when test="${mVo != null}"> <!-- 로그인 세션값이 존재하지 않으면 실행, eq는 같느냐? 물어보는것 -->
						<!-- 즉, 같으면 실행 --> <!-- 로그인 세션값이 존재하면 실행 -->
				    	<li><a href="logout">로그아웃</a></li> <!-- 로그아웃 페이지 이동 -->
						<li><a href="myInfo_page">내 정보</a></li> <!-- 내정보 페이지 이동 -->
					</c:when>
					<c:otherwise>
						<li><a href="login_page">로그인</a></li> <!-- 로그인 페이지 이동 -->
						<li><a href="create_account_view">회원가입</a></li> <!-- 회원가입 페이지 이동 -->
					</c:otherwise>
				</c:choose>
			</ul>
		</div><!-- 헤더 로그인 영역 끝-->

	</div><!-- 헤더 로고, 검색, 로그인 영역 끝-->

	<!-- 메뉴바 영역 -->
	<div id="header-nav">
		<!-- 메인메뉴 영역(일반 보여지는 메뉴) -->
		<ul id="header-navigation-main">
			<li><a href="board_notice?val=9">공지사항</a></li> <!-- 공지사항 게시판 페이지 이동 -->
			<li><a href="#">e-스포츠</a>
				<!-- 서브메뉴 영역(메인 메뉴위에 마우스가 올라오면 보여지는 메뉴) -->
				<ul class="header-navigation-sub">
					<li><a href="board_team?val=0">팀원모집</a></li> 	 <!--  e-스포츠 팀원모집 페이지 이동 -->
					<li><a href="board_tip?val=0">팁과 노하우</a></li> <!--  e-스포츠 팁과노하우 페이지 이동 -->
					<li><a href="board_qa?val=0">질문과 답변</a></li> <!--  e-스포츠 질문과답변 페이지 이동 -->
					<li><a href="board_free?val=0">자유 게시판</a></li> <!--  e-스포츠 자유게시판 페이지 이동 -->
				</ul> <!-- 서브메뉴 끝 -->
			</li>
			<li>
				<a href="/hobby/"><h2 class="hader-nav-main-title">스포츠</h2></a>
				<!-- 서브메뉴 영역(메인 메뉴위에 마우스가 올라오면 보여지는 메뉴) -->
				<ul class="header-navigation-sub">
					<li><a href="board_team?val=1">팀원모집</a></li> 	 <!--  e-스포츠 팀원모집 페이지 이동 -->
					<li><a href="board_tip?val=1">팁과 노하우</a></li> <!--  e-스포츠 팁과노하우 페이지 이동 -->
					<li><a href="board_qa?val=1">질문과 답변</a></li> <!--  e-스포츠 질문과답변 페이지 이동 -->
					<li><a href="board_free?val=1">자유 게시판</a></li> <!--  e-스포츠 자유게시판 페이지 이동 -->
				</ul> <!-- 서브메뉴 끝 -->
			</li>
			<li>
				<a href="/hobby/"><h2 class="hader-nav-main-title title_last">문화생활</h2></a>
				<!-- 서브메뉴 영역(메인 메뉴위에 마우스가 올라오면 보여지는 메뉴) -->
				<ul class="header-navigation-sub">
					<li><a href="board_team?val=2">팀원모집</a></li> 	 <!--  e-스포츠 팀원모집 페이지 이동 -->
					<li><a href="board_tip?val=2">팁과 노하우</a></li> <!--  e-스포츠 팁과노하우 페이지 이동 -->
					<li><a href="board_qa?val=2">질문과 답변</a></li> <!--  e-스포츠 질문과답변 페이지 이동 -->
					<li><a href="board_free?val=2">자유 게시판</a></li> <!--  e-스포츠 자유게시판 페이지 이동 -->
				</ul> <!-- 서브메뉴 끝 -->
			</li>
		</ul> <!-- 메인메뉴 끝 -->
	</div><!-- 메뉴바 끝 -->
</div><!-- 헤더 영역 끝-->
