<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/boardSelect.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/board/boardSelect.js"></script>
<c:import url="../temp/commentBootstrap.jsp" />
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />
<div id="board_wrap">
		<div id="board_title">
		<c:choose>
			<c:when test="${board eq 'notice'}">
			<!------------ notice ------------>
				<input type="hidden" id="board" value="${board}"> 
				<input type="hidden" id="num" value="${vo.num}">
				<p id="wtitle">공지사항</p>
				<p id="sub_title">쌍용백병원의 새로운 소식을 알려드립니다.</p>
			</c:when>
			<c:when test="${board eq 'qna'}">
			<!------------ qna ------------>
				<c:choose>
					<c:when test="${menu eq 'complaint'}">
						<p id="wtitle">건의합니다</p>
						<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
					</c:when>
					<c:when test="${menu eq 'praise'}">
						<p id="wtitle">칭찬합니다</p>
						<p id="sub_title">쌍용백병원을 이용하시면서 칭찬하고싶은 사항을 등록해주세요.</p>
					</c:when>
					<c:otherwise>
						<p id="wtitle">질문과 답변</p>
						<p id="sub_title">쌍용백병원을 이용하시면서 궁금한 사항을 등록해 주세요.</p>
					</c:otherwise>
					</c:choose>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="board" value="${board}">
				<input type="hidden" id="num" value="${vo.num}">
				<input type="hidden" id="c_num" value="${vo.num}">
				<p id="wtitle">커뮤니티</p>
				<p id="sub_title">쌍용백병원의 커뮤니티 게시판 입니다.</p>
			</c:otherwise>
		</c:choose>
		</div>
	<div id="board_box">
		<div id="board_nav">
			<c:choose>
					<c:when test="${board eq 'notice'}">
					<!------------ notice ------------>
						<ul>
							<li>병원안내</li>
							<li><a href="./${board}List" style="color: #6bb5db;">공지사항</a></li>
							<li><a href="../hospital/hospitalInfo">병원소개</a></li>
							<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
							<li><a href="../hospital/floorInfo">층별안내</a></li>
							<li><a href="../hospital/location">오시는 길</a></li>
						</ul>
					</c:when>
					<c:when test="${board eq 'qna'}">
					<!------------ qna ------------>
						<c:choose>
							<c:when test="${menu eq 'complaint'}">
								<ul>
									<li>고객의 소리</li>
									<li><a href="./complaint" style="color:#6BB5DB;">건의합니다</a></li>
									<li><a href="./praise">칭찬합니다</a></li>
									<li><a href="./qna">질문과답변</a></li>
								</ul>
							</c:when>
							<c:when test="${menu eq 'praise'}">
								<ul>
									<li>고객의 소리</li>
									<li><a href="./complaint">건의합니다</a></li>
									<li><a href="./praise" style="color:#6BB5DB;">칭찬합니다</a></li>
									<li><a href="./qna">질문과답변</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li>고객의 소리</li>
									<li><a href="./complaint">건의합니다</a></li>
									<li><a href="./praise">칭찬합니다</a></li>
									<li><a href="./qna" style="color:#6BB5DB;">질문과답변</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
					<!------------ community ------------>
						<ul>
							<li>병원커뮤니티</li>
							<li><a href="./communityList" style="color: #6bb5db;">커뮤니티</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
		</div>
		
		<div id="boardSelect">
			<c:choose>
				<c:when test="${board eq 'notice'}">
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
						<div id="contents">${vo.contents}</div>
				</c:when>
				<c:when test="${board eq 'qna'}">
				<!------------ qna ------------>
					<input type="hidden" name="num" value="${vo.num}" id="qnum">
					<input type="hidden" name="menu" value="${vo.menu}" id="qmenu">
					<input type="hidden" name="num" value="${vo.ref}" id="qref">
					<div class="title">${vo.title}</div>
						<div id="qsub">
							<ul style="width: 30%; float: left;">
								<li>작성자</li>
								<li>${vo.writer}</li>
								<li>│</li>
								<li>구분</li>
								<li>
								<c:choose>
													<c:when test="${vo.category eq 'site'}">
														<c:choose>
															<c:when test="${vo.depth eq '1'}">
																답변
															</c:when>
															<c:otherwise>
																사이트이용
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${vo.category eq 'web'}">
													<c:choose>
															<c:when test="${vo.depth eq '1'}">
																답변
															</c:when>
															<c:otherwise>
																병원이용
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${vo.category eq 'etc'}">
													<c:choose>
															<c:when test="${vo.depth eq '1'}">
																답변
															</c:when>
															<c:otherwise>
																기타
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
								</li>
							</ul>
							<ul style="width: 27%; float: right;">
								<li>등록일</li>
								<li>${vo.reg_date}</li>
								<li>│</li>
								<li>조회수</li>
								<li>${vo.hit}</li>
							</ul>
						</div>		
					<div id="contents">${vo.contents}</div>		
				</c:when>
				<c:otherwise>
					<!------------ commu ------------>
					<div class="title">${vo.title}</div>
						<div id="qsub">
							<ul style="width: 30%; float: left;">
								<li>작성자</li>
								<li>${vo.writer}</li>
							</ul>
							<ul style="width: 27%; float: right;">
								<li>등록일</li>
								<li>${vo.reg_date}</li>
								<li>│</li>
								<li>조회수</li>
								<li>${vo.hit}</li>
							</ul>
						</div>		
					<div id="contents">${vo.contents}</div>	
					
					<!----------------------------- 댓글 시작 -------------------------------->
					<div id="comment_box">
						<div id="comment">
							<div id="c_top">
								<input type="hidden" id="like_check">
								<input type="hidden" id="c_num" value="${vo.num}">
								<span id="c_count_title">전체댓글</span><span id="c_count">${totalCount}</span>
							</div>
							<c:choose>
								<c:when test="${not empty memberVO}">
								<div id="c_write_box">
									<p id="c_writer">${memberVO.id}</p>
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
								      <input type="hidden" id="ccnum">
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
			
			
				
				</c:otherwise>
			</c:choose>
			
			<div id="btn_box">
			<c:choose>
				<c:when test="${board eq 'qna'}">
				<!------------ qna ------------>
						<a href="./${menu}" id="list">목록</a>
						<c:choose>
							<c:when test="${vo.depth eq '1' && memberVO.grade eq '2'}">
							<button id="reply_delete">삭제</button>
							</c:when>
							<c:when test="${vo.depth eq '0' && memberVO.id eq vo.writer || memberVO.grade eq '2'}">
							<button id="q_delete">삭제</button>
							</c:when>
						</c:choose>
						<c:if test="${memberVO.id eq vo.writer || memberVO.grade eq '2'}">
						<a href="./${menu}Update?num=${vo.num}" id="update">수정</a>
						</c:if>
						<c:if test="${memberVO.grade eq '2'}">
						<a href="./${menu}Reply?num=${vo.num}" id="reply">답글달기</a>
						</c:if>
				</c:when>
				<c:otherwise>
							<!------------ notice ------------>
								<a href="./${board}List" id="list">목록</a>
						<c:choose>
							<c:when test="${board eq 'notice'}">
								<c:if test="${memberVO.grade eq '2'}">
									<button id="delete">삭제</button>
									<a href="./${board}Update?num=${vo.num}" id="update">수정</a>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${memberVO.id eq vo.writer || memberVO.grade eq '2'}">
									<button id="delete">삭제</button>
									<a href="./${board}Update?num=${vo.num}" id="update">수정</a>
								</c:if>
							</c:otherwise>
						</c:choose>
				</c:otherwise>
			</c:choose>
			</div>
		
		</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>