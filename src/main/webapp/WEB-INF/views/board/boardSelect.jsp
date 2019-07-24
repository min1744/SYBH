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
	});




</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p>공지사항</p>
		</div>
	
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">병원소개</a></li>
				<li><a href="#">의료진 소개</a></li>
				<li><a href="#">층별안내</a></li>
				<li><a href="#">오시는 길</a></li>
				
			
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
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>