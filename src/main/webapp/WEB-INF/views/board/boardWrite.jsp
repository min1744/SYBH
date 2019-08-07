<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/boardWrite.css" rel="stylesheet">
<c:import url="../temp/boot.jsp" />
<c:import url="../temp/summernote.jsp" />
<script type="text/javascript" src="../resources/js/summernote.js"></script>
<script type="text/javascript" src="../resources/js/board/boardWrite.js"></script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<!-- ///////////////////////////////////////////////////////// -->
<!-- ---------------------- 공지사항 write ---------------------- -->
<!-- ///////////////////////////////////////////////////////// -->
<c:if test="${board eq 'notice'}">

<input type="hidden" id="fixCount" value="${result}">
	<div id="board">
		<div id="board_title">
			<p id="wtitle">공지등록</p>
		</div>

		<div id="board_box">
			<div id="form_box">
				<form id="frm" action="./${board}Write" method="post">
					<div class="float">
						<span class="title">제목</span> <input class="form-control"
							type="text" id="title" name="title">
					</div>
					<div class="float">
						<span class="writer">작성자</span> <input class="form-control"
							type="text" id="writer" name="writer" value="admin" readonly>
					</div>
					<div class="form-group" id="contents_box">
						<span class="contents">글내용</span>
						<textarea class="form-control" rows="5" cols="15" id="contents"
							name="contents"></textarea>
					</div>
					<div class="form-group" id="fix_box">
						<img src="../resources/images/info.png" id="fix_info_1">
						 <label	for="fix" class="contents">공지사항 고정</label> 
						 <input type="checkbox"	id="fix" name="fix" value="1"> 
						 <img alt="상단고정은 최대 3개까지가능합니다" src="../resources/images/fix_info.png"	id="fix_info">
					</div>
					<!-- <p>공지사항 고정<input type="checkbox" id="fix" name="fix" value="1"></p>	 -->

					<div id="write_btn">
						<input id="write" type="button" value="글등록">
					</div>

				</form>
			</div>
		</div>
	</div>

</c:if>




<!-- ///////////////////////////////////////////////////////// -->
<!-- ---------------------- qna write ---------------------- -->
<!-- ///////////////////////////////////////////////////////// -->

<c:if test="${board eq 'qna'}">

<div id="board">
		<div id="board_title">
			<c:choose>
			<c:when test="${menu eq 'complaint'}">
				<p id="wtitle">건의 글등록</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
			</c:when>
			<c:when test="${menu eq 'praise'}">
				<p id="wtitle">칭찬 글등록</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 칭찬하고싶은 사항을 등록해주세요.</p>
			</c:when>
			<c:otherwise>
				<p id="wtitle">질문남기기</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 궁금한 사항을 등록해 주세요.</p>
			</c:otherwise>
		</c:choose>
		</div>

		<div id="board_box">
			<div id="form_box">
			<form id="frm" action="./qnaWrite" method="post">
			<c:choose>
				<c:when test="${menu eq 'complaint'}">
				<input type="hidden" name="menu" value="complaint">
				</c:when>
				<c:when test="${menu eq 'praise'}">
				<input type="hidden" name="menu" value="praise">
				</c:when>
				<c:otherwise>
				<input type="hidden" name="menu" value="qna">
				</c:otherwise>
			</c:choose>
					<div class="float">
						<span class="title">제목</span> 
						<input class="form-control" type="text" id="q_title" name="title">
					</div>
					<div class="float">
						<span class="writer">작성자</span> <input class="form-control"
							type="text" id="q_writer" name="writer" value="${memberVO.id}" readonly>
					</div>
					<div class="float">
						<span class="category">구분</span> 
						<select name="category" id="select" class="form-control">
							<option value="site">사이트이용</option>
							<option value="web">병원이용</option>
							<option value="etc">기타</option>
						</select>
					</div>
					<div class="form-group" id="contents_box">
						<span class="contents">글내용</span>
						<textarea class="form-control" rows="5" cols="15" id="contents"
							name="contents"></textarea>
					</div>

					<div id="write_btn">
						<input id="q_write" type="button" value="글등록">
					</div>

				</form>
			</div>
		</div>
	</div>

</c:if>

	<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />

</body>
</html>