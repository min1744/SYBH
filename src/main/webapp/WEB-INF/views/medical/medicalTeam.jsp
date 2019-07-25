<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/medicalTeam.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">의료진</p>
			<p id="sub_title">쌍용백병원의 분야별 최고의 의료진을 소개합니다.</p>
		</div>
	
	<div id="board_box">
	
		<div id="board_nav">
			<ul>
				<li>병원안내</li>
				<li><a href="../notice/noticeList">공지사항</a></li>
				<li><a href="#">병원소개</a></li>
				<li><a href="#" style="color:#6bb5db;">의료진 소개</a></li>
				<li><a href="#">층별안내</a></li>
				<li><a href="#">오시는 길</a></li>
			</ul>
		</div>
		
		
		<div id="doctorList">
		
			<div id="doctor_search">
				<select id="select_box">
					<option>진료과목</option>
					<option>의료진 이름</option>
				</select>
				<input type="text" name="search" id="search" placeholder="검색어를 입력해주세요">
				<button id="search_btn">검색</button>
			</div>
			
			<div id="doctor_select">
				<h3>진료과목 선택</h3>
				<ul>
					<li><a href="">이비인후과</a></li>
					<li><a href="">외과</a></li>
					<li><a href="">비뇨의학과</a></li>
					<li><a href="">내과</a></li>
					<li><a href="" id="last_li">신경외과</a></li>	
				</ul>
			</div>
			
			<div id="doctor_list">
				<h3>이비인후과</h3>
				<hr>
				
				<!-- 의사 리스트 시작 -->
				<div class="list">
					<div class="list_profile">
						<img alt="" src="../resources/images/01_1.jpg">
					</div>
					
					<div class="list_info">
						<h2 class="name">최익수 교수</h2>
						<p class="med_office">진료과</p><span>이비인후과</span><br>
						<p class="pro_field">전문분야</p><span>부비동염, 안면 성형, 수면 무호흡, 후각·미각질환</span>
					</div>
					
					<div class="list_btn">
						<a href="">진료예약</a>
						<a href="">의료진소개</a>
						<a href="">진료일정표</a>
					</div>
				</div>
				<!-- --------------------------- -->
				<div class="list">
					<div class="list_profile">
						<img alt="" src="../resources/images/01_1.jpg">
					</div>
					
					<div class="list_info">
						<h2 class="name">최익수 교수</h2>
						<p class="med_office">진료과</p><span>이비인후과</span><br>
						<p class="pro_field">전문분야</p><span>부비동염, 안면 성형, 수면 무호흡, 후각·미각질환</span>
					</div>
					
					<div class="list_btn">
						<a href="">진료예약</a>
						<a href="">의료진소개</a>
						<a href="">진료일정표</a>
					</div>
				</div>
				<!-- --------------------------- -->
				<div class="list">
					<div class="list_profile">
						<img alt="" src="../resources/images/01_1.jpg">
					</div>
					
					<div class="list_info">
						<h2 class="name">최익수 교수</h2>
						<p class="med_office">진료과</p><span>이비인후과</span><br>
						<p class="pro_field">전문분야</p><span>부비동염, 안면 성형, 수면 무호흡, 후각·미각질환</span>
					</div>
					
					<div class="list_btn">
						<a href="">진료예약</a>
						<a href="">의료진소개</a>
						<a href="">진료일정표</a>
					</div>
				</div>
				<!-- --------------------------- -->
				<div class="list">
					<div class="list_profile">
						<img alt="" src="../resources/images/01_1.jpg">
					</div>
					
					<div class="list_info">
						<h2 class="name">최익수 교수</h2>
						<p class="med_office">진료과</p><span>이비인후과</span><br>
						<p class="pro_field">전문분야</p><span>부비동염, 안면 성형, 수면 무호흡, 후각·미각질환</span>
					</div>
					
					<div class="list_btn">
						<a href="">진료예약</a>
						<a href="">의료진소개</a>
						<a href="">진료일정표</a>
					</div>
				</div>
				<!-- --------------------------- -->
				<div class="list">
					<div class="list_profile">
						<img alt="" src="../resources/images/01_1.jpg">
					</div>
					
					<div class="list_info">
						<h2 class="name">최익수 교수</h2>
						<p class="med_office">진료과</p><span>이비인후과</span><br>
						<p class="pro_field">전문분야</p><span>부비동염, 안면 성형, 수면 무호흡, 후각·미각질환</span>
					</div>
					
					<div class="list_btn">
						<a href="">진료예약</a>
						<a href="">의료진소개</a>
						<a href="">진료일정표</a>
					</div>
				</div>
				<!-- --------------------------- -->
			
			
			</div>
		</div>
		
	</div>
	
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>