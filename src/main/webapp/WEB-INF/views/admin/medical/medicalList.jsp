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
	<!-- 파비콘  -->
<link rel="shortcut icon" href="../resources/images/favicon1.ico"/>
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
					<h1 class="h3 mb-2 text-gray-800">의료진 정보</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<div id="controller_div">
									<input type="button" value="삭제" id="delete_btn"
										class="btn btn-danger"> 
										<a href="./medicalWrite"
										id="write_btn" class="btn btn-primary">추가</a>
								</div>
								<table class="table table-bordered" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th><input type="checkbox" id="checkAll"></th>
											<th>번호</th>
											<th>사진</th>
											<th>이름</th>
											<th>진료과</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${list}" var="list">
										<tr class="position_2">
											<td style="width: 20px;"><input type="checkbox" class="check" name="num" value="${list.num}"></td>
											<td class="num">${list.num }</td>
											<td><img alt="" src="../resources/file/${list.doctorImagesVO.oname}" style="width:100px"></td>
											<td><a href="./medicalSelect?num=${list.num }" class="depth_a">${list.name } 교수</a></td>
											
											<th>${list.med_office }</th>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="paging">
									<ul class="pagination justify-content-center" >
										<c:if test="${pager.curBlock>1}">
											<li class="page-item"><a
												href="./medicalList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
												id="prev" class="page-link">◀</a></li>
										</c:if>
										<c:choose>
											<c:when test="${pager.totalCount == 0 }">
												<li class="page-item"><a
													href="./medicalList?curPage=1&kind=${pager.kind}&search=${pager.search}" class="page-link">1</a></li>
											</c:when>
											<c:otherwise>
												<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
													var="i">
													<li class="page-item"><a
														href="./medicalList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" class="page-link">${i}</a></li>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<c:if test="${pager.curBlock<pager.totalBlock}">
											<li class="page-item"><a
												href="./medicalList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
												id="next" class="page-link">▶</a></li>
										</c:if>
									</ul>
								</div>
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
	  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
<script type="text/javascript">
    var checkMoreZero = false;
  	$("#checkAll").click(function() {
		var checkAll = $(this).prop("checked");
		$(".check").prop("checked", checkAll);
		checkMoreZero = checkAll;
	});
	
	//All check control & Check More Zero
	$(".check").click(function() {
		var check = true;
		checkMoreZero = false;
		$(".check").each(function() {
			if (!$(this).prop("checked")) {
				check = false;
			} else {
				checkMoreZero = true;
			}
		});
		$("#checkAll").prop("checked", check);
	});  
  
  	$('#delete_btn').click(function() {
		if(checkMoreZero){
			var result = confirm("삭제 하시겠습니까?");
			if(result){
				var nums = [];
				$(".check").each(function() {
					if($(this).prop("checked")){
						nums.push($(this).val());
					}
				});
				//ajax로 배열을 전송하고자 할때 추가
				jQuery.ajaxSettings.traditional = true;
				
				$.ajax({
					url : "./medicalListDelete",
					type : "POST",
					data : {
						num : nums
					},
					success : function(data) {
						location.reload();
					},
					error:function(){
						alert('Delete Fail');
					}
				});
			}
		} else {
			alert("선택된 것이 없습니다.");
		}
	});
  </script>
</body>
</html>