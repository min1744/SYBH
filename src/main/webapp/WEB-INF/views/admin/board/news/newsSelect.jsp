<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용백병원::관리자페이지::</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <c:import url="../../../temp/boot.jsp"/>
  <link href="../resources/css/boardSelect.css" rel="stylesheet">
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
  <script type="text/javascript">
	$(function() {
		
		$('#delete_btn').click(function() {

			var result = confirm('정말로 삭제하시겠습니까?');
			if (result) {
				var num = '${param.num}';
				var menu = '${menu}'
				$.ajax({
					url : './newsDelete',
					type : 'POST',
					data : {
						num : num
					},
					success : function(data) {
						if (data == 1) {
							location.href = './'+menu;
						}
					}
				})
			} else{
				alert('취소되었습니다');
			}
		});
		
		
///////////////////////////////////////////// 댓글 관련▼
		
		//글자수 textarea 체크
		$('.c_area').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 500)");    //글자수 실시간 카운팅

		    if (content.length > 500){
		        alert("최대 500자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 500));
		        $('#counter').html("(500 / 500)");
		    }
		});
		
		
		var curPage = 1;
		
		getList(curPage); //함수호출
		
		// 댓글 수정 코드
		$('#updateBtn').click(function() {
			var upContents = $('#updateContents').val();
			var cnumId = $('#cnum').val();
			$.ajax({
				
				url:"../comments/newsCommentsUpdate",
				type:"POST",
				data: {
					cnum : cnumId,
					contents : upContents
				},
				success:function(data) {
					console.log(data);
					if(data=='1') {
						getList(1);
					} else {
						alert('수정실패');
					}
				}
			});
		});
		$('.commentslist').on('click', '.c_update', function() {
			var id = $(this).attr('title');
			var con = $('#c' + id).html();
			$('#updateContents').val(con);
			$('#cnum').val(id);
		});
		
		//댓글 등록하기 코드
		$('#comment_btn').click(function() {
			var num = $('#nnum').val();
			var id = $('#c_writer').text();
			var contents = $('.c_area').val();
			$.ajax({
				
				url:"../comments/newsCommentsWrite",
				type:"POST",
				data: {
					num : num,
					id : id,
					contents : contents
				},
				success:function(data) {
					if(data=='1') {
						location.reload();
						getList(1);
					} else {
						alert('등록실패');
					}
				}
			});
			
		});
		//등록하기 코드 끝
		
		//리스트 가져오기
		function getList(curPage) {
			$.get("../comments/newsCommentsList?num=${vo.num}&curPage="+curPage,
					function(data) {
						if (curPage == 1) {
							$('.commentslist').html(data);
						} else {
							$('.commentslist').append(data);
						}
					})
		}
		
		
		
		//원본 댓글 삭제
		$('.commentslist').on('click', '.c_delete', function() {
			var ref = $(this).attr('id');
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				
				$.ajax({
					
					url:"../comments/newsCommentsDelete",
					type:"POST",
					data: {
						ref : ref
					},
					success:function(data) {
							location.reload();
							getList(1); //append가 아니라 html로 덮어씌우기
					}
				});
				
			}
		});
		
		//원본 댓글 삭제
		$('.commentslist').on('click', '.reply_delete', function() {
			var cnum = $(this).attr('id');
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				
				$.ajax({
					
					url:"../comments/newsCommentsReplyDelete",
					type:"POST",
					data: {
						cnum : cnum
					},
					success:function(data) {
						if(data=='1') {
							location.reload();
							getList(1); //append가 아니라 html로 덮어씌우기
						} else {
							alert('삭제실패');
						}
					}
				});
				
			}
		});
		
		
		/////////////////////////////////////////////////
				////// 댓글 더보기 코드
				$('#more').click(function() {
					curPage++;
					getList(curPage);
				});
		
		
		
		////////////////////////////대댓글 관련 코드
		var recnum = 0;
		$('.commentslist').on('click', '.c_replyBtn', function() {
				
			recnum = $(this).attr('title');
			
		});
		///댓글 답글 
		$('#replyBtn').click(function() {
			var recnum2 = recnum;
			var reContents = $('#replyContents').val();
			var renum = $('#nnum').val();
			var reid = $('#reid').val();
			
			$.ajax({
				
				url:"../comments/newsCommentsReply",
				type:"POST",
				data: {
					cnum : recnum2,
					num : renum,
					id : reid,
					contents : reContents
				},
				success:function(data) {
					if(data=='1') {
						getList(1);
					} else {
						alert('등록실패');
					}
				}
			});
		});
		
		var likecnum = 0;
		var likeId = '${memberVO.id}';
		var likeResult = null;
		var hateResult = null;
		console.log(likeId);
		
		///////////////////////////////////////좋아요
		$('.commentslist').on('click', '.like', function(e) {
			e.preventDefault();
			if(likeId == '') {
				alert('로그인 하셔야 이용 가능합니다.');
				location.href="../member/memberLogin";
			} else {
				likecnum = $(this).attr('title');
				$.ajax({
					
					url:"../comments/newsCommentsLike",
					type:"POST",
					data: {
						cnum : likecnum,
						num : likecnum,
						id : likeId
					},
					success:function(data) {
						if(data=='1') {
							getList(1);
						} else {
							alert('like error');
						}
					}
				});
			}
		});
		
