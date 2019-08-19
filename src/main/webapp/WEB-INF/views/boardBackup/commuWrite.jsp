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
			// 다른 input들 검증
			if ($('#contents').summernote('isEmpty')) {
				alert('모두 입력해주세요.');
			} else {
				if ($('#fix').prop("checked")) {
					var fixCount = $('#fixCount').val();
					if (fixCount > 2) {
						alert('상단고정은 최대 3개까지가능합니다');
					} else {
						$('#frm').submit();
					}
				} else {
					$('#frm').submit();
				}
			}
		});

		$("#q_write").click(function() {
			// 다른 input들 검증
			if ($('#contents').summernote('isEmpty')) {
				alert('모두 입력해주세요.');
			} else {
				$('#frm').submit();
			}
		});

		$('#fix_info').hide();

		$('#fix_info_1').hover(function() {
			$('#fix_info').show();
		});

		$('#fix_info_1').mouseleave(function() {
			$('#fix_info').hide();
		});

	});
</script>
</head>
<body>
	<!-- header 추가 -->
	<c:import url="../common/header.jsp" />

	<!-- ///////////////////////////////////////////////////////// -->
	<!-- ---------------------- community write ---------------------- -->
	<!-- ///////////////////////////////////////////////////////// -->


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
					<div id="write_btn">
						<input id="write" type="button" value="글등록">
					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- footer 추가 -->
	<c:import url="../common/footer.jsp" />
</body>
</html>