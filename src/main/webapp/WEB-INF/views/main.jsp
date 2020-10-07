<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!-- 최신 및 인기 게시물 영역 -->
<div id="section">
	<!-- 공지사항 영역-->
	<div id="section-notice">
		<!-- 본문 제목 -->
		<h1 class="section-title">공지사항</h1>
		<!-- 공지사항 게시글 -->
		<div id="section-notice-content">
			<ul>
				<c:forEach var="i" begin="1" end="1">
				    <li>해당 게시글이 존재하지 않습니다.</li>
				</c:forEach>
			</ul>
		</div><!-- 공지사항 게시글 끝 -->
	</div><!-- 공지사항 영역 끝 -->

	<!-- 카테고리별 게시판 인기 및 최신 글 영역 -->
	<div id="section-category">
		<!-- e-스포츠 영역 -->
		<div id="section-esport">
			<!-- e-스포츠 본문 제목 -->
			<h1 class="section-title">E-스포츠</h1>
			<!-- e-스포츠 탭 메뉴 구현 -->
			<div class="section-category-tab">
				<ul id="esport_ul">
					<li data-tab="tab1" class="current"><span> 팀원모집 </span></li> 
					<li data-tab="tab2" ><span> 팁과 노하우 </span></li>
					<li data-tab="tab3" ><span> 질문과 답변 </span></li>
					<li data-tab="tab4" ><span> 자유게시판 </span></li>
				</ul>
				<!-- 탭 메뉴에 해당하는 인기 및 최신 게시글 영역 -->

				<!-- 팀원모집 -->
				<div id="tab1" class="section-category-esport-content current">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">팀원 모집 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 0 and hlist.bdCategory eq 0 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 0 and rlist.bdCategory eq 0 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팀원모집 끝 -->

				<!-- 팁과 노하우 -->
				<div id="tab2" class="section-category-esport-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">팁과 노하우 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 0 and hlist.bdCategory eq 1 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 0 and rlist.bdCategory eq 1 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팁과 노하우 끝 -->

				<!-- 질문과 답변 -->
				<div id="tab3" class="section-category-esport-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">질문과 답변 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 0 and hlist.bdCategory eq 3 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 0 and rlist.bdCategory eq 3 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 질문과 답변 끝 -->

				<!-- 자유 게시판 -->
				<div id="tab4" class="section-category-esport-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">자유 게시판 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 0 and hlist.bdCategory eq 2 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 0 and rlist.bdCategory eq 2 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
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
			<!-- 스포츠 탭 메뉴 구현 -->
			<div class="section-category-tab">
				<ul id="sport_ul">
					<li data-tab="tab5" class="current"><span> 팀원모집 </span></li>
					<li data-tab="tab6" ><span> 팁과 노하우 </span></li>
					<li data-tab="tab7" ><span> 질문과 답변 </span></li>
					<li data-tab="tab8" ><span> 자유게시판 </span></li>
				</ul>
				<!-- 탭 메뉴에 해당하는 인기 및 최신 게시글 영역 -->
				<!-- 팀원모집 -->
				<div id="tab5" class="section-category-sport-content current">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">팀원 모집 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 1 and hlist.bdCategory eq 0 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 1 and rlist.bdCategory eq 0 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팀원모집 끝 -->

				<!-- 팁과 노하우 -->
				<div id="tab6" class="section-category-sport-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">팁과 노하우 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 1 and hlist.bdCategory eq 1 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 1 and rlist.bdCategory eq 1 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팁과 노하우 끝 -->

				<!-- 질문과 답변 -->
				<div id="tab7" class="section-category-sport-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">질문과 답변 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 1 and hlist.bdCategory eq 3 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 1 and rlist.bdCategory eq 3 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 질문과 답변 끝 -->

				<!-- 자유 게시판 -->
				<div id="tab8" class="section-category-sport-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">자유 게시판 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 1 and hlist.bdCategory eq 2 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 1 and rlist.bdCategory eq 2 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
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
			<!-- 문화생활 탭 메뉴 구현 -->
			<div class="section-category-tab">
				<ul id="culture_ul">
					<li data-tab="tab9" class="current"><span> 팀원모집 </span></li>
					<li data-tab="tab10" ><span> 팁과 노하우 </span></li>
					<li data-tab="tab11" ><span> 질문과 답변 </span></li>
					<li data-tab="tab12" ><span> 자유게시판 </span></li>
				</ul>
				<!-- 탭 메뉴에 해당하는 인기 및 최신 게시글 영역 -->
				<!-- 팀원모집 -->
				<div id="tab9" class="section-category-culture-content current">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">팀원 모집 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 2 and hlist.bdCategory eq 0 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 2 and rlist.bdCategory eq 0 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팀원모집 끝 -->

				<!-- 팁과 노하우 -->
				<div id="tab10" class="section-category-culture-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">팁과 노하우 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 2 and hlist.bdCategory eq 1 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 2 and rlist.bdCategory eq 1 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 팁과 노하우 끝 -->

				<!-- 질문과 답변 -->
				<div id="tab11" class="section-category-culture-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">질문과 답변 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 2 and hlist.bdCategory eq 3 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 2 and rlist.bdCategory eq 3 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 최근 게시물 끝 -->
				</div><!-- 질문과 답변 끝 -->

				<!-- 자유 게시판 -->
				<div id="tab12" class="section-category-culture-content ">
					<!-- 인기 게시물 -->
					<div class="popularity-content">
						<h2 class="section-subtitle">자유 게시판 인기 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="hlist" items="${hitList}">
									<c:if test="${hlist.value eq 2 and hlist.bdCategory eq 2 and listCount <= 2 and hlist.bdLike ne 0}">
										<li><a href="board_detailview?cnt=<c:out value="${hlist.bdCno}"/>">· <c:out value="${hlist.bdTitle}"/></a></li>
										<c:set var="listCount" value="${listCount+1}"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 현재 인기글이 없습니다.</li>
								</c:if>
							</ul>
						</div><!-- 게시글 끝 -->
					</div><!-- 인기 게시물 끝 -->
					<!-- 최근 게시물 -->
					<div class="new-content">
						<h2 class="section-subtitle">최근 게시물</h2>
						<!-- 게시글 -->
						<div class="board_content">
							<ul>
								<c:set var="listCount" value="0"></c:set>
								<c:forEach var="rlist" items="${recentList}">
									<c:if test="${rlist.value eq 2 and rlist.bdCategory eq 2 and listCount <= 10}">
								    	<li><a href="board_detailview?cnt=<c:out value="${rlist.bdCno}"/>">· <c:out value="${rlist.bdTitle}"/></a></li>
								    	<c:set var="listCount" value="${listCount+1}"></c:set>
								    </c:if>
								</c:forEach>
								<c:if test="${listCount eq 0}">
									<li>· 해당 게시글이 존재하지 않습니다.</li>
								</c:if>
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
		$('#esport_ul li').click(function() { // 탭메뉴위에 마우스가 있을때 함수 호출
			var activeTab = $(this).attr('data-tab'); //현재 선택한 data-tab의 값을 변수에 저장
			$('#esport_ul li').removeClass('current'); // 모든 li의 class를 지움
			$('.section-category-esport-content').removeClass('current'); // 모든 div(내용)의 class를 지움
			$(this).addClass('current'); //선택한 li의 클래스에 current 추가
			$('#' + activeTab).addClass('current'); // 변수에 저장된 값(div id)에 따라 내용을 보여줌
		})
	});

	$(function() {
		$('#sport_ul li').click(function() { // 탭메뉴위에 마우스가 있을때 함수 호출
			var activeTab = $(this).attr('data-tab');
			$('#sport_ul li').removeClass('current');
			$('.section-category-sport-content').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});

	$(function() {
		$('#culture_ul li').click(function() { // 탭메뉴위에 마우스가 있을때 함수 호출
			var activeTab = $(this).attr('data-tab');
			$('#culture_ul li').removeClass('current');
			$('.section-category-culture-content').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});
</script>