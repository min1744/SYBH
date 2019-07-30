<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/floorlInfo.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">층별/편의시설 안내</p>
			<p id="sub_title">쌍용백병원의 층별 및 편의시설을 안내합니다.</p>
		</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="../notice/noticeList">공지사항</a></li>
				<li><a href="./hospitalInfo">병원소개</a></li>
				<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
				<li><a href="#" style="color:#6BB5DB;">층별안내</a></li>
				<li><a href="#">오시는 길</a></li>
				
			
			</ul>
		
		</div>
		
		
		<div id="boardList">
		
			<div id="floor_info">
				<button id="floor">층별안내</button>
				<button id="amenities">편의시설안내</button>
				
				<h3>본관</h3>
				
				<table>
					<tr>
						<th>12층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>내과계중환자실</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>11층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>간호·간병통합서비스병동</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>10층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>간호·간병통합서비스병동</li>
								<li>뇌졸중집중치료실</li>
								<li>수면다원검사실</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>9층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>석고실</li>
								<li>간호·간병통합서비스병동</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>8층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>호스피스완화의료센터</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>7층</th>
						<td>
							<ul>
								<li>병동</li>
							</ul>
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