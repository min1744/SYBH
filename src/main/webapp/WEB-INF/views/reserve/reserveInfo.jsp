<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/reserveInfo.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p>예약안내</p>
		</div>

	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>진료 예약/조회</li>
				<li><a href="#" style="color:#6BB5DB;">예약안내</a></li>
				<li><a href="./reserveNomal">일반진료 예약</a></li>
				<li><a href="./reserveMedical">건강검진 예약</a></li>
				<li><a href="../member/memberNomal">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="boardList">
		
			<div class="float_box" id="search">
			
				<h2>의료진 예약</h2>
				<div class="doctor_search">
				<p>의료진 정보를 살펴보고
				예약하시겠어요?</p>
				</div>
				<div id="search_box">
					<form action="../medical/medicalTeamSearch">
					<input type="text" name="name" placeholder="의료진 검색하기"><button>검색</button>
					</form>
				</div>
			
			</div>
		
		
			<div class="info_box">
				<h2>예약안내</h2>
				<ul>
					<li>
					쌍용백병원은 진료의뢰서가 없어도 초진진료를 받으실 수 있습니다.<br>
					(단, 의료급여 환자분은 반드시 병·의원의 진료의뢰서를 지참하셔야 보험급여를 받으실 수 있습니다.)
					</li>
					<li>
					초진 및 신환환자는 진료협력센터 간호사와 상담을 통해 예약하실 수 있습니다.<br>
					(단, 1,2차 의료기관에서 요양급여의뢰서(진료의뢰서) 양식을 발급받으신 분)
					</li>
					<li>
					진료예약이 처리되면 진료일 하루전 SMS 메시지를 발송하여 드리고 있습니다.<br>메시지를 받지 못하셨거나 예약이 대기중인 상태인 경우
					해당 진료과에 확인하시어 진료에 차질이 없도록 하시기 바랍니다.
					</li>
					<li>
					진료과의 사정에 의해 예약일자 및 시간이 조정될 수 있으며, 이 경우 해당진료과에서 미리 연락을 드리고 일정을 조정해 드립니다.
					</li>
					<li>
					정신건강의학과 및 일부 진료의사의 경우 방문예약만 가능하오니 이 경우 전화확인 후 내원하여 주시기 바랍니다.
					</li>
				</ul>
			</div>
			
			
			
			<div class="info_box">
				<h2>전화예약 번호 안내</h2>
				<ul>
					<li>
					대표전화 : 031-910-7114
					</li>
					<li>
					진료협력센터를 통한 예약 031-910-7777<br>
					(단, 1,2차 의료기관에서 요양급여의뢰서(진료의뢰서) 양식을 발급받으신 분)
					</li>
				</ul>
			</div>
			
			
			
			<div class="info_box">
				<h2>토요진료안내</h2>
				<ul>
					<li>
					쌍용백병원은 토요일도 순환제로 교수 진료가 있습니다.<br>
					토요일 진료일정은 매주 변경되오니 정확한 진료일정은 해당 외래진료과로 확인하여 주시기 바랍니다.
					</li>
				</ul>
			</div>
		
		
		</div>
		
	</div>
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>