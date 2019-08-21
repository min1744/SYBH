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
					<!-- ///////////////////////////////////////////////////////// -->
<!-- ---------------------- 공지사항 write ---------------------- -->
<!-- ///////////////////////////////////////////////////////// -->
<c:if test="${board eq 'notice'}">

<input type="hidden" id="board" value="${board}">
<input type="hidden" id="fixCount" value="${result}">
<input type="hidden" id="dbFix" value="${vo.fix}">
	<div id="board">
		<div id="board_title">
			<p id="wtitle">공지수정</p>
		</div>

		<div id="board_box">
			<div id="form_box">
				<form id="frm" action="./${board}Update" method="post">
				<input type="hidden" name="num" value="${vo.num}">
					<div class="float">
						<span class="title">제목</span> <input class="form-control"
							type="text" id="title" name="title" value="${vo.title }">
					</div>
					<div class="float">
						<span class="writer">작성자</span> <input class="form-control"
							type="text" id="writer" name="writer" value="${memberVO.name }" readonly>
					</div>
					<div class="form-group" id="contents_box">
						<span class="contents">글내용</span>
						<textarea class="form-control" rows="5" cols="15" id="contents"
							name="contents">${vo.contents }</textarea>
					</div>
					<c:if test="${board eq 'notice'}">
					<div class="form-group" id="fix_box">
						<img src="../resources/images/info.png" id="fix_info_1">
						 <label	for="fix" class="contents">공지사항 고정</label> 
						 <input type="checkbox"	id="fix" name="fix" value="1"> 
						 <img alt="상단고정은 최대 3개까지가능합니다" src="../resources/images/fix_info.png"	id="fix_info">
					</div>
					</c:if>
					

					<div id="write_btn">
						<input id="write" type="button" value="글수정">
					</div>

				</form>
			</div>
		</div>
	</div>

</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>