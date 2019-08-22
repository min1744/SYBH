<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용백병원::관리자페이지::</title>
<c:import url="../../../temp/boot.jsp" />
<c:import url="../../../temp/summernote.jsp" />
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
<script type="text/javascript">
$(function() {
	var f = document.boardform;
	$("#write").click(function() {
	//다른 input들 검증
	var str = f.title.value;
	if(!str){
		alert('제목을 입력하세요');
		f.title.focus();
		return false;
	}
	str = f.sub_contents.value;
	if(!str){
		alert('Sub내용을 입력하세요');
		f.sub_contents.focus();
		return false;
	}
	if($('#contents').summernote('isEmpty')) {
		alert('Main내용을 입력해주세요.');
		return false;
	}
	str = f.add.value;
	if(!str){
		alert('썸네일 이미지를 넣어주세요');
		return false;
	}
	$("#frm").submit();
	});
	
});
</script>
<script type="text/javascript" src="../resources/js/summernote.js"></script>
</head>
<body id="page-top">
	<div id="wrapper">

		<!-- Sidebar -->
		<c:import url="../../../common/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<c:import url="../../../common/topbar.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<c:choose>
						<c:when test="${menu eq 'disease'}">
							<p id="wtitle">질환 글 등록</p>
						</c:when>
						<c:when test="${menu eq 'nutrition'}">
							<p id="wtitle">영양 글 등록</p>
						</c:when>
						<c:otherwise>
							<p id="wtitle">운동 글 등록</p>
						</c:otherwise>

					</c:choose>
					<!-- ///////////////////////////////////////////////////////// -->
					<!-- ---------------------- 공지사항 write ---------------------- -->
					<!-- ///////////////////////////////////////////////////////// -->

					
					<div id="board">
						<div id="board_box">
							<div id="form_box">
								<form id="frm" action="./newsWrite" name="boardform" method="post" enctype="multipart/form-data">
									<input type="hidden" name="menu" value="${menu}">
									<div class="float">
										<span class="title">제목</span>
										 <input class="form-control empty" type="text" id="title" name="title">
									</div>
									<div class="float">
										<span class="writer">작성자</span>
										 <input class="form-control empty" type="text" id="writer" name="writer" value="${memberVO.name }" readonly>
									</div>
									<div class="form-group" id="contents_box">
										<span class="contents">sub내용</span>
										<textarea class="form-control empty" rows="5" cols="15"
											id="sub_contents" name="sub_contents"></textarea>
									</div>
									<div class="form-group" id="contents_box">
										<span class="contents">main내용</span>
										<textarea class="form-control empty" rows="5" cols="15"
											id="contents" name="main_contents"></textarea>
									</div>
									<div class="form-group" id="box">
										<input type="file" id="add" value="ADD FILE"
											name="multipartFile" class="">
										<div id="files"></div>
									</div>

									<div id="write_btn">
										<input id="write" type="button" value="글등록">
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