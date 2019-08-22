<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용백병원::관리자페이지::</title>
<c:import url="../../temp/boot.jsp" />
<c:import url="../../temp/summernote.jsp" />
<link href="../resources/css/boardWrite.css" rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Custom fonts for this template -->
<link href="../resources/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="../resources/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<script type="text/javascript">
	$(function() {

		$("#write").click(function() {
			var title = $('#title').val();
			//다른 input들 검증
			if ($('#contents').summernote('isEmpty') || title == '') {
				alert('모두 입력해주세요.');
			} else {
				$('#frm').submit();
			}
		});

	});
</script>
<style type="text/css">
#controller_div {
	height: 50px;
}
</style>
<script type="text/javascript" src="../resources/js/summernote.js"></script>
<script type="text/javascript" src="../resources/js/board/boardWrite.js"></script>
</head>
<body id="page-top">
	<div id="wrapper">

		<!-- Sidebar -->
		<c:import url="../../common/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<c:import url="../../common/topbar.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">${board}게시판관리</h1>
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
							<input type="hidden" name="num" value="${vo.num}"> <input
								type="hidden" name="menu" value="${vo.menu}"> <input
								type="hidden" name="category" value="${vo.category}">
							<div class="float">
								<span class="title">제목</span> <input class="form-control"
									type="text" id="title" value="안녕하세요. 답변 입니다^^" name="title">
							</div>
							<div class="float">
								<span class="writer">작성자</span> <input class="form-control"
									type="text" id="writer" name="writer" value="${memberVO.name }" readonly>
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
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	</div>
	</div>
</body>
</html>