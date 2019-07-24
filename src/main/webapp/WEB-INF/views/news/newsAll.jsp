<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/newsAll.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p id="title">건강뉴스</p>
			<p id="sub_title">쌍용백병원에서 제공하는 유용한 건강정보입니다.</p>
		</div>
	</div>
	<div id="news_wrap">
		
		<div id="news_box">
			
			<div class="news_nav">
			
				<h3>질환 정보</h3>
				<a href="">전체 목록 보기</a>
				
			</div>
			
			<div class="news_contents">
				
				<div class="news_1">
				
					<img src="">
					<a href="">타이틀</a>
					<p>조회수</p>
					
				</div>
				
				<div class="news_2">
				
				</div>
				
				<div class="news_3">
				
				</div>
				
			</div>			
			
			
			
		</div>

	</div>
	
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>