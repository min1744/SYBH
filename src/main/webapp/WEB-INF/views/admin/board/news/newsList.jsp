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
  <!-- 파비콘  -->
<link rel="shortcut icon" href="../resources/images/favicon1.ico"/>
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
          <h1 class="h3 mb-2 text-gray-800">
          <c:choose>
						<c:when test="${menu eq 'disease'}">
							<p id="wtitle">질환 정보 관리</p>
						</c:when>
						<c:when test="${menu eq 'nutrition'}">
							<p id="wtitle">영양 정보 관리</p>
						</c:when>
						<c:otherwise>
							<p id="wtitle">운동 정보 관리</p>
						</c:otherwise>

					</c:choose>
          
          </h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
              	<div id="controller_div">
         			<input type="button" value="삭제" id="delete_btn" class="btn btn-danger">
					<a href="./${menu}Write" id="write_btn" class="btn btn-primary">글 쓰기</a>
         		</div>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAll"></th>
                      <th>번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
							<c:when test="${menu eq 'disease'}">
								<c:forEach items="${list}" var="vo">
									<tr class="position_2">
										<td><input type="checkbox" class="check" name="num" value="${vo.num}"></td>
										<td class="num">${vo.num}</td>
										<td>
										<a href="./${menu}Select?num=${vo.num}">${vo.title}</a>
										</td>
										<td class="date">${vo.writer}</td>
										<td class="date">${vo.reg_date }</td>
										<td class="hit">${vo.hit}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:when test="${menu eq 'nutrition'}">
								<c:forEach items="${list}" var="vo">
									<tr class="position_2">
										<td><input type="checkbox" class="check" name="num" value="${vo.num}"></td>
										<td class="num">${vo.num}</td>
										<td>
										<a href="./${menu}Select?num=${vo.num}">${vo.title}</a>
										</td>
										<td class="date">${vo.writer}</td>
										<td class="date">${vo.reg_date }</td>
										<td class="hit">${vo.hit}</td>
									</tr>
								</c:forEach>
							</c:when>
							
							<c:when test="${menu eq 'exercise'}">
								<c:forEach items="${list}" var="vo">
									<tr class="position_2">
										<td><input type="checkbox" class="check" name="num" value="${vo.num}"></td>
										<td class="num">${vo.num}</td>
										<td>
										<a href="./${menu}Select?num=${vo.num}">${vo.title}</a>
										</td>
										<td class="date">${vo.writer}</td>
										<td class="date">${vo.reg_date }</td>
										<td class="hit">${vo.hit}</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
                  </tbody>
                </table>
                <div id="paging">
									<ul class="pagination justify-content-center" >
										<c:if test="${pager.curBlock>1}">
											<li class="page-item"><a
												href="./${menu}?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
												id="prev" class="page-link">◀</a></li>
										</c:if>
										<c:choose>
											<c:when test="${pager.totalCount == 0 }">
												<li class="page-item"><a
													href="./${menu}?curPage=1&kind=${pager.kind}&search=${pager.search}" class="page-link">1</a></li>
											</c:when>
											<c:otherwise>
												<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
													var="i">
													<li class="page-item"><a
														href="./${menu}?curPage=${i}&kind=${pager.kind}&search=${pager.search}" class="page-link">${i}</a></li>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<c:if test="${pager.curBlock<pager.totalBlock}">
											<li class="page-item"><a
												href="./${menu}?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
												id="next" class="page-link">▶</a></li>
										</c:if>
									</ul>
								</div>
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
					url : "./newsListDelete",
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