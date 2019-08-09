<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/newsSelect.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		
		var board = $("#board").val();
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $("#num").val();
			if(result){
				post({'num':num});
			}
		});
		//post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./"+news+"Delete");
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
		
		//글자수 textarea 체크
		$('.c_area').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 500)");    //글자수 실시간 카운팅

		    if (content.length > 500){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 500));
		        $('#counter').html("(200 / 500)");
		    }
		});
		
		
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
			<p id="title">영양 정보</p>
			<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
		</div>
	
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>건강뉴스</li>
				<li><a href="#">질병 정보</a></li>
				<li><a href="#" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="#">운동 정보</a></li>
			</ul>
		
		</div>
		
		
		<div id="boardSelect">
		
			<div class="title">${vo.title}</div>
			<div id="sub">
				<ul>
					<li>등록일</li>
					<li>{vo.reg_date}</li>
					<li>│</li>
					<li>조회수</li>
					<li>${vo.hit}</li>
				</ul>
			</div>
			
			<div id="file">
					<table>
						<tr>
							<th><img src="../resources/images/clip.png">첨부파일</th>
							<td><a href="">파일명.jpg</a></td>
							<td><a href="">파일명sdfsdfsdf.jpg</a></td>
						</tr>
					</table>
				</div>
			<div id="contents">${vo.main_contents}</div>
			
			<div id="contents">${vo.sub_contents}</div>
			
			<!-- 댓글 -->
			<div id="comment_box">
			
				<div id="comment">
					<div id="c_top">
						<span id="c_count_title">전체댓글</span><span id="c_count">1,000</span>
					</div>
					
					
					
					<div id="c_write_box">
						<p id="c_writer">hhhh</p>
						<textarea class="c_area" placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
						<span id="counter">(0 / 500)</span>
					</div>
					
					
					
					<div id="c_btn">
						<button id="comment_btn">등록</button>
					</div>
					
				</div>
				
				
					<!-- foreach 돌릴곳 -->
					<div class="c_list_box">
					
					<!-- 작성자/수정/삭제 -->
					<div class="c_list_top">
						<p class="c_list_writer">백민근&nbsp;<span>(qora****)</span></p>
						
						<div class="c_list_ud">
							<ul>
								<li><a href="" class="c_update">수정</a></li>
								<li>│</li>
								<li><a href="" class="c_delete">삭제</a></li>
							</ul>
						</div>
					</div>
						
						<img alt="best" src="../resources/images/best.png" class="best_icon">
						<span class="c_contents">
						아..ㅠㅠ 유연이 마음 속에서 바름이는 진짜 오래전부터 스며들었었나봐.. 36화 보면 엠티 갔다가 유연이랑 바름이만 먼저 돌아오는데, 바름이가 유연이한테 '로체'미니 피규어 주고 나서 잠이 드는데, 바름이 머리가 유연이 어깨에 톡- 기대는 장면에서 나오는 유연이의 독백.'나는 이 감정을 인정할 수 없다. 너에게 재현이처럼, 나에게 너처럼, 너에게 나 역시 특별한 사람이고 싶다는 걸. 네 머리가 내 어깨에 닿기 전까진 나는 인정할 수 없었다' 유연이는 전부터 바름이가 신경쓰이고 눈에 아른거렸고, 스며들어있었는데 인정하기 싫었던거였고ㅠㅠ개인적인 생각이지만 바름이도 그 전부터 유연이가 이미 마음 속에서 스며들고 있지 않았을까- 싶음..ㅠㅠ 재현이를 좋아하고 있었지만, 자기를 챙겨주고 신경써주는 유연이를 무의식 중에 신경쓰고 있었지 않았을까- 하는 생각..ㅠㅠ 그래서 바름이 꿈 속에, 유연이가 줬던 딸기사탕도 나온거고ㅠㅠ
						</span>
						
						<!-- 날짜/답글/신고 -->
						<div class="c_list_box_bottom">
							<div class="c_list_bottom">
								<ul>
									<li class="c_date">2019-07-16 00:36</li>
									<li>│</li>
									<li class="c_reply"><a href="">답글달기</a></li>
									<li>│</li>
									<li class="c_report"><a href="">신고</a></li>
								</ul>
						</div>
						
						<!-- 좋아요/싫어요 -->
						<div class="c_like_bottom">
							<a href="" class="like"><img alt="like" src="../resources/images/like.png">54235</a>
							<a href="" class="hate"><img alt="hate" src="../resources/images/hate.png">24234</a>
						</div>
						
						</div>
					</div>
					<!-- foreach -->
					
					<!-- foreach 돌릴곳 -->
					<div class="c_list_box">
					
					<!-- 작성자/수정/삭제 -->
					<div class="c_list_top">
						<p class="c_list_writer">백민근&nbsp;<span>(qora****)</span></p>
						
						<div class="c_list_ud">
							<ul>
								<li><a href="" class="c_update">수정</a></li>
								<li>│</li>
								<li><a href="" class="c_delete">삭제</a></li>
							</ul>
						</div>
					</div>
						
						<img alt="best" src="../resources/images/best.png" class="best_icon">
						<span class="c_contents">
						아..ㅠㅠ 유연이 마음 속에서 바름이는 진짜 오래전부터 스며들었었나봐.. 36화 보면 엠티 갔다가 유연이랑 바름이만 먼저 돌아오는데, 바름이가 유연이한테 '로체'미니 피규어 주고 나서 잠이 드는데, 바름이 머리가 유연이 어깨에 톡- 기대는 장면에서 나오는 유연이의 독백.'나는 이 감정을 인정할 수 없다. 너에게 재현이처럼, 나에게 너처럼, 너에게 나 역시 특별한 사람이고 싶다는 걸. 네 머리가 내 어깨에 닿기 전까진 나는 인정할 수 없었다' 유연이는 전부터 바름이가 신경쓰이고 눈에 아른거렸고, 스며들어있었는데 인정하기 싫었던거였고ㅠㅠ개인적인 생각이지만 바름이도 그 전부터 유연이가 이미 마음 속에서 스며들고 있지 않았을까- 싶음..ㅠㅠ 재현이를 좋아하고 있었지만, 자기를 챙겨주고 신경써주는 유연이를 무의식 중에 신경쓰고 있었지 않았을까- 하는 생각..ㅠㅠ 그래서 바름이 꿈 속에, 유연이가 줬던 딸기사탕도 나온거고ㅠㅠ
						</span>
						
						<!-- 날짜/답글/신고 -->
						<div class="c_list_box_bottom">
							<div class="c_list_bottom">
								<ul>
									<li class="c_date">2019-07-16 00:36</li>
									<li>│</li>
									<li class="c_reply"><a href="">답글달기</a></li>
									<li>│</li>
									<li class="c_report"><a href="">신고</a></li>
								</ul>
						</div>
						
						<!-- 좋아요/싫어요 -->
						<div class="c_like_bottom">
							<a href="" class="like"><img alt="like" src="../resources/images/like.png">54235</a>
							<a href="" class="hate"><img alt="hate" src="../resources/images/hate.png">24234</a>
						</div>
						
						</div>
					</div>
					<!-- foreach -->
					
					<!-- foreach 돌릴곳 -->
					<div class="c_list_box">
					
					<!-- 작성자/수정/삭제 -->
					<div class="c_list_top">
						<p class="c_list_writer">백민근&nbsp;<span>(qora****)</span></p>
						
						<div class="c_list_ud">
							<ul>
								<li><a href="" class="c_update">수정</a></li>
								<li>│</li>
								<li><a href="" class="c_delete">삭제</a></li>
							</ul>
						</div>
					</div>
						
						<img alt="best" src="../resources/images/best.png" class="best_icon">
						<span class="c_contents">
						아..ㅠㅠ 유연이 마음 속에서 바름이는 진짜 오래전부터 스며들었었나봐.. 36화 보면 엠티 갔다가 유연이랑 바름이만 먼저 돌아오는데, 바름이가 유연이한테 '로체'미니 피규어 주고 나서 잠이 드는데, 바름이 머리가 유연이 어깨에 톡- 기대는 장면에서 나오는 유연이의 독백.'나는 이 감정을 인정할 수 없다. 너에게 재현이처럼, 나에게 너처럼, 너에게 나 역시 특별한 사람이고 싶다는 걸. 네 머리가 내 어깨에 닿기 전까진 나는 인정할 수 없었다' 유연이는 전부터 바름이가 신경쓰이고 눈에 아른거렸고, 스며들어있었는데 인정하기 싫었던거였고ㅠㅠ개인적인 생각이지만 바름이도 그 전부터 유연이가 이미 마음 속에서 스며들고 있지 않았을까- 싶음..ㅠㅠ 재현이를 좋아하고 있었지만, 자기를 챙겨주고 신경써주는 유연이를 무의식 중에 신경쓰고 있었지 않았을까- 하는 생각..ㅠㅠ 그래서 바름이 꿈 속에, 유연이가 줬던 딸기사탕도 나온거고ㅠㅠ
						</span>
						
						<!-- 날짜/답글/신고 -->
						<div class="c_list_box_bottom">
							<div class="c_list_bottom">
								<ul>
									<li class="c_date">2019-07-16 00:36</li>
									<li>│</li>
									<li class="c_reply"><a href="">답글달기</a></li>
									<li>│</li>
									<li class="c_report"><a href="">신고</a></li>
								</ul>
						</div>
						
						<!-- 좋아요/싫어요 -->
						<div class="c_like_bottom">
							<a href="" class="like"><img alt="like" src="../resources/images/like.png">54235</a>
							<a href="" class="hate"><img alt="hate" src="../resources/images/hate.png">24234</a>
						</div>
						
						</div>
					</div>
					<!-- foreach -->
					
			</div>
			<!-- 댓글 끝 -->
			
			
			<div id="btn_box">
				<a href="./newsList" id="list">목록</a>
				
				<button id="delete">삭제</button>
				<a href="./newsUpdate?num=${vo.num}" id="update">수정</a>
			</div>
		
		</div>
		
	
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>