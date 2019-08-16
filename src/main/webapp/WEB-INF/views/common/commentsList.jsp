<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="list">
			<!-- foreach 돌릴곳 -->
				<c:if test="${list.depth eq '1'}">
					<div class="redepth" id="${list.qcnum}">
				</c:if>
				<c:if test="${list.depth eq '0'}">
					<div class="c_list_box" id="${list.qcnum}">
				</c:if>
					<!-- 작성자/수정/삭제 -->
					<div class="c_list_top">
						<c:forEach begin="1" end="${list.depth}">
							<img class="c_reicon" width="20px" src="../resources/images/reply.png" style="transform: rotate(-180deg);">
						</c:forEach>
						<span class="c_list_writer">
						${list.id}
						</span>
						<span class="c_date">
						${list.reg_date}
						</span>
						
						<div class="c_list_ud">
							<ul>
								<!-- <li class="c_report"><a href="">신고</a></li>
								<li>│</li> -->
								<c:choose>
									<c:when test="${list.id eq memberVO.id || memberVO.grade eq '2'}">
										<li><a href="" class="c_update" title="${list.qcnum}"
										data-toggle="modal" data-target="#myModal">수정</a></li>
										<li>│</li>
										<c:if test="${list.depth eq '0'}">
										<li><a href="" class="c_delete" id="${list.ref}">삭제</a></li>
										</c:if>
										<c:if test="${list.depth eq '1'}">
										<li><a href="" class="reply_delete" id="${list.qcnum}">삭제</a></li>
										</c:if>
									</c:when>
								</c:choose>
							</ul>
						</div>
					</div>
					<c:choose>
						<c:when test="${list.depth eq '1'}">
						</c:when>
						<c:when test="${list.depth eq '0'}">
							<c:if test="${list.like_cnt > '30'}">
								<img alt="best" src="../resources/images/best.png" class="best_icon">
							</c:if>
						</c:when>
					</c:choose>
						<p class="c_contents" id="c${list.qcnum}">${list.contents}</p>
						<!-- 답글 -->
						<div class="c_list_box_bottom">
							<div class="c_list_bottom">
								<ul>
										<c:choose>
											<c:when test="${memberVO.grade eq '1' && list.depth eq '0'}">
												<li class="c_reply"><a href="" title="${list.qcnum}" class="c_replyBtn"
												data-toggle="modal" data-target="#replyModal">답글달기</a></li>
											</c:when>
											<c:when test="${memberVO.grade eq '2' && list.depth eq '0'}">
												<li class="c_reply"><a href="" title="${list.qcnum}" class="c_replyBtn"
												data-toggle="modal" data-target="#replyModal">답글달기</a></li>
											</c:when>
										</c:choose>
								</ul>
						</div>
						
						<!-- 좋아요/싫어요 -->
						<c:if test="${list.depth eq '1'}">
						</c:if>
						<c:if test="${list.depth eq '0'}">
						<div class="c_like_bottom">
							<a href="" class="like" title="${list.qcnum}"><img alt="like" src="../resources/images/like.png">${list.like_cnt}</a>
						</div>
						</c:if>
						</div>
					</div>
					<!-- foreach -->

</c:forEach>

<!-- ----------------------------------- -->

