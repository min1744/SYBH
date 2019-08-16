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
  <style type="text/css">
  	#controller_div{
  		height: 50px;
  	}
  </style>
</head>
<body id="page-top">

 <!-- Page Wrapper -->
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
          <h1 class="h3 mb-2 text-gray-800">${board} 게시판 관리</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
              	<div id="controller_div">
         			<input type="button" value="DELETE" id="delete_btn" class="btn btn-danger">
					<a href="./${board}Write" id="write_btn" class="btn btn-primary">WRITE</a>
         		</div>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAll"></th>
                      <th>번호</th>
                      <th>제목</th>
                      <c:if test="${board ne 'notice'}">
                      	<th>작성자</th>
                      </c:if>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
							<c:when test="${board eq qna}">
								<c:forEach items="${list}" var="vo">
									<tr class="position_2">
										<td><input type="checkbox" class="check" name="num" value="${vo.num}"></td>
										<td class="num">${vo.num}</td>
										<td title="${vo.depth}"><c:forEach begin="1"
												end="${vo.depth}">
												<img width="20px" src="../resources/images/reply.png"
													style="transform: rotate(-180deg);">
											</c:forEach> <c:choose>
												<c:when test="${vo.depth eq '1'}">
													<a href="./${menu}Select?num=${vo.num}"
														class="depth_a">${vo.title}</a>
												</c:when>
												<c:otherwise>
													<a href="./${menu}Select?num=${vo.num}">${vo.title}</a>
												</c:otherwise>
											</c:choose></td>
										<td class="date">${vo.writer}</td>
										<td class="date">${vo.reg_date }</td>
										<td class="hit">${vo.hit}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:if test="${board eq 'notice'}">
									<c:forEach items="${fixedList}" var="vo">
										<tr class="position">
											<td><input type="checkbox" class="check" name="num" value="${vo.num}"></td>
											<td class="num"><img
												src="../resources/images/notice_icon.png"></td>
											<td class="title"><a
												href="./${board}Select?num=${vo.num}">${vo.title}</a></td>
											<td class="date">${vo.reg_date}</td>
											<td class="hit">${vo.hit}</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:forEach items="${list}" var="vo">
									<tr class="position_2">
										<td><input type="checkbox" class="check" name="num" value="${vo.num}"></td>
										<td class="num">${vo.num}</td>
										<td><a href="./${board}Select?num=${vo.num}">${vo.title}</a></td>
										<td class="date">${vo.reg_date}</td>
										<td class="hit">${vo.hit}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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
            <span>Copyright &copy; SYBH 2019</span>
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
					url : "./noticeListDelete",
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