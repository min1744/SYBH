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
<!-- 파비콘  -->
<link rel="shortcut icon" href="../resources/images/favicon1.ico"/>
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
					<c:choose>
						<c:when test="${board eq 'notice'}">
							<!------------ notice ------------>
							<input type="hidden" id="fixCount" value="${result}">
							<p id="wtitle">공지등록</p>
						</c:when>
						<c:when test="${board eq 'qna'}">
							<!------------ qna ------------>
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
						</c:when>
						<c:otherwise>
							<p id="wtitle">커뮤니티 글 등록</p>
							<p id="sub_title">커뮤니티게시판에서 자유롭게 등록해 주세요.</p>
						</c:otherwise>
					</c:choose>
				</div>

				<div id="board_box">
					<div id="form_box">
						<form id="frm" action="./${board}Write" method="post">
							<c:choose>
								<c:when test="${board eq 'qna'}">
									<!------------ qna ------------>
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
										<span class="title">제목</span> <input class="form-control"
											type="text" id="q_title" value="${vo.title}" name="title">
									</div>
									<div class="float">
										<span class="writer">작성자</span> <input class="form-control"
											type="text" id="q_writer" name="writer"
											value="${memberVO.name}" readonly>
									</div>
									<div class="float">
										<span class="category">구분</span> <select name="category"
											id="select" class="form-control">
											<option value="site">사이트이용</option>
											<option value="web">병원이용</option>
											<option value="etc">기타</option>
										</select>
									</div>
									<div class="form-group" id="contents_box">
										<span class="contents">글내용</span>
										<textarea class="form-control" rows="5" cols="15"
											id="contents" name="contents">${vo.contents}</textarea>
									</div>
								</c:when>
								<c:otherwise>
									<!------------ notice & commu ------------>
									<div class="float">
										<span class="title">제목</span> <input class="form-control"
											type="text" id="title" name="title">
									</div>
									<c:choose>
										<c:when test="${board eq 'notice'}">
											<div class="float">
												<span class="writer">작성자</span> <input class="form-control"
													type="text" id="writer" name="writer" value="${memberVO.name }" readonly>
											</div>
										</c:when>
										<c:when test="${board eq 'community'}">
											<div class="float">
												<span class="writer">작성자</span> <input class="form-control"
													type="text" id="writer" name="writer"
													value="${memberVO.name}" readonly>
											</div>
										</c:when>
									</c:choose>
									<div class="form-group" id="contents_box">
										<span class="contents">글내용</span>
										<textarea class="form-control" rows="5" cols="15"
											id="contents" name="contents"></textarea>
									</div>
									<c:if test="${board eq 'notice'}">
										<div class="form-group" id="fix_box">
											<img src="../resources/images/info.png" id="fix_info_1">
											<label for="fix" class="contents">공지사항 고정</label> <input
												type="checkbox" id="fix" name="fix" value="1"> <img
												alt="상단고정은 최대 3개까지가능합니다"
												src="../resources/images/fix_info.png" id="fix_info">
										</div>
									</c:if>
								</c:otherwise>
							</c:choose>
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