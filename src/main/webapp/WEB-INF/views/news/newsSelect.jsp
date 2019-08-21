<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/newsSelect.css" rel="stylesheet">
<c:import url="../temp/commentBootstrap.jsp" />
<script type="text/javascript" src="../resources/js/news/newsSelect.js"></script>

</head>
<body>
<!-- header 추가 -->
 
<c:import url="../common/header.jsp" />

<input type="hidden" id="board" value="${news}">

<input type="hidden" id="num" value="${vo.num}">


<div id="board">
		<div id="board_title">
			
			<c:choose>
				<c:when test="${menu eq 'disease'}">
					<p id="title">질환 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 질환 정보에 관해 알려드립니다.</p>
				</c:when>
				<c:when test="${menu eq 'nutrition'}">
					<p id="title">영양 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
				</c:when>
				<c:otherwise>
					<p id="title">운동 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 운동 정보에 관해 알려드립니다.</p>
				</c:otherwise>
			</c:choose>
			
	
		
	</div>
	<div id="board_box">
	  <div id="board_nav">
		<c:choose>
			<c:when test="${menu eq 'disease'}">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease" style="color:#6bb5db;">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:when test="${menu eq 'nutrition'}">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:otherwise>
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise" style="color:#6bb5db;">운동 정보</a></li>
			</ul>
			</c:otherwise>
		</c:choose>
		</div>
		
		
		<div id="boardSelect">
			<input type="hidden" name="num" value="${vo.num}" id="nnum">
			<input type="hidden" name="menu" value="${vo.menu}" id="nmenu">
		
			<div class="title">${vo.title}</div>
			<div id="sub">
				<ul>
					<li>등록일</li>
					<li>${vo.reg_date}</li>
					<li>│</li>
					<li>조회수</li>
					<li>${vo.hit}</li>
				</ul>
			</div>
			
		
			
			<div id="main_contents">${vo.main_contents}</div>
			<div id="sub_contents">${vo.sub_contents}</div>
			
			<!----------------------------- 댓글 시작 -------------------------------->
					<div id="comment_box">
						<div id="comment">
							<div id="c_top">
								<input type="hidden" id="like_check">
								<input type="hidden" id="likeId" value="${memberVO.id}">
								<span id="c_count_title">전체댓글</span><span id="c_count">${totalCount}</span>
							</div>
							<c:choose>
								<c:when test="${not empty memberVO}">
								<div id="c_write_box">
									<c:choose>
									<c:when test="${memberVO.grade eq '1'}">
									<p id="c_writer">${memberVO.id}</p>
									</c:when>
									<c:otherwise>
									<p id="c_writer">관리자</p>
									</c:otherwise>
								</c:choose>
									<textarea class="c_area" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
									<span id="counter">(0 / 500)</span>
								</div>
								<div id="c_btn">
									<button id="comment_btn">등록</button>
								</div>
								</c:when>
								<c:otherwise>
								<div id="c_write_box2">
									<textarea placeholder="로그인 후 사용하실 수 있습니다" disabled="disabled"></textarea>
								</div>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 댓글 리스트 -->
						<div class="commentslist">
						
						</div>	
						<c:if test="${totalCount > 10}">
							<div id="more_box">
								<button id="more">+ 댓글 더보기</button>
							</div>
						</c:if>
						<!-- 댓글 수정 관련 modal -->
						<div class="container">
							<!-- Modal -->
						  <div class="modal fade" id="myModal" role="dialog">
						    <div class="modal-dialog">
						    
						      <!-- Modal content-->
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">댓글 수정</h4>
						        </div>
						        <div class="modal-body">
						        	<div class="form-group">
								      <label for="contents">작성자 :</label>
								      <input class="form-control" type="text" value="${memberVO.id}" disabled="disabled">
								    </div>
						          <div class="form-group">
								      <label for="contents">댓글 :</label>
								      <textarea class="form-control" rows="5" id="updateContents" name="contents"></textarea>
								      <input type="hidden" id="cnum">
								    </div>
						        </div>
						        <div class="modal-footer">
								      <button id="updateBtn" data-dismiss="modal">댓글 수정</button>
						          <button type="button" id="cancleBtn" data-dismiss="modal">취소</button>
						        </div>
						      </div>
						      
						    </div>
						  </div>
							</div>
						<!-- modal 끝 -->
						
						<!-- 댓글 답글 관련 modal -->
						<div class="container">
							<!-- Modal -->
						  <div class="modal fade" id="replyModal" role="dialog">
						    <div class="modal-dialog">
						    
						      <!-- Modal content-->
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">답글 달기</h4>
						        </div>
						        <div class="modal-body">
						        	<div class="form-group">
								      <label for="reid">작성자 :</label>
								      <input class="form-control" type="text" name="reid" id="reid" value="${memberVO.id}" readonly>
								    </div>
						          <div class="form-group">
								      <label for="contents">댓글 :</label>
								      <textarea class="form-control" rows="5" id="replyContents" name="contents"></textarea>
								      <input type="hidden" id="cnum2" value="1">
								    </div>
						        </div>
						        <div class="modal-footer">
								      <button id="replyBtn" data-dismiss="modal">답글 등록</button>
						          <button type="button" id="cancleBtn" data-dismiss="modal">취소</button>
						        </div>
						      </div>
						      
						    </div>
						  </div>
							</div>
						<!-- modal 끝 -->
						
					</div>
					<!----------------------------- 댓글 끝 -------------------------------->
			
			
			
			
			<div id="btn_box">
				<a href="./${menu}" id="list">목록</a>
				
				<button id="delete">삭제</button>
				<a href="./${vo.menu}Update?num=${vo.num}" id="update">수정</a>
			</div>
		
		</div>
		
	
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>