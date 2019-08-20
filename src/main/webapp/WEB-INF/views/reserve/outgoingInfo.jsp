<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/outgoingInfo.css" rel="stylesheet">

</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">외래/접수안내</p>
			<p id="sub_title">쌍용백병원의 외래/진료 접수에 대해 안내해드립니다.</p>
		</div>

	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>진료 예약/조회</li>
				<li><a href="./outgoingInfo" style="color:#6BB5DB;">외래/접수안내</a></li>
				<li><a href="./reserveInfo">예약안내</a></li>
				<li><a href="./reserveNomal">일반진료 예약</a></li>
				<li><a href="./reserveMedical">건강검진 예약</a></li>
				<li><a href="../member/memberNomal">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="boardList">
		
		<!-- 진료 접수 안내 -->
		<div id="change_1">
		
			<div class="info_box">
				<h2>진료 접수 안내</h2>
			</div>
			
			<div id="register_info">
			
				<h3>·&nbsp;진료 접수 절차</h3>
				<h4>진료신청시 준비서류 : 진료의뢰서(가정의학과, 치과, 재활의학과는 제외)</h4>
				
				<h3>·&nbsp;진료 접수 시간</h3>
				<table>
					<thead>
						<tr>
							<th>평일</th>
							<th>토요일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>오전 : 08:00 ~12:00</td>
							<td>오전 : 08:00 ~12:00</td>
						</tr>
						<tr>
							<td>오후 :13:30 ~ 16:00</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<p>※&nbsp;접수 마감 시간은 당일 예약 및 진료신청 환자수에 따라 앞당겨질 수 있습니다.</p>
				
				
				<h3>·&nbsp;진료시간</h3>
				<table>
					<thead>
						<tr>
							<th>평일</th>
							<th>토요일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>오전 : 08:30 ~12:30</td>
							<td>오전 : 08:30 ~12:30</td>
						</tr>
						<tr>
							<td>오후 : 13:30 ~ 17:00</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<p>※&nbsp;진료시간은 진료과마다 다를수 있습니다. 분만 및 응급환자는 24시간 진료가능 합니다.</p>
				
			</div>
				
				
				
		
		</div>
		
		<!-- 외래안내 -->
			<div id="change_2">
			
				<div class="info_box">
				<h2>외래 진료 안내</h2>
				</div>
				
				<div id="info_list">
					<table>
						<tr>
							<td class="info_img"><img src="../resources/images/step1.png"></td>
							<td>
							<h2>진료의뢰서 발급</h2>
							<h3>진료의뢰서를 발급받으셔야 합니다.</h3>
							
							<p>쌍용백병원은 의료전달체계가 필요한 3차 의료 기관으로<br>
							1,2차(병, 의원)에서 발급한 진료 의뢰서를 제출하셔야 합니다.</p>
							</td>
						</tr>
						<tr>
							<td class="info_img"><img src="../resources/images/step2.png"></td>
							<td>
							<h2>접수</h2>
							<h3>접수창구에 제시 후 접수증을 받습니다.</h3>
							
							<p>신분증, 진료의뢰서를 외래동 각층, 신관 3층 접수, 수납창구에 제시한 후 접수 등록합니다.</p>
							</td>
						</tr>
						<tr>
							<td class="info_img"><img src="../resources/images/step3.png"></td>
							<td>
							<h2>진료</h2>
							<h3>진료 후 처방전과 다음 예약을 합니다.</h3>
							
							<p>접수에서 받으신 접수증을 해당 과에 내신 후 접수 순서대로 마친 후<br>
								주치의로부터 처방전과 다음 예약을 합니다.</p>
							</td>
						</tr>
						<tr>
							<td class="info_img"><img src="../resources/images/step4.png"></td>
							<td>
							<h2>수납</h2>
							<h3>접수 · 수납 창구에서 진료비를 수납합니다.</h3>
							
							</td>
						</tr>
						<tr>
							<td class="info_img"><img src="../resources/images/step5.png"></td>
							<td>
							<h2>투약 및 검사</h2>
							<h3>이후 절차는 다음과 같이 진행됩니다.</h3>
							
							<p>안내문의 '금일 진료 후 가실 곳'을 보시고 해당되는 곳으로 가셔서 검사하시면 됩니다.<br>
								또한, 원외 처방전은 원내 무인발급기에서 처방전을 받으시면 됩니다.</p>
							</td>
						</tr>
					</table>
				</div>
		</div>
		<!-- 외래 안내 끝 -->
		
		
		
		
	</div>
		
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>