<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용백병원::관리자페이지::</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="../resources/css/boardSelect.css" rel="stylesheet">
<c:import url="../../temp/commentBootstrap.jsp" />
<script type="text/javascript"
	src="../resources/js/board/boardSelect.js"></script>
<c:import url="../../temp/boot.jsp" />
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
		$('#delete_btn').click(function() {

			var result = confirm('정말로 삭제하시겠습니까?');
			var board='${board}';
			if (result) {
				var num = '${param.num}';
				$.ajax({
					url : './'+board+'Delete',
					type : 'POST',
					data : {
						num : num
					},
					success : function(data) {
						if(data=='1'){
						location.href = './noticeList';
						}
					}
				})
			} else{
				alert('취소되었습니다');
			}
		});
		$('#remote_delete').click(function() {

			var result = confirm('정말로 삭제하시겠습니까?');
			var menu='${menu}';
			var ref = $('#qref').val();
			var menu = $('#qmenu').val();
			if (result) {
				var num = '${param.num}';
				$.ajax({
					url : './qnaAdminDelete',
					type : 'POST',
					data : {
						ref : ref,
						menu : menu
					},
					success : function(data) {
						location.href = './'+menu;
					}
				})
			} else{
				alert('취소되었습니다');
			}
		});
		$('#reply_delete').click(function() {

			var result = confirm('정말로 삭제하시겠습니까?');
			var menu='${menu}';
			var num = '${param.num}';
			var menu = $('#qmenu').val();
			if (result) {
				var num = '${param.num}';
				$.ajax({
					url : './replyAdminDelete',
					type : 'POST',
					data : {
						num : num,
						menu : menu
					},
					success : function(data) {
						location.href = './'+menu;
					}
				})
			} else{
				alert('취소되었습니다');
			}
		});
		$('#community_delete').click(function() {

			var result = confirm('정말로 삭제하시겠습니까?');
			var board= '${board}';
			var num = '${param.num}';
			var menu = $('#qmenu').val();
			if (result) {
				var num = '${param.num}';
				$.ajax({
					url : './adminCommunityDelete',
					type : 'POST',
					data : {
						num : num,
						menu : menu
					},
					success : function(data) {
						if(data=='1'){
						location.href = './'+board;
						}
					}
				})
			} else{
				alert('취소되었습니다');
			}
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
					<h1 class="h3 mb-2 text-gray-800">${board}게시판관리</h1>

					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<div id="controller_div">
									<c:choose>
										<c:when test="${board eq 'notice'}">
											<input type="button" value="삭제" id="delete_btn"
												class="btn btn-danger">
											<a href="./${board}Update?num=${vo.num}" id="write_btn"
												class="btn btn-primary">수정</a>
											<a href="./${board}List" class="btn btn-primary">목록</a>
										</c:when>
										<c:when test="${board eq 'qna'}">
											<c:choose>
												<c:when test="${vo.depth eq '1'}">
													<input type="button" value="답글삭제" id="reply_delete"
														class="btn btn-danger">
													<a href="./${menu}" class="btn btn-primary">목록</a>
													<a href="./${menu}Update?num=${vo.num}" id="update"
														class="btn btn-primary">수정</a>
													<a href="./${menu}Reply?num=${vo.num}" id="reply"
														class="btn btn-info">답글달기</a>
												</c:when>
												<c:when test="${vo.depth eq '0'}">
													<input type="button" value="삭제" id="remote_delete"
														class="btn btn-danger">
													<a href="./${menu}" class="btn btn-primary">목록</a>
													<a href="./${menu}Update?num=${vo.num}" id="update"
														class="btn btn-primary">수정</a>
													<a href="./${menu}Reply?num=${vo.num}" id="reply"
														class="btn btn-info">답글달기</a>
												</c:when>

											</c:choose>
										</c:when>
										<c:otherwise>
											<input type="button" value="삭제" id="community_delete"
												class="btn btn-danger">
												<a href="./${board}" class="btn btn-primary">목록</a>
										</c:otherwise>
									</c:choose>
								</div>
								<c:choose>
									<c:when test="${board eq 'notice'}">
										<!------------ notice ------------>
										<input type="hidden" id="board" value="${board}">
										<input type="hidden" id="num" value="${vo.num}">
										<p id="wtitle">공지사항</p>
									</c:when>
									<c:when test="${board eq 'qna'}">
										<!------------ qna ------------>
										<c:choose>
											<c:when test="${menu eq 'complaint'}">
												<p id="wtitle">건의합니다</p>
											</c:when>
											<c:when test="${menu eq 'praise'}">
												<p id="wtitle">칭찬합니다</p>
											</c:when>
											<c:otherwise>
												<p id="wtitle">질문과 답변</p>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<!-- commnu -->
										<input type="hidden" id="board" value="${board}">
										<input type="hidden" id="num" value="${vo.num}">
										<input type="hidden" id="c_num" value="${vo.num}">
										<p id="wtitle">
										<h1>커뮤니티</h1>
										</p>
									</c:otherwise>
								</c:choose>
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">

									<c:choose>
										<c:when test="${board eq 'notice'}">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${vo.num }</td>
													<td>${vo.title}</td>
													<td>${vo.writer}</td>
													<td>${vo.reg_date}</td>
													<td>${vo.hit}</td>
												</tr>
												<tr>
													<td colspan="5">${vo.contents }</td>
												</tr>
											</tbody>
										</c:when>

										<c:when test="${board eq 'qna'}">
											<!------------ qna ------------>
											<input type="hidden" name="num" value="${vo.num}" id="qnum">
											<input type="hidden" name="menu" value="${vo.menu}"
												id="qmenu">
											<input type="hidden" name="num" value="${vo.ref}" id="qref">
											<thead>
												<tr>
													<th colspan="8">${vo.title }</th>
												</tr>
												<tr>
													<th>작성자</th>
													<td>${vo.writer}</td>
													<th>구분</th>

													<td><c:choose>
															<c:when test="${vo.category eq 'site'}">
																<c:choose>
																	<c:when test="${vo.depth eq '1'}">
																	답변
																	</c:when>
																	<c:otherwise>
																	사이트이용
																</c:otherwise>
																</c:choose>
															</c:when>
															<c:when test="${vo.category eq 'web'}">
																<c:choose>
																	<c:when test="${vo.depth eq '1'}">
																		답변
																	</c:when>
																	<c:otherwise>
																		병원이용
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:when test="${vo.category eq 'etc'}">
																<c:choose>
																	<c:when test="${vo.depth eq '1'}">
																		답변
																	</c:when>
																	<c:otherwise>
																		기타
																	</c:otherwise>
																</c:choose>
															</c:when>
														</c:choose></td>
													<th>등록일</th>
													<td>${vo.reg_date}</td>
													<th>조회수</th>
													<td>${vo.hit}</td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="8">${vo.contents}</td>
												</tr>
											</tbody>
										</c:when>
										<c:when test="${board eq 'community'}">
											<!------------ commu ------------>
											<thead>
												<tr>
													<th>${vo.title}</th>
												</tr>
												<tr>
													<th>작성자</th>
													<td>${vo.writer}</td>
													<th>등록일</th>
													<td>${vo.reg_date}</td>
													<th>조회수</th>
													<td>${vo.hit}</td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${vo.contents}</td>
												</tr>
											</tbody>
											
										</c:when>
									</c:choose>

								</table>
								<c:if test="${board eq 'community' }">
									<!----------------------------- 댓글 시작 -------------------------------->
									
									<div id="comment_box">
										<div id="comment">
											<div id="c_top">
												<input type="hidden" id="like_check"> <input
													type="hidden" id="c_num" value="${vo.num}"> <input
													type="hidden" id="likeId" value="${memberVO.id}"> <span
													id="c_count_title">전체댓글</span><span id="c_count">${totalCount}</span>
											</div>
											<c:choose>
												<c:when test="${not empty memberVO}">
													<div id="c_write_box">
														<p id="c_writer">${memberVO.id}</p>
														<textarea class="c_area"
															placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
														<span id="counter">(0 / 500)</span>
													</div>
													<div id="c_btn">
														<button id="comment_btn">등록</button>
													</div>
												</c:when>
												<c:otherwise>
													<div id="c_write_box2">
														<textarea placeholder="로그인 후 사용하실 수 있습니다"
															disabled="disabled"></textarea>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- 댓글 리스트 -->
										<div class="commentslist"></div>
										<c:if test="${totalCount > 10}">
											<div id="more_box">
												<button id="more">+ 댓글 더보기</button>
											</div>
										</c:if>
										<!-- 댓글 수정 관련 modal -->
										<div class="container">
											<!-- Modal -->
											<div class="modal fade" id="myModal" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<h4 class="modal-title">댓글 수정</h4>
														</div>
														<div class="modal-body">
															<div class="form-group">
																<label for="contents">작성자 :</label> <input
																	class="form-control" type="text" value="${memberVO.id}"
																	disabled="disabled">
															</div>
															<div class="form-group">
																<label for="contents">댓글 :</label>
																<textarea class="form-control" rows="5"
																	id="updateContents" name="contents"></textarea>
																<input type="hidden" id="ccnum">
															</div>
														</div>
														<div class="modal-footer">
															<button id="updateBtn" data-dismiss="modal">댓글
																수정</button>
															<button type="button" id="cancleBtn" data-dismiss="modal">취소</button>
														</div>
													</div>

												</div>
											</div>
										</div>
										<!-- modal 끝 -->

										<!-- 댓글 답글 관련 modal -->
										<div class="container">
											<!-- Modal -->
											<div class="modal fade" id="replyModal" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<h4 class="modal-title">답글 달기</h4>
														</div>
														<div class="modal-body">
															<div class="form-group">
																<label for="reid">작성자 :</label> <input
																	class="form-control" type="text" name="reid" id="reid"
																	value="${memberVO.name}" readonly>
															</div>
															<div class="form-group">
																<label for="contents">댓글 :</label>
																<textarea class="form-control" rows="5"
																	id="replyContents" name="contents"></textarea>
																<input type="hidden" id="cnum2" value="1">
															</div>
														</div>
														<div class="modal-footer">
															<button id="replyBtn" data-dismiss="modal">답글 등록</button>
															<button type="button" id="cancleBtn" data-dismiss="modal">취소</button>
														</div>
													</div>

												</div>
											</div>
										</div>
										<!-- modal 끝 -->

									</div>
									<!----------------------------- 댓글 끝 -------------------------------->
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; SYBH 2019</span>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JavaScript-->
	<script src="../resources/js/admin/jquery.min.js"></script>
	<script src="../resources/js/admin/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="../resources/js/admin/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../resources/js/admin/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="../resources/js/admin/jquery.dataTables.min.js"></script>
	<script src="../resources/js/admin/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="../resources/js/admin/datatables-demo.js"></script>
</body>
</html>