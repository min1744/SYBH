<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/boardSelect.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			if(result){
				location.href="./boardList";
			}
						
		});
		
		
		
///////////////////////////////////////////// 댓글 관련▼
		
		var curPage = 1;
		
		getList(1); //함수호출
		
		//댓글 등록하기 코드
		$('#comment_btn').click(function() {
			var num = 41;
			var id = $('#c_writer').text();
			var contents = $('.c_area').val();
			$.ajax({
				
				url:"../comments/commentsWrite",
				type:"POST",
				data: {
					//num : num,
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
		function getList(count) {
			$.get("../comments/commentsList?num=41&curPage="+count,
					function(data) {
						if (count == 1) {
							$('.commentslist').html(data);
						} else {
							$('.commentslist').append(data);
						}
					})
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

<c:if test="${board eq 'notice'}">

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
				
				<a href="./${board}Delete?num=${vo.num}" id="delete">삭제</a>
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
					<li><a href="#" style="color:#6BB5DB;">건의합니다</a></li>
					<li><a href="./praise">칭찬합니다</a></li>
					<li><a href="./qnaList">질문과답변</a></li>
				</ul>
			</c:when>
			<c:when test="${menu eq 'praise'}">
				<ul>
					<li>고객의 소리</li>
					<li><a href="./complaint">건의합니다</a></li>
					<li><a href="#" style="color:#6BB5DB;">칭찬합니다</a></li>
					<li><a href="./qnaList">질문과답변</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li>고객의 소리</li>
					<li><a href="./complaint">건의합니다</a></li>
					<li><a href="./praise">칭찬합니다</a></li>
					<li><a href="#" style="color:#6BB5DB;">질문과답변</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
		</div>
		
		<div id="boardSelect">
		
		<c:choose>
			<c:when test="${menu eq 'complaint'}">
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
					
					<!-- 댓글 / 건들지마시오 -->
					<div id="comment_box">
						<div id="comment">
							<div id="c_top">
								<input type="hidden" name="num" id="num" value="1">
								<span id="c_count_title">전체댓글</span><span id="c_count">${totalCount}</span>
							</div>
							<div id="c_write_box">
								<p id="c_writer">${memberVO.id}</p>
								<textarea class="c_area" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
								<span id="counter">(0 / 500)</span>
							</div>
							<div id="c_btn">
								<button id="comment_btn">등록</button>
							</div>
						</div>
						<!-- 댓글 리스트 -->
						<div class="commentslist">
						</div>	
						
					</div>
					<!-- 댓글 끝 -->
					
				<div id="btn_box">
					<a href="./complaint" id="list">목록</a>
						
					<a href="./complaintDelete?num=${vo.num}" id="delete">삭제</a>
					<a href="./complaintUpdate?num=${vo.num}" id="update">수정</a>
				</div>
			</c:when>
			<c:when test="${menu eq 'praise'}">
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
					
					<!-- 댓글 / 건들지마시오 -->
					<div id="comment_box">
						<div id="comment">
							<div id="c_top">
								<input type="hidden" name="num" id="num" value="1">
								<span id="c_count_title">전체댓글</span><span id="c_count">${totalCount}</span>
							</div>
							<div id="c_write_box">
								<p id="c_writer">${memberVO.id}</p>
								<textarea class="c_area" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
								<span id="counter">(0 / 500)</span>
							</div>
							<div id="c_btn">
								<button id="comment_btn">등록</button>
							</div>
						</div>
						<!-- 댓글 리스트 -->
						<div class="commentslist">
						</div>	
						
					</div>
					<!-- 댓글 끝 -->
					
				<div id="btn_box">
					<a href="./praise" id="list">목록</a>
						
					<a href="./praiseDelete?num=${vo.num}" id="delete">삭제</a>
					<a href="./praiseUpdate?num=${vo.num}" id="update">수정</a>
				</div>
			</c:when>
			<c:otherwise>
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
					
					<!-- 댓글 / 건들지마시오 -->
					<div id="comment_box">
						<div id="comment">
							<div id="c_top">
								<input type="hidden" name="num" id="num" value="1">
								<span id="c_count_title">전체댓글</span><span id="c_count">${totalCount}</span>
							</div>
							<div id="c_write_box">
								<p id="c_writer">${memberVO.id}</p>
								<textarea class="c_area" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
								<span id="counter">(0 / 500)</span>
							</div>
							<div id="c_btn">
								<button id="comment_btn">등록</button>
							</div>
						</div>
						<!-- 댓글 리스트 -->
						<div class="commentslist">
						</div>	
						
					</div>
					<!-- 댓글 끝 -->
					
				<div id="btn_box">
					<a href="./qnaList" id="list">목록</a>
						
					<a href="./qnaDelete?num=${vo.num}" id="delete">삭제</a>
					<a href="./qnaUpdate?num=${vo.num}" id="update">수정</a>
				</div>
			</c:otherwise>
		</c:choose>
		
		</div>
	</div>
</div>
</c:if>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>