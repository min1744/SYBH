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
	$("#write").click(function() {
	//다른 input들 검증
		$('.empty').each(function(){
			if($(this).val()==''){
				alert('내용을 입력해주세요');
				$(this).focus();
				return false;
			} else{
				$('#frm').submit();
			}
		});
	});
	
	$(".fdel").click(function() {
		var check = confirm("삭제 하시겠습니까? 복구 불가능");
		var id = $(this).attr("id");
		var title = $(this).attr("title");
		var select = $(this);
		if(check){
			$.ajax({
				url:"../ajax/fileDelete",
				type:"POST",
				data:{
					fnum:id,
					fname:title,
				},
				success:function(data){
					data=data.trim();
					if(data=='1'){
						select.parent().remove();
						select.remove();
						var result = '<input type="file" name="multipartFile" class="form-control">';
						$("#files").append(result);
					}else {
						alert("File Delete Fail");
					}
				}
			});
		}
	});
	var img= '${newsVO.newsImagesVO}';
	if(img == ''){
		$('.fdel').hide();
		var result = '<input type="file" name="multipartFile" class="form-control">';
		$("#files").append(result);
	}
	
});
</script>
<script type="text/javascript" src="../resources/js/summernote.js"></script>
<script type="text/javascript" src="../resources/js/board/boardWrite.js"></script>
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
								<form id="frm" action="./newsUpdate" method="post" enctype="multipart/form-data">
									<input type="hidden" name="menu" value="${menu}">
									<input type="hidden" name="num" value="${newsVO.num}">
									<div class="float">
										<span class="title">제목</span>
										 <input class="form-control empty" type="text" id="title" name="title" value="${newsVO.title}">
									</div>
									<div class="float">
										<span class="writer">작성자</span>
										 <input class="form-control empty" type="text" id="writer" name="writer" value="admin" readonly>
									</div>
									<div class="form-group" id="contents_box">
										<span class="contents">sub내용</span>
										<textarea class="form-control empty" rows="5" cols="15"
											id="sub_contents" name="sub_contents">${newsVO.sub_contents}</textarea>
									</div>
									<div class="form-group" id="contents_box">
										<span class="contents">main내용</span>
										<textarea class="form-control empty" rows="5" cols="15"
											id="contents" name="main_contents">${newsVO.main_contents}</textarea>
									</div>
									<div class="form-group" id="box">
										<span class="images">이미지</span>
										<p>${newsVO.newsImagesVO.oname} <span id="${newsVO.newsImagesVO.fnum}" title="${newsVO.newsImagesVO.fname}" class="fdel" style="cursor: pointer;">X</span>
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