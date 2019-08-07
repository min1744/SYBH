<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="list">

			<!-- foreach 돌릴곳 -->
					<div class="c_list_box" id="${list.qcnum}">
					
					<!-- 작성자/수정/삭제 -->
					<div class="c_list_top">
						<p class="c_list_writer">
						${list.id}
						</p>
						
						<div class="c_list_ud">
							<ul>
								<li><a href="" class="c_update" title="${list.qcnum}"
								data-toggle="modal" data-target="#myModal">수정</a></li>
								<li>│</li>
								<li><a href="" class="c_delete" id="${list.qcnum}">삭제</a></li>
							</ul>
						</div>
					</div>
						
						<img alt="best" src="../resources/images/best.png" class="best_icon">
						<span class="c_contents" id="c${list.qcnum}">${list.contents}</span>
						
						<!-- 날짜/답글/신고 -->
						<div class="c_list_box_bottom">
							<div class="c_list_bottom">
								<ul>
									<li class="c_date">${list.reg_date}</li>
									<li>│</li>
									<li class="c_reply"><a href="" title="${list.qcnum}" class="c_replyBtn"
									data-toggle="modal" data-target="#replyModal">답글달기</a></li>
									<li>│</li>
									<li class="c_report"><a href="">신고</a></li>
								</ul>
						</div>
						
						<!-- 좋아요/싫어요 -->
						<div class="c_like_bottom">
							<a href="" class="like"><img alt="like" src="../resources/images/like.png">0</a>
							<a href="" class="hate"><img alt="hate" src="../resources/images/hate.png">0</a>
						</div>
						
						</div>
					</div>
					<!-- foreach -->

</c:forEach>

<!-- ----------------------------------- -->