///////////////////////////////////////////// 댓글 끝	

	});

</script>
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
          <h1 class="h3 mb-2 text-gray-800">${menu} 게시판 관리</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
              	<div id="controller_div">
         			<input type="button" value="삭제" id="delete_btn" class="btn btn-danger">
					<a href="./${menu}Update?num=${vo.num}" id="write_btn" class="btn btn-primary">글 수정</a>
         		</div>
         		<input type="hidden" name="num" value="${vo.num}" id="nnum">
				<input type="hidden" name="menu" value="${vo.menu}" id="nmenu">
		
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  
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
						<tr class="position_2">
							<td class="num">${vo.num}</td>
							<td>${vo.title}	</td>
							<td class="date">${vo.writer}</td>
							<td class="date">${vo.reg_date }</td>
							<td class="hit">${vo.hit}</td>
						</tr>
						<tr>
						<td>서브내용</td>
						<td colspan="5">${vo.sub_contents}</td>
						</tr>
						<tr>
						<td>주내용</td>
						<td colspan="5">${vo.main_contents}</td>
						</tr>
						<tr>
							<td>썸네일이미지</td>
							<td colspan="4">
							<img alt="" src="../resources/file/${vo.newsImagesVO.oname}" style="width:400px">
							</td>
						</tr>	
                  </tbody>
                </table>
           
        <!----------------------------- 댓글 시작 -------------------------------->
					<div id="comment_box">
						<div id="comment">
							<div id="c_top">
								<input type="hidden" id="like_check">
								<input type="hidden" name="num" id="num" value="1">
								<span id="c_count_title">전체댓글</span><span id="c_count">${totalCount}</span>
							</div>
							<c:choose>
								<c:when test="${not empty memberVO}">
								<div id="c_write_box">
									<p id="c_writer">${memberVO.id}</p>
									<textarea class="c_area" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
									<span id="counter">(0 / 500)</span>
								</div>
								<div id="c_btn">
									<button id="comment_btn">등록</button>
								</div>
								</c:when>
								<c:otherwise>
								<div id="c_write_box2">
									<textarea placeholder="로그인 후 사용하실 수 있습니다" disabled="disabled"></textarea>
								</div>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 댓글 리스트 -->
						<div class="commentslist">
						
						</div>	
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
								      <label for="contents">작성자 :</label>
								      <input class="form-control" type="text" value="${memberVO.id}" disabled="disabled">
								    </div>
						          <div class="form-group">
								      <label for="contents">댓글 :</label>
								      <textarea class="form-control" rows="5" id="updateContents" name="contents"></textarea>
								      <input type="hidden" id="cnum">
								    </div>
						        </div>
						        <div class="modal-footer">
								     <button id="updateBtn" data-dismiss="modal">댓글 수정</button>
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
								      <label for="reid">작성자 :</label>
								      <input class="form-control" type="text" name="reid" id="reid" value="${memberVO.id}" readonly>
								    </div>
						          <div class="form-group">
								      <label for="contents">댓글 :</label>
								      <textarea class="form-control" rows="5" id="replyContents" name="contents"></textarea>
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
			     	<a href="./${menu}" id="list">목록</a>
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
 
</body>
</html>