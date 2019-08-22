<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<script type="text/javascript">
	$(function(){
		$('#delete_btn').click(function(){
			var result = confirm('정말로 삭제하시겠습니까?');
			if(result){
			var num = '${param.num}';
			$.ajax({
				url:'./medicalDelete',
				type: 'POST',
				data:{
					num:num
				},
			success:function(data){
				if(data==1){
					location.href='./medicalList';
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
					<h1 class="h3 mb-2 text-gray-800">의료진 정보</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<div id="controller_div">
									<input type="button" value="삭제" id="delete_btn"	class="btn btn-danger">
									<a href="./medicalUpdate?num=${vo.num }" id="write_btn" class="btn btn-primary">수정</a>
								</div>
								<table class="table table-bordered" width="100%" cellspacing="0">
									<tr>
										<td rowspan="6"><img alt="" src="../resources/file/${vo.doctorImagesVO.oname}"></td>
									</tr>
									<tr>
										<td>성함</td>
										<td>${vo.name}</td>
									</tr>
									<tr>
										<td>진료과</td>
										<td>${vo.med_office}</td>
									</tr>
									<tr>
										<td>전문분야</td>
										<td>${vo.pro_field}</td>
									</tr>
									<tr>
										<td>경력</td>
										<td>
										<c:forTokens items="${vo.career }" delims="," var="item">
										<li>${item }</li>
										</c:forTokens>
										</td>
									</tr>
									<tr>
										<td>주요활동</td>
										<td>
										<c:forTokens items="${vo.major_act }" delims="," var="item">
										<li>${item }</li>
										</c:forTokens>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<a href="./medicalList" class="btn btn-info">목록</a>
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
</body>
</html>