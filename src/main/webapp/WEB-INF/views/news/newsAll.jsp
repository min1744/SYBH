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
				
				<a href="./diseaseSelect?num=${vo.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_all_1.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./diseaseSelect" class="news">
					<div class="news_img">
					<img src="../resources/images/news_all_2.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./diseaseSelect" class="news last_box">
					<div class="news_img">
					<img src="../resources/images/news_all_3.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
			</div>		
			
			
			
			<!-- 영양 정보 -->
			<div class="news_nav">
			
				<h3>영양 정보</h3>
				<a href="./nutrition">전체 목록 보기</a>
				
			</div>
			
			<div class="news_contents">
				
				<a href="./nutritionSelect?num=${vo.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_health_1.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./nutritionSelect?num=${vo.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_health_2.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./nutritionSelect?num=${vo.num}" class="news last_box">
					<div class="news_img">
					<img src="../resources/images/news_health_3.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
			</div>			
			
			
			
			<!-- 운동 정보 -->
			<div class="news_nav">
			
				<h3>운동 정보</h3>
				<a href="./exercise">전체 목록 보기</a>
				
			</div>
			
			<div class="news_contents">
				
				<a href="./exerciseSelect?num=${vo.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_1.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./exerciseSelect?num=${vo.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_2.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./exerciseSelect?num=${vo.num}" class="news last_box">
					<div class="news_img">
					<img src="../resources/images/news_3.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
			</div>			
				
			
			
			
		</div>

	</div>
	
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>