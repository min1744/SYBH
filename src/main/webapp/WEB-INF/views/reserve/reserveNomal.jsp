<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/reserveNomal.css" rel="stylesheet">
<script type="text/javascript">

	$(function() {
		
		$('#select_btn').click(function(e) {
			e.preventDefault();
		});
		
	});
</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p id="title">일반 진료 예약</p>
			<p id="sub_title">빠르고 편리한 온라인진료예약이 가능합니다.</p>
		</div>

	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>진료 예약/조회</li>
				<li><a href="./reserveInfo">예약안내</a></li>
				<li><a href="#" style="color:#6BB5DB;">일반진료 예약</a></li>
				<li><a href="./reserveMedical">건강검진 예약</a></li>
				<li><a href="#">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="doctorList">
			
			<div id="office_select">
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
				<h3>의료진 선택</h3>
				
				<div id="doctor_select">
				
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
							<button class="select_btn">선택</button>
							<button class="info_btn">의료진 소개</button>
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
							<button class="select_btn">선택</button>
							<button class="info_btn">의료진 소개</button>
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
							<button class="select_btn">선택</button>
							<button class="info_btn">의료진 소개</button>
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
							<button class="select_btn">선택</button>
							<button class="info_btn">의료진 소개</button>
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
							<button class="select_btn">선택</button>
							<button class="info_btn">의료진 소개</button>
						</div>
					</div>
					<!-- --------------------------- -->
				
				</div>
				
			</div>
			
			<div id="user_info">
				<h3>환자 정보</h3>
			</div>
			
			
		</div>
		
	</div>
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>