<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/hospitalInfo.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">병원소개</p>
			<p id="sub_title">쌍용백병원 홈페이지를 방문해주셔서 감사합니다.</p>
		</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="../notice/noticeList">공지사항</a></li>
				<li><a href="#" style="color:#6BB5DB;">병원소개</a></li>
				<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
				<li><a href="./floorInfo">층별안내</a></li>
				<li><a href="./location">오시는 길</a></li>
				
			
			</ul>
		
		</div>
		
		
		<div id="boardList">
		
			<div id="introduce_box">
			
				<img alt="" src="../resources/images/logo.png">
				<p id="top_title">환자중심진료와 토털헬스케어의 글로벌 리더를 꿈꾸는 쌍용백병원은</p>
				<p style="color:#808080;">1968년 11월 2일 유서깊은 경교장 터에 대한민국 최고의 병원을 모토로 개원했습니다.<br>
				 쌍용백병원은 오랜 전통과 함께 우수한 의료진, 첨단 시설로 건강한 대한민국을 위한 미래의학의 선도병원으로 최선을 다하고 있습니다.
				</p>
			
			</div>
			
			
			<div id="sub_introduce">
			
				<table>
				
					<tr>
						<th><img alt="" src="../resources/images/1_1.PNG"></th>
						<td>
						<h4>환자 중심 진료를 위한 노력</h4>
						<p>쌍용백병원은 환자 중심 진료를 위해 과별 협진 시스템을 강화하고 있습니다. <br>
						분야별 최고의 전문의료진들이 한자리에 모여 환자의 병기 및 상태에 따른 최상의 치료방법을 결정하고, <br>
						환자와 보호자도 함께 참여해 치료방법에 대한 이해를 넓히고 상호 신뢰를 높이기 위해 특화 클리닉 운영하고 있습니다.<br>
						<br>
						의료장비부문에서도 지속적으로 첨단 의료기기를 도입하여 질병 정복에 노력하고 있으며 진료면에서도 <br>
						쾌적한 환경속에서 기다림 없이 진료를 받을 수 있도록 다양한 방법을 도입하고 있습니다.
						</p>
						</td>
					</tr>
					
					<tr>
						<th><img alt="" src="../resources/images/1_2.PNG"></th>
						<td>
						<h4>사회봉사를 통한 의술 실현</h4>
						<p>봉사를 통한 인술의 실현을 위해 개원 초부터 지역주민을 위한 봉사활동을 활발하게 펼치고 있는 쌍용백병원은 <br>
						매년 수해지역 및 무의촌지역을 방문하여 의료사각지대에 있는 환자분들의 질병을 치료하고 있습니다. <br>
						국내뿐 아니라 해외에서도 매년 의료봉사활동을 진행해 글로벌 병원으로 사랑을 실천하고 있습니다. <br>
						</p>
						</td>
					</tr>
					
					
					<tr>
						<th><img alt="" src="../resources/images/1_3.PNG"></th>
						<td>
						<h4>친절병원 정착으로 환자만족 실현</h4>
						<p>1994년 병원계에 대한 언론사의 첫 평가 조사에서 환자만족도 1위 병원에 선정된 쌍용백병원은  <br>
						이에 만족하지 않고 내원환자의 만족도 향상을 위해 항시 노력하고 있습니다.  <br>
						별도의 T/F 팀을 구성한  ‘설명강화 캠페인’ 등을 시작으로 환자 입장에서  한 번 더 생각할 수 있는 병원이 될 수 있도록 경주하고 있습니다.  <br>
						</p>
						</td>
					</tr>
					
					
					<tr>
						<th><img alt="" src="../resources/images/1_4.PNG"></th>
						<td>
						<h4>위암, 대장암, 간암 3대암 수술 1등급 병원</h4>
						<p>쌍용백병원은 건강심사평가원이 발표한 자료에서 위암, 대장암, 간암 3대암 수술을 잘하는 병원(’12)으로 선정되었습니다.<br> 
						심평원은 암 수술 후 30일 이내 사망한 수술사망률을 기준으로 사먕률이 낮은 병원을 수술 잘하는 1등급 병원으로 선정했습니다.<br> 
						특히 쌍용백병원은 중증의 고위험자비율이 타병원보다 높았음에도 국내 병원 평균 수술 사망률보다 낮은 우수한 성과를 보였습니다.<br>
						</p>
						</td>
					</tr>
					
					
					<tr>
						<th><img alt="" src="../resources/images/1_5.PNG"></th>
						<td>
						<h4>첨단 IT선도 병원</h4>
						<p>쌍용백병원은 삼성전자와 모바일병원 MOU 체결하여 최첨단 스마트 병원으로 도약하고 있습니다.<br>  
						특히 전 의료진에게 갤럭시탭 지급 및 환자 설명용 갤럭시 노트 병동 보급 등 첨단 IT기기의 사용으로 응급상황에서<br> 
						 더욱 신속한 의사결정과 정확한 판단을 할 수 있게 되었습니다. 또한 환자들도 치료에 대한 이해와 의료진에 대한 신뢰가 높아졌습니다.<br>   
						</p>
						</td>
					</tr>
				
				</table>
			
			
			</div>
			
		
		
		</div>
		
	</div>
	
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>