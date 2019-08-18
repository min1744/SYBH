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
			
			
			<!-- 질환 정보 -->
			<div class="news_nav">
			
				<h3>질환 정보</h3>
				<a href="./disease">전체 목록 보기</a>
			
			</div>
			
			<div class="news_contents">
				<c:forEach items="${disease}" var="disease">
				<a href="./diseaseSelect?num=${disease.num}" class="news">
					<div class="news_img">
					<img src="../resources/file/${disease.newsImagesVO.fname}">
					</div>
					<p class="news_title">${disease.title}</p>
					<p class="news_sub">${disease.sub_contents}</p>
					<p class="news_date">${disease.reg_date}</p>
				</a>
				</c:forEach>
							
			</div>		
			
			
			
			<!-- 영양 정보 -->
			<div class="news_nav">
			
				<h3>영양 정보</h3>
				<a href="./nutrition">전체 목록 보기</a>
				
			</div>
			
			<div class="news_contents">
				<c:forEach items="${nutrition}" var="nutrition">
				<a href="./nutritionSelect?num=${nutrition.num}" class="news">
					<div class="news_img">
					<img src="../resources/file/${nutrition.newsImagesVO.fname}">
					</div>
					<p class="news_title">${nutrition.title}</p>
					<p class="news_sub">${nutrition.sub_contents}</p>
					<p class="news_date">${nutrition.reg_date}</p>
				</a>
				</c:forEach>
							
			</div>				
			
			
			
			<!-- 운동 정보 -->
			<div class="news_nav">
			
				<h3>운동 정보</h3>
				<a href="./exercise">전체 목록 보기</a>
				
			</div>
			
			<div class="news_contents">
				<c:forEach items="${exercise}" var="exercise">
				<a href="./exerciseSelect?num=${exercise.num}" class="news">
					<div class="news_img">
					<img src="../resources/file/${exercise.newsImagesVO.fname}">
					</div>
					<p class="news_title">${exercise.title}</p>
					<p class="news_sub">${exercise.sub_contents}</p>
					<p class="news_date">${exercise.reg_date}</p>
				</a>
				</c:forEach>
							
			</div>				
					
				
			
			
			
		</div>

	</div>
	
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>