<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/newsList.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">영양 정보</p>
			<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
		</div>
	
	<div id="write_btn">
	<a href="./newsWrite" id="write">뉴스 등록</a>
	</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질병 정보</a></li>
				<li><a href="./nutrition" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
		
		</div>
		
		
		<div id="newsList">
		
			<div id="news_search">
				<select id="select_box">
					<option>제목</option>
				</select>
				<input type="text" name="search" id="search" placeholder="검색어를 입력해주세요">
				<button id="search_btn">검색</button>
			</div>
			
			<div id="newsContents">
			
				<a href="./newsSelect" class="news">
					<div class="news_img">
					<img src="../resources/images/news_all_1.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./newsSelect" class="news">
					<div class="news_img">
					<img src="../resources/images/news_all_2.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./newsSelect" class="news last_box">
					<div class="news_img">
					<img src="../resources/images/news_all_3.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				
				<a href="./newsSelect" class="news">
					<div class="news_img">
					<img src="../resources/images/news_health_1.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./newsSelect" class="news">
					<div class="news_img">
					<img src="../resources/images/news_health_2.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./newsSelect" class="news last_box">
					<div class="news_img">
					<img src="../resources/images/news_health_3.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				
				<a href="./newsSelect" class="news">
					<div class="news_img">
					<img src="../resources/images/news_1.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./newsSelect" class="news">
					<div class="news_img">
					<img src="../resources/images/news_2.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
				
				<a href="./newsSelect" class="news last_box">
					<div class="news_img">
					<img src="../resources/images/news_3.jpg">
					</div>
					<p class="news_title">${vo.title}</p>
					<p class="news_sub">${vo.sub_contents}</p>
					<p class="news_date">${vo.reg_date}</p>
				</a>
			
			</div>
			
			
			<div id="paging">
					
					<ul>
						<li><a href="" id="prev">◀</a></li>
						<li><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">4</a></li>
						<li><a href="">5</a></li>
						<li><a href="">6</a></li>
						<li><a href="">7</a></li>
						<li><a href="">8</a></li>
						<li><a href="">9</a></li>
						<li><a href="">10</a></li>
						<li><a href="" id="next">▶</a></li>
					</ul>				
				
				</div>
			
			
			
		</div>
		
	</div>
	
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>