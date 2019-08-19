<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/newsSelect.css" rel="stylesheet">
<c:import url="../temp/commentBootstrap.jsp" />
<script type="text/javascript">
	$(function() {
		
		var board = $("#board").val();
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $("#nnum").val();
			var menu= $("#nmenu").val();
			if(result){
				post({'num':num, 'menu':menu});
			}
		});

		//post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./newsDelete");
			for(var key in params){
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type","hidden");
				hiddenField.setAttribute("name",key);
				hiddenField.setAttribute("value",params[key]);
				form.appendChild(hiddenField);
			}
			document.body.appendChild(form);
			form.submit();
		}
		
		
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
<body>
<!-- header 추가 -->
 
<c:import url="../common/header.jsp" />

<input type="hidden" id="board" value="${news}">

<input type="hidden" id="num" value="${vo.num}">


<div id="board">
		<div id="board_title">
			
			<c:choose>
				<c:when test="${menu eq 'disease'}">
					<p id="title">질환 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 질환 정보에 관해 알려드립니다.</p>
				</c:when>
				<c:when test="${menu eq 'nutrition'}">
					<p id="title">영양 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
				</c:when>
				<c:otherwise>
					<p id="title">운동 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 운동 정보에 관해 알려드립니다.</p>
				</c:otherwise>
			</c:choose>
			
	
		
	</div>
	<div id="board_box">
	  <div id="board_nav">
		<c:choose>
			<c:when test="${menu eq 'disease'}">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease" style="color:#6bb5db;">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:when test="${menu eq 'nutrition'}">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:otherwise>
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise" style="color:#6bb5db;">운동 정보</a></li>
			</ul>
			</c:otherwise>
		</c:choose>
		</div>
		
		
		<div id="boardSelect">
			<input type="hidden" name="num" value="${vo.num}" id="nnum">
			<input type="hidden" name="menu" value="${vo.menu}" id="nmenu">
		
			<div class="title">${vo.title}</div>
			<div id="sub">
				<ul>
					<li>등록일</li>
					<li>${vo.reg_date}</li>
					<li>│</li>
					<li>조회수</li>
					<li>${vo.hit}</li>
				</ul>
			</div>
			
		
			
			<div id="main_contents">${vo.main_contents}</div>
			<div id="sub_contents">${vo.sub_contents}</div>
			
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
			
			
			
			
			<div id="btn_box">
				<a href="./newsAll" id="list">목록</a>
				
				<button id="delete">삭제</button>
				<a href="./${vo.menu}Update?num=${vo.num}" id="update">수정</a>
			</div>
		
		</div>
		
	
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>