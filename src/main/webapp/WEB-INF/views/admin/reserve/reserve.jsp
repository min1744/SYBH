<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용백병원::관리자페이지::</title>
<c:import url="../../temp/boot.jsp"/>
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
					<c:choose>
						<c:when test="${board eq 'Normal'}">
						<h1 class="h3 mb-2 text-gray-800">일반진료 예약정보</h1>
						</c:when>
						<c:otherwise>
						<h1 class="h3 mb-2 text-gray-800">건강검진 예약정보</h1>
						</c:otherwise>
					</c:choose>
					

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<div id="controller_div">
								</div>
								<c:choose>
									<c:when test="${board eq 'Normal'}">
										<!-- 일반진료 예약 내역 -->
										<p>
											총 게시물 : <span>${count }</span>
										</p>

										<table class="table table-bordered" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>접수번호</th>
													<th>예약자명</th>
													<th>의료진/진료과목</th>
													<th>신청일자</th>
													<th>진료예약날짜</th>
													<th>예약여부</th>
													<th>전화번호</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list }" var="list" varStatus="i">
													<tr>

														<td id="num${i.index }">${list.tnum }</td>
														<td>${list.name }</td>
														<td>${list.contents }</td>
														<td>${list.apply_date }</td>
														<td class="check">${list.reserve_date }</td>
														<!-- 진료예약날짜가 지나야 진료완료 떠야함 -->
														<td id="check_status" class="check_status"
															data-toggle="${list.status}"><c:choose>
																<c:when test="${list.status eq 0 }">
																	<button class="btn btn-danger cancel" id="cancel${i.index }"
																		data-num="${i.index }">예약취소</button>
																</c:when>
																<c:when test="${list.status eq 1 }">예약취소</c:when>
																<c:when test="${list.status eq 2 }"><span style="color: blue;">진료완료</span></c:when>
															</c:choose>
														</td>
														<td>${list.phone}<td>									
													</tr>
												</c:forEach>
											</tbody>
											<script type="text/javascript">
												//한자리수일 경우 0을 채워준다. 
												$(function() {
													var date = new Date();
													var year = date
															.getFullYear();
													var month = new String(date
															.getMonth() + 1);
													var day = new String(date
															.getDate());

													if (month.length == 1) {
														month = "0" + month;
													}
													if (day.length == 1) {
														day = "0" + day;
													}
													var today = year + "-"
															+ month + "-" + day; //오늘날짜
													$(".check")
															.each(
																	function() {
																		var tnum = $(
																				this)
																				.prev()
																				.prev()
																				.prev()
																				.prev()
																				.text();
																		var check_date = $(
																				this)
																				.text();
																		var check_status = $(
																				this)
																				.next()
																				.attr(
																						'data-toggle');
																		if (today > check_date
																				&& check_status == '0') {
																			$
																					.ajax({
																						url : "../treatBreakDown/treatBreakDownUpdate",
																						type : "POST",
																						data : {
																							tnum : tnum,
																							status : 2
																						},
																						success : function(
																								data) {
																							location
																									.reload();
																						}
																					});//ajax문
																		}//if문	
																	});//each문

													$('.cancel')
															.click(
																	function() {
																		var index = $(
																				this)
																				.attr(
																						'data-num');
																		var tnum = $(
																				'#num'
																						+ index)
																				.text();
																		var check = confirm('예약을 취소하시겠습니까? \n예약을 취소하신 후에는 다시 예약해야합니다.');
																		if (check) {
																			$
																					.ajax({
																						url : "../treatBreakDown/treatBreakDownUpdate",
																						type : "POST",
																						data : {
																							tnum : tnum,
																							status : 1
																						},
																						success : function(
																								data) {
																							location
																									.reload();
																						}
																					});//ajax문
																		} else {
																			alert('예약이 취소되었습니다');
																		}
																	}); //cancel

												});
											</script>
										</table>
										<div id="paging">
											<ul class="pagination justify-content-center">
												<c:if test="${pager.curBlock>1 }">
													<li class="page-item"><a
														href="./adminNormal?curPage=${pager.startNum-1}&kind=${pager.kind}"
														id="prev" class="page-link">◀</a></li>
												</c:if>
												<c:choose>
													<c:when test="${pager.totalCount == 0 }">
														<li class="page-item"><a
															href="./adminNormal?curPage=1&kind=${pager.kind}" class="page-link">1</a></li>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${pager.startNum }"
															end="${pager.lastNum }" var="i">
															<li class="page-item"><a
																href="./adminNormal?curPage=${i}&kind=${pager.kind}" class="page-link">${i}</a></li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												<c:if test="${pager.curBlock<pager.totalBlock }">
													<li class="page-item"><a
														href="./adminNormal?curPage=${pager.lastNum+1 }&kind=${pager.kind}"
														id="next" class="page-link">▶</a></li>
												</c:if>
											</ul>

										</div>
									</c:when>
									<c:when test="${board eq 'Medical'}">
										<!-- 건강검진 예약 내역 -->
										<p>
											총 게시물 : <span>${count}</span>
										</p>

										<table class="table table-bordered" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>접수번호</th>
													<th>예약자명</th>
													<th>검진명</th>
													<th>검진날짜</th>
													<th>예약검진금액</th>
													<th>검진여부</th>
													<th>결제날짜</th>
													<th>전화번호</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="list" varStatus="i">
													<tr>
														<td id="num${i.index }">${list.num }</td>
														<td>${list.name }</td>
														<td>${list.contents }</td>
														<td id="check_date${i.index}" class="check">${list.check_date}</td>
														<td>${list.price }</td>

														<!-- 검진날짜가 지나야 검진완료 떠야함 -->
														<td id="check_status" class="check_status"
															data-toggle="${list.check_status}"><c:choose>
																<c:when test="${list.check_status eq 0 }">
																	<button class="btn btn-danger cancel" data-num="${i.index }">예약취소</button>
																</c:when>
																<c:when test="${list.check_status eq 1 }">예약취소</c:when>
																<c:when test="${list.check_status eq 2 }">검진완료</c:when>
															</c:choose></td>
														<td>${list.pay_date }</td>
														<td>${list.phone }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div id="paging">
											<ul class="pagination justify-content-center" >
												<c:if test="${pager.curBlock>1 }">
													<li class="page-item"><a
														href="./adminCheckUp?curPage=${pager.startNum-1}&kind=${pager.kind}"
														id="prev" class="page-link">◀</a></li>
												</c:if>
												<c:choose>
													<c:when test="${pager.totalCount == 0 }">
														<li class="page-item"><a
															href="./adminCheckUp?curPage=1&kind=${pager.kind}" class="page-link">1</a></li>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${pager.startNum }"
															end="${pager.lastNum }" var="i">
															<li class="page-item"><a
																href="./adminCheckUp?curPage=${i}&kind=${pager.kind}" class="page-link">${i}</a></li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												<c:if test="${pager.curBlock<pager.totalBlock }">
													<li class="page-item"><a
														href="./adminCheckUp?curPage=${pager.lastNum+1 }&kind=${pager.kind}"
														id="next" class="page-link">▶</a></li>
												</c:if>
											</ul>

										</div>
										<script type="text/javascript">
											//한자리수일 경우 0을 채워준다. 
											$(function() {
												var date = new Date();
												var year = date.getFullYear();
												var month = new String(date
														.getMonth() + 1);
												var day = new String(date
														.getDate());

												if (month.length == 1) {
													month = "0" + month;
												}
												if (day.length == 1) {
													day = "0" + day;
												}
												var today = year + "-" + month
														+ "-" + day; //오늘날짜
												$(".check")
														.each(
																function() {
																	var num = $(
																			this)
																			.prev()
																			.prev()
																			.prev()
																			.text();
																	var check_date = $(
																			this)
																			.text();
																	var check_status = $(
																			this)
																			.next()
																			.next()
																			.attr(
																					'data-toggle');
																	if (today > check_date
																			&& check_status == '0') {
																		$
																				.ajax({
																					url : "../checkup/checkUpUpdate",
																					type : "POST",
																					data : {
																						num : num,
																						check_status : 2
																					},
																					success : function(
																							data) {
																						location
																								.reload();
																					}
																				});//ajax문
																	}//if문	
																});//each문
												$('.cancel')
														.click(
																function() {
																	var index = $(
																			this)
																			.attr(
																					'data-num');
																	var num = $(
																			'#num'
																					+ index)
																			.text();
																	var check = confirm('예약을 취소하시겠습니까? \n예약을 취소하신 후에는 다시 예약해야합니다.');
																	if (check) {
																		$
																				.ajax({
																					url : "../checkup/checkUpUpdate",
																					type : "POST",
																					data : {
																						num : num,
																						check_status : 1
																					},
																					success : function(
																							data) {
																						location
																								.reload();
																					}
																				});//ajax문
																	} else {
																		alert('예약이 취소되었습니다');
																	}
																}); //cancel

											});
										</script>
									</c:when>
								</c:choose>

							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; SYBH 2019</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

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