<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/qnaSelect.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			if(result){
				location.href="./boardList";
			}
						
		});
		
		
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

<div id="board">
		<div id="board_title">
			<p id="title">고객의 소리</p>
			<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
		</div>
	
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>고객의 소리</li>
				<li><a href="./noticeList">건의합니다</a></li>
				<li><a href="#">칭찬합니다</a></li>
				<li><a href="#">질문과답변</a></li>
				
			
			</ul>
		
		</div>
		
		
		<div id="boardSelect">
		
			<div class="title">자가면역질환 ‘류마티스 관절염’, 빠른 치료와 지속적인 관리가 필요</div>
			<div id="sub">
				<ul>
					<li>등록일</li>
					<li>2019-07-24</li>
					<li>│</li>
					<li>조회수</li>
					<li>1,549</li>
				</ul>
			</div>
			
			<div id="contents">
			
			
			식사의 사칙연산

			수학이 필요한 순간’이란 책을 읽고 있습니다. 
			기초산수인 사칙연산이 고대에는 전문가의 영역이었지만 지금은 읽기능력보다 훨씬 보편적인 능력이 되었다고 하네요. 
			식사에도 사칙연산이 필요한 순간이 있습니다. 
			이것도 이제 영양사나 노련한 주부구단의 전문영역이 아니어야 할 때가 온 것 같습니다. 
			밥을 먹는 사람이라면 누구나 가져야 할 보편적인 능력이 되어야 할 과정임을 말씀 드려보겠습니다.
			
			나누기!
			식재료 준비할 때나 식사하는 과정에서 한 번에 먹을 양을 나누는 것은 식품 위생과 알맞은 양 먹기에 중요합니다. 
			한 근 또는 1kg으로 구입한 고기는 한 번에 먹을 양씩 덜어서 보관해야 냉동과 해동을 반복하면서 맛이 떨어지거나 상하는 일을 막을 수 있습니다. 
			찌개도 냄비째 올려 다 같이 먹는 것이 아니라 작은 그릇에 각자 덜어서 먹고, 
			밀폐용기에 담겨 있는 밑반찬과 김치는  한 번에 먹을 양만 접시에 덜어서 먹고 남은 건 깨끗이 씻어 버리는 것이 좋겠습니다. 
			통째로 꺼내서 먹고 남은 반찬을 그대로 냉장고에 넣었다 꺼냈다 반복하던 어느 날, 
			쉬어버린 김치와 곰팡이가 생긴 반찬통을 발견하게 될 것입니다. ‘보글보글 끓는 냄비에 둘러 앉아 다 같이 먹어야 맛이지’, 
			‘작은 그릇에 찔끔찔끔 소꿉장난하냐 끌끌끌’ 하는 분위기를 바꿔야 나트륨 섭취도 줄이고 식중독의 위험도 줄일 수 있습니다.
			 또 혈당관리나 체중조절이 필요한 경우라면 일정한 양을 덜어서 먹는 일은 자신의 식사량을 눈으로 보고 알고 조절하는 데 꼭 필요한 과정입니다.
			
			
			
			
			</div>
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
				<a href="./qnaList" id="list">목록</a>
				
				<a href="./qnaDelete?num=" id="delete">삭제</a>
				<a href="./qnaUpdate?num=" id="update">수정</a>
			</div>
		
		</div>
		
	
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>