<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용백병원::관리자페이지::</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- Custom fonts for this template -->
  <link href="../resources/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="../resources/css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <script src="../resources/js/admin/memberManagement.js"></script>
  <style type="text/css">
  	#controller_div{
  		height: 50px;
  	}
  </style>
</head>
<body id="page-top">
<c:choose>
	<c:when test="${variety eq 'normal'}">
		<input type="hidden" id="delete_ajax_url" value="memberDeletes">
	</c:when>
	<c:when test="${variety eq 'unserviceability'}">
		<input type="hidden" id="delete_ajax_url" value="memberDeleteUnserviceability">
	</c:when>
	<c:otherwise></c:otherwise>
</c:choose>
<input type="hidden" id="variety" value="${variety}">
 <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <c:import url="../common/sidebar.jsp" />
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <c:import url="../common/topbar.jsp" />
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">
          	<c:choose>
          		<c:when test="${variety eq 'normal'}">
          			일반회원관리
          		</c:when>
          		<c:when test="${variety eq 'unserviceability'}">
          			차단 회원 관리
          		</c:when>
          		<c:otherwise>
          			회원 접근 정보 리스트
          		</c:otherwise>
          	</c:choose>
          </h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
  				<div id="controller_div">
  					<c:if test="${variety eq 'normal'}">
	    				<input type="button" value="GRADE UP" id="up_btn" class="btn btn-info">
	     				<input type="button" value="GRADE DOWN" id="down_btn" class="btn btn-info">
	         			<input type="button" value="UNSERVICEABILITY" id="unserviceability_btn" class="btn btn-danger">
  					</c:if>
  					<c:if test="${variety ne 'accessinfo'}">
	         			<input type="button" value="DELETE" id="delete_btn" class="btn btn-danger">
	         		</c:if>
         		</div>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                    	<c:choose>
                    		<c:when test="${variety eq 'normal'}">
                    			<th><input type="checkbox" id="checkAll"></th>
		                    	<th>아이디</th>
		                    	<th>이름</th>
	    	                	<th>주민등록번호</th>
	        	            	<th>핸드폰 번호</th>
	            	        	<th>이메일</th>
	                	    	<th>성별</th>
	                    		<th>나이</th>
	                    		<th>회원등급</th>
	                    		<th>이메일 인증 여부</th>
	                    		<th>아이디 개설일</th>
                    		</c:when>
                    		<c:when test="${variety eq 'unserviceability'}">
                    			<th><input type="checkbox" id="checkAll"></th>
	                      		<th>아이디</th>
    	                 	 	<th>이름</th>
        	             	 	<th>이메일</th>
            	        	  	<th>주민등록번호</th>
                		      	<th>사유</th>
                    		</c:when>
                    		<c:otherwise>
                    			<th>번호</th>
         		             	<th>아이디</th>
         		             	<th>이름</th>
         		             	<th>핸드폰 번호</th>
         		             	<th>이메일</th>
                      			<th>접속 지역</th>
                      			<th>접속 날짜</th>
                    		</c:otherwise>
                    	</c:choose>
	                    	
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="vo">
                    <tr>
                 		<c:choose>
                 			<c:when test="${variety eq 'normal'}">
                 			  <td><input type="checkbox" class="check" value="${vo.id}" title="${vo.grade}" ></td>
		                      <td>${vo.id}</td>
		                      <td>${vo.name}</td>
		                      <td>${vo.res_reg_num}</td>
		                      <td>${vo.phone}</td>
		                      <td>${vo.email}</td>
		                      <c:choose>
		                      	<c:when test="${vo.gender eq 1}">
		                      		<td>남자</td>
		                      	</c:when>
		                      	<c:otherwise>
		                      		<td>여자</td>
		                      	</c:otherwise>
		                      </c:choose>
		                      <td>${vo.age}</td>
		                      <c:choose>
		                      	<c:when test="${vo.grade eq 1}">
		                      		<td>일반 회원</td>
		                      	</c:when>
		                      	<c:otherwise>
		                      		<td>관리자</td>
		                      	</c:otherwise>
		                      </c:choose>
		                      <c:choose>
		                      	<c:when test="${vo.authStatus eq 1}">
		                      		<td>X</td>
		                      	</c:when>
		                      	<c:otherwise>
		                      		<td>O</td>
		                      	</c:otherwise>
		                      </c:choose>
		                      <td>${vo.reg_date}</td>
                 			</c:when>
                 			<c:when test="${variety eq 'unserviceability'}">
                 				<td><input type="checkbox" class="check" name="id" value="${vo.id}"></td>
	                      		<td>${vo.id}</td>
	                      		<td>${vo.name}</td>
	                      		<td>${vo.email}</td>
			                    <td>${vo.res_reg_num}</td>
			                    <td>${vo.reason}</td>
                 			</c:when>
                 			<c:otherwise>
                 				<td>${vo.num}</td>
	                      		<td>${vo.id}</td>
	                      		<td>${vo.name}</td>
	                      		<td>${vo.phone}</td>
	                      		<td>${vo.email}</td>
	                      		<td>(${vo.country}) ${vo.location}</td>
	                      		<td>${vo.reg_date}</td>
                 			</c:otherwise>
                 		</c:choose>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
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