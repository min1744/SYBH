<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/boardWrite.css" rel="stylesheet">
<c:import url="../temp/boot.jsp" />
<c:import url="../temp/summernote.jsp" />
<script type="text/javascript" src="../resources/js/summernote.js"></script>
<script type="text/javascript" src="../resources/js/board/boardUpdate.js"></script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />
<input type="hidden" id="board" value="${board}">
<input type="hidden" id="fixCount" value="${result}">


	<div id="board">
		<div id="board_title">
			<c:choose>
			<c:when test="${board eq 'notice'}">
			<!------------ notice ------------>
				<input type="hidden" id="dbFix" value="${vo.fix}">
				<p id="wtitle">공지수정</p>
			</c:when>
			<c:when test="${board eq 'qna'}">
			<!------------ qna ------------>
			<c:choose>
					<c:when test="${menu eq 'complaint'}">
						<p id="wtitle">건의 글수정</p>
						<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
					</c:when>
					<c:when test="${menu eq 'praise'}">
						<p id="wtitle">칭찬 글수정</p>
						<p id="sub_title">쌍용백병원을 이용하시면서 칭찬하고싶은 사항을 등록해주세요.</p>
					</c:when>
					<c:otherwise>
						<p id="wtitle">질문 글수정</p>
						<p id="sub_title">쌍용백병원을 이용하시면서 궁금한 사항을 등록해 주세요.</p>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<p id="wtitle">커뮤니티 글 수정</p>
			</c:otherwise>
		</c:choose>
		</div>

		<div id="board_box">
			<div id="form_box">
					<form id="frm" action="./${board}Update" method="post">
					<c:choose>
						<c:when test="${board eq 'qna'}">
						<!------------ qna ------------>
							<input type="hidden" name="menu" value="${vo.menu}">
							<input type="hidden" name="num" value="${vo.num}">
							<div class="float">
								<span class="title">제목</span> <input class="form-control"
									type="text" id="q_title" value="${vo.title}" name="title">
							</div>
							<div class="float">
								<span class="writer">작성자</span> <input class="form-control"
									type="text" id="q_writer" name="writer" value="${vo.writer}" readonly>
							</div>
								<div class="float">
									<span class="category">구분</span> 
									<select name="category" id="select" class="form-control">
											<c:choose>
													<c:when test="${vo.category eq 'site'}">
										<option value="site" selected="selected">사이트이용</option>
										<option value="web">병원이용</option>
										<option value="etc">기타</option>
													</c:when>
													<c:when test="${vo.category eq 'web'}">
										<option value="web" selected="selected">병원이용</option>
										<option value="site">사이트이용</option>
										<option value="etc">기타</option>
													</c:when>
													<c:when test="${vo.category eq 'etc'}">
										<option value="etc" selected="selected">기타</option>
										<option value="site">사이트이용</option>
										<option value="web">병원이용</option>
													</c:when>
												</c:choose>
									</select>
								</div>
							<div class="form-group" id="contents_box">
								<span class="contents">글내용</span>
								<textarea class="form-control" rows="5" cols="15" id="contents"
									name="contents">${vo.contents}</textarea>
							</div>
						</c:when>
						<c:otherwise>
						<!------------ notice & commu ------------>
								<input type="hidden" name="num" value="${vo.num}">
								<div class="float">
									<span class="title">제목</span> <input class="form-control"
										type="text" id="title" value="${vo.title}" name="title">
								</div>
								<c:choose>
								<c:when test="${board eq 'notice'}">
									<div class="float">
										<span class="writer">작성자</span> <input class="form-control"
											type="text" id="writer" name="writer" value="${memberVO.name}" readonly>
									</div>
								</c:when>
								<c:when test="${board eq 'community'}">
									<div class="float">
										<span class="writer">작성자</span> <input class="form-control"
											type="text" id="writer" name="writer" value="${memberVO.id}" readonly>
									</div>
								</c:when>
							</c:choose>
								<div class="form-group" id="contents_box">
									<span class="contents">글내용</span>
									<textarea class="form-control" rows="5" cols="15" id="contents"
										name="contents">${vo.contents}</textarea>
								</div>
							<c:if test="${board eq 'notice'}">
								<div class="form-group" id="fix_box">
									<img src="../resources/images/info.png" id="fix_info_1">
									 <label	for="fix" class="contents">공지사항 고정</label> 
									 <input type="checkbox"	id="fix" name="fix" value="1"> 
									 <img alt="상단고정은 최대 3개까지가능합니다" src="../resources/images/fix_info.png"	id="fix_info">
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
						<div id="write_btn">
							<input id="write" type="button" value="글수정">
						</div>
					</form>
			</div>
		</div>
	</div>

	<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>