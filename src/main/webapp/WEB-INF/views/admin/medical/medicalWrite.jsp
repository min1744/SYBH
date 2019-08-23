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
		var f = document.boardform;
		$("#write").click(function() {
		//다른 input들 검증
		var str = f.title.value;
		if(!str){
			alert('제목을 입력하세요');
			f.title.focus();
			return false;
		}
		str = f.pro_field.value;
		if(!str){
			alert('전문분야를 입력하세요');
			f.pro_field.focus();
			return false;
		}
		str = f.career.value;
		if(!str){
			alert('경력을 입력하세요');
			f.career.focus();
			return false;
		}
		str = f.major_act.value;
		if(!str){
			alert('주요활동을 입력하세요');
			f.major_act.focus();
			return false;
		}
		str = f.add.value;
		if(!str){
			alert('이미지를 넣으세요');
			return false;
		}
		$("#frm").submit();
		});
		
	});
	</script>
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
					<h1 class="h3 mb-2 text-gray-800">의료진 관리</h1>
					<div id="board_box">
						<div id="form_box">
							<form id="frm" action="./medicalWrite" name = "boardform" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<span class="title">이름</span> 
									<input class="form-control empty"	type="text" id="title" name="name">
								</div>
								<div class="form-group">
									<span class="writer">진료과</span> 
									 <select class="form-control" id="med_office" name="med_office">
									    <option value="1" >이비인후과</option>
									    <option value="2">외과</option>
									    <option value="3">비뇨의학과</option>
									    <option value="4">호흡기내과</option>
									    <option value="5">신경과</option>
									 </select>
								</div>
								<div class="form-group">
									<span class="writer">전문분야</span> 
									<input class="form-control empty"	type="text" id="pro_field" name="pro_field">
								</div>
								
								<div class="form-group" id="contents_box">
									<span class="contents">경력</span>
									<textarea class="form-control empty" rows="5" cols="15" id="career"
										name="career"></textarea>
								</div>
								
								<div class="form-group" id="contents_box">
									<span class="contents">주요활동</span>
									<textarea class="form-control empty" rows="5" cols="15" id="major_act"
										name="major_act"></textarea>
								</div>
								<div class="form-group" id="box">
								<input type="file" name="multipartFile" class="form-control f1" id="add">
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

</body>
</html>