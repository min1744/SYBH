<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/boardSelect.css" rel="stylesheet">
<!-- <script type="text/javascript" src="../resources/js/board/boardSelect.js"></script> -->
<c:import url="../temp/commentBootstrap.jsp" />
<script type="text/javascript">
	$(function() {
		
		
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			if(result){
				
				location.href="./boardList";
			}
						
		});
		
		
		/////////////////////////////////qna 원본 글 삭제 관련▼
		$("#q_delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var ref = $('#qref').val();
			var menu = $('#qmenu').val();
			if(result){
				
				post({'ref':ref,'menu':menu});
			}
						
		});
		
		//원본 글 삭제 post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./qnaDelete");
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
		
		/////////////////////////////////qna 답글 삭제 관련▼
		$("#reply_delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $('#qnum').val();
			var menu = $('#qmenu').val();
			if(result){
				
				replypost({'num':num,'menu':menu});
			}
						
		});
		
		//답글 삭제 post방식으로 넘기기
		function replypost(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./replyDelete");
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
		
		
		///////////////////////////////////////////////////////
		
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
			var qcnumId = $('#qcnum').val();
			$.ajax({
				
				url:"../comments/commentsUpdate",
				type:"POST",
				data: {
					qcnum : qcnumId,
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
			$('#qcnum').val(id);
		});
		
		//댓글 등록하기 코드
		$('#comment_btn').click(function() {
			var num = $('#qnum').val();
			var id = $('#c_writer').text();
			var contents = $('.c_area').val();
			$.ajax({
				
				url:"../comments/commentsWrite",
				type:"POST",
				data: {
					num : num,
					id : id,
					contents : contents
				},
				success:function(data) {
					if(data=='1') {
						alert('등록성공');
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
			$.get("../comments/commentsList?num=${vo.num}&curPage="+curPage,
					function(data) {
						if (curPage == 1) {
							$('.commentslist').html(data);
						} else {
							$('.commentslist').append(data);
						}
					})
		}
		
		
		
		//댓글 삭제
		$('.commentslist').on('click', '.c_delete', function() {
			var qcnum = $(this).attr('id');
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				
				$.ajax({
					
					url:"../comments/commentsDelete",
					type:"POST",
					data: {
						qcnum : qcnum
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
		var reqcnum = 0;
		$('.commentslist').on('click', '.c_replyBtn', function() {
				
			reqcnum = $(this).attr('title');
			
		});
		///댓글 답글 
		$('#replyBtn').click(function() {
			var reqcnum2 = reqcnum;
			var reContents = $('#replyContents').val();
			var renum = $('#qnum').val();
			var reid = $('#reid').val();
			$.ajax({
				
				url:"../comments/commentsReply",
				type:"POST",
				data: {
					qcnum : reqcnum2,
					num : renum,
					id : reid,
					contents : reContents
				},
				success:function(data) {
					console.log(data);
					if(data=='1') {
						getList(1);
					} else {
						alert('등록실패');
					}
				}
			});
		});
		
		var likeQcnum = 0;
		var likeId = null;
		var likeResult = null;
		var hateResult = null;
		
		///////////////////////////////////////좋아요
		$('.commentslist').on('click', '.like', function(e) {
			e.preventDefault();
			hate_check();
			if(hateResult==1){
				alert('싫어요는 한번');
			} else if(hateResult ==0 && hateResult == null){
			likeQcnum = $(this).attr('title');
			likeId = '${memberVO.id}';
			$.ajax({
				
				url:"../comments/commentsLike",
				type:"POST",
				data: {
					qcnum : likeQcnum,
					num : likeQcnum,
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
		
		//////////////좋아요 like_check
		function like_check() {
			$.ajax({
				
				url:"../comments/commentsLikeCheck",
				type:"POST",
				data: {
					num : likeQcnum,
					id: likeId
				},
				success:function(data) {
					
					likeResult = data;
					//alert(likeResult);
					//$('#like_check').val(likeResult);
				}
			});
		}
		
		
		///////////////////////////////////////싫어요
		$('.commentslist').on('click', '.hate', function(e) {
			e.preventDefault();
			likeQcnum = $(this).attr('title');
			likeId = '${memberVO.id}';
			like_check();
			if(likeResult==1){
				alert('좋아요는 한번');
			} else if(likeResult ==0 && likeResult == null){
			var hateQcnum = $(this).attr('title');
			var hateId = '${memberVO.id}';
			$.ajax({
				
				url:"../comments/commentsHate",
				type:"POST",
				data: {
					qcnum : hateQcnum,
					num : hateQcnum,
					id : hateId
				},
				success:function(data) {
					if(data=='1') {
						getList(1);
					} else {
						alert('hate error');
					}
				}
			});
			}
		});
		
		

		//////////////싫어요 hate_check
		function hate_check() {
			$.ajax({
				
				url:"../comments/commentsHateCheck",
				type:"POST",
				data: {
					num : likeQcnum,
					id: likeId
				},
				success:function(data) {
					alert(data);
					hateResult = data;
					alert(heateResult);
				}
			});
		}
				
		
	});
</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<!-- ///////////////////////////////////////////////////////// -->
<!-- ---------------------- 공지사항 select ---------------------- -->
<!-- ///////////////////////////////////////////////////////// -->

<input type="hidden" id="board" value="${board}"> 
<c:if test="${board eq 'notice'}">
<input type="hidden" id="num" value="${vo.num}">
<div id="board">
		<div id="board_title">
			<p id="wtitle">공지사항</p>
		</div>
	<div id="board_box">
		<div id="board_nav">
			<ul>
				<li>병원안내</li>
				<li><a href="./noticeList" style="color:#6bb5db;">공지사항</a></li>
				<li><a href="../hospital/hospitalInfo">병원소개</a></li>
				<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
				<li><a href="../hospital/floorInfo">층별안내</a></li>
				<li><a href="../hospital/location">오시는 길</a></li>
			</ul>
		
		</div>
		
		<div id="boardSelect">
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
			
			<div id="contents">${vo.contents}</div>
			
			<div id="btn_box">
				<a href="./${board}List" id="list">목록</a>
				
				<button id="delete">삭제</button>
				
				<a href="./${board}Update?num=${vo.num}" id="update">수정</a>
			</div>
		
		</div>
	</div>
</div>
</c:if>





<!-- ///////////////////////////////////////////////////////// -->
<!-- ---------------------- qna select ---------------------- -->
<!-- ///////////////////////////////////////////////////////// -->


<c:if test="${board eq 'qna'}">

<div id="board">
		<div id="board_title">
			<c:choose>
			<c:when test="${menu eq 'complaint'}">
				<p id="wtitle">건의합니다</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
			</c:when>
			<c:when test="${menu eq 'praise'}">
				<p id="wtitle">칭찬합니다</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 칭찬하고싶은 사항을 등록해주세요.</p>
			</c:when>
			<c:otherwise>
				<p id="wtitle">질문과 답변</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 궁금한 사항을 등록해 주세요.</p>
			</c:otherwise>
		</c:choose>
		</div>
	<div id="board_box">
		<div id="board_nav">
			<c:choose>
			<c:when test="${menu eq 'complaint'}">
				<ul>
					<li>고객의 소리</li>
					<li><a href="./complaint" style="color:#6BB5DB;">건의합니다</a></li>
					<li><a href="./praise">칭찬합니다</a></li>
					<li><a href="./qnaList">질문과답변</a></li>
				</ul>
			</c:when>
			<c:when test="${menu eq 'praise'}">
				<ul>
					<li>고객의 소리</li>
					<li><a href="./complaint">건의합니다</a></li>
					<li><a href="./praise" style="color:#6BB5DB;">칭찬합니다</a></li>
					<li><a href="./qnaList">질문과답변</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li>고객의 소리</li>
					<li><a href="./complaint">건의합니다</a></li>
					<li><a href="./praise">칭찬합니다</a></li>
					<li><a href="./qnaList" style="color:#6BB5DB;">질문과답변</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
		</div>
		
		<div id="boardSelect">
		
				<input type="hidden" name="num" value="${vo.num}" id="qnum">
				<input type="hidden" name="menu" value="${vo.menu}" id="qmenu">
				<input type="hidden" name="num" value="${vo.ref}" id="qref">
				<div class="title">${vo.title}</div>
					<div id="qsub">
						<ul style="width: 30%; float: left;">
							<li>작성자</li>
							<li>${vo.writer}</li>
						</ul>
						<ul style="width: 27%; float: right;">
							<li>등록일</li>
							<li>${vo.reg_date}</li>
							<li>│</li>
							<li>조회수</li>
							<li>${vo.hit}</li>
						</ul>
					</div>
					
					<div id="contents">${vo.contents}</div>
					
					<!-- 댓글 -->
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
								      <input type="hidden" id="qcnum">
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
								      <label for="contents">작성자 :</label>
								      <input class="form-control" type="text" id="reid" value="${memberVO.id}" readonly>
								    </div>
						          <div class="form-group">
								      <label for="contents">댓글 :</label>
								      <textarea class="form-control" rows="5" id="replyContents" name="contents"></textarea>
								      <input type="hidden" id="qcnum2" value="1">
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
					<!-- 댓글 끝 -->
					
				<div id="btn_box">
				<c:choose>
					<c:when test="${menu eq 'complaint'}">
						<a href="./complaint" id="list">목록</a>
					</c:when>
					<c:when test="${menu eq 'praise'}">
						<a href="./praise" id="list">목록</a>
					</c:when>
					<c:otherwise>
						<a href="./qnaList" id="list">목록</a>
					</c:otherwise>
				</c:choose>
					<c:choose>
						<c:when test="${vo.depth eq '1'}">
						<button id="reply_delete">삭제</button>
						</c:when>
						<c:when test="${vo.depth eq '0'}">
						<button id="q_delete">삭제</button>
						</c:when>
					</c:choose>
					<a href="./complaintUpdate?num=${vo.num}" id="update">수정</a>
					<c:if test="${memberVO.grade eq '2'}">
					<a href="./complaintReply?num=${vo.num}" id="reply">답글달기</a>
					</c:if>
				</div>
		</div>
	</div>
</div>
</c:if>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>