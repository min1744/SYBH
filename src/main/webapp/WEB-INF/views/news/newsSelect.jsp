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
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			if(result){
				location.href="./boardList";
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
			<p id="title">영양 정보</p>
			<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
		</div>
	
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="./notice/noticeList">건강뉴스</a></li>
				<li><a href="#">질병 정보</a></li>
				<li><a href="#" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="#">운동 정보</a></li>
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
			
			<div id="file">
					<table>
						<tr>
							<th><img src="../resources/images/clip.png">첨부파일</th>
							<td><a href="">파일명.jpg</a></td>
							<td><a href="">파일명sdfsdfsdf.jpg</a></td>
						</tr>
					</table>
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
			
			
			<div id="btn_box">
				<a href="./newsList" id="list">목록</a>
				
				<a href="./newsDelete" id="delete">삭제</a>
				<a href="./newsUpdate" id="update">수정</a>
			</div>
		
		</div>
		
	
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>