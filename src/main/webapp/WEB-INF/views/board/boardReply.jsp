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
<script type="text/javascript">
	$(function() {
		
		$("#write").click(function() {
			//다른 input들 검증
			if($('#contents').summernote('isEmpty')) {
				alert('모두 입력해주세요.');
			} else {
				$('#frm').submit();				
			}
		});
		
	});
</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<c:choose>
			<c:when test="${menu eq 'complaint'}">
				<p id="wtitle">건의 답글</p>
			</c:when>
			<c:when test="${menu eq 'praise'}">
				<p id="wtitle">칭찬 답글</p>
			</c:when>
			<c:otherwise>
				<p id="wtitle">질문 답글</p>
			</c:otherwise>
		</c:choose>
		</div>

		<div id="board_box">

			<div id="form_box">
				<form id="frm" action="./qnaReply" method="post">
				
				<c:choose>
					<c:when test="${menu eq 'complaint'}">
					<input type="hidden" name="num" value="${vo.num}">
					<input type="hidden" name="menu" value="${vo.menu}">
					<input type="hidden" name="category" value="${vo.category}">
					<div class="float">
						<span class="title">제목</span> <input class="form-control"
							type="text" id="title" value="안녕하세요. 건의내용 답변 입니다^^" name="title">
					</div>
					<div class="float">
						<span class="writer">작성자</span> <input class="form-control"
							type="text" id="writer" name="writer" value="admin" readonly>
					</div>
					<div class="form-group" id="contents_box">
						<span class="contents">답변글</span>
						<textarea class="form-control" rows="5" cols="15" id="contents"
							name="contents">
							--------------------------- 원글 내용 -------------------------- <br>
							제목 : ${vo.title} <br>
							작성자 : ${vo.writer} <br>
							내용 : ${vo.contents} <br>
							--------------------------- 답변 내용 -------------------------- <br>
							</textarea>
					</div>

					<div id="write_btn">
						<input id="write" type="button" value="답글등록">
					</div>
					</c:when>
					<c:when test="${menu eq 'praise'}">
					<input type="hidden" name="num" value="${vo.num}">
					<input type="hidden" name="menu" value="${vo.menu}">
					<input type="hidden" name="category" value="${vo.category}">
					<div class="float">
						<span class="title">제목</span> <input class="form-control"
							type="text" id="title" value="안녕하세요.칭찬합니다 답글 입니다^^" name="title">
					</div>
					<div class="float">
						<span class="writer">작성자</span> <input class="form-control"
							type="text" id="writer" name="writer" value="admin" readonly>
					</div>
					<div class="form-group" id="contents_box">
						<span class="contents">글내용</span>
						<textarea class="form-control" rows="5" cols="15" id="contents"
							name="contents">
							--------------------------- 원글 내용 -------------------------- <br>
							제목 : ${vo.title} <br>
							작성자 : ${vo.writer} <br>
							내용 : ${vo.contents} <br>
							--------------------------- 답변 내용 -------------------------- <br>
							</textarea>
					</div>

					<div id="write_btn">
						<input id="write" type="button" value="답글등록">
					</div>
					</c:when>
					<c:otherwise>
					<input type="hidden" name="num" value="${vo.num}">
					<input type="hidden" name="menu" value="${vo.menu}">
					<input type="hidden" name="category" value="${vo.category}">
					<div class="float">
						<span class="title">제목</span> <input class="form-control"
							type="text" id="title" value="안녕하세요. 질문내용 답변 입니다^^" name="title">
					</div>
					<div class="float">
						<span class="writer">작성자</span> <input class="form-control"
							type="text" id="writer" name="writer" value="admin" readonly>
					</div>
					<div class="form-group" id="contents_box">
						<span class="contents">글내용</span>
						<textarea class="form-control" rows="5" cols="15" id="contents"
							name="contents">
							--------------------------- 원글 내용 -------------------------- <br>
							제목 : ${vo.title} <br>
							작성자 : ${vo.writer} <br>
							내용 : ${vo.contents} <br>
							--------------------------- 답변 내용 -------------------------- <br>
							</textarea>
					</div>

					<div id="write_btn">
						<input id="write" type="button" value="답글등록">
					</div>
					</c:otherwise>
				</c:choose>

				</form>
			</div>
		</div>
	</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>