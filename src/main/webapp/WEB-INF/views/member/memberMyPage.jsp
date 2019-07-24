<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberMypage.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p>마이 페이지</p>
		</div>

	<div id="board_box">
	
	<div id="info_box">	
		
		<div id="myInfo">
			<div id="myInfo_list">
				<h3>내 정보</h3>
				<table>
					<tr>
						<th>아이디</th>
						<td>admin</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>admin</td>
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td>000000-0000000</td>
					</tr>
					<tr>
						<th>핸드폰 번호</th>
						<td>010-1111-2222</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>admin@naver.com</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>뭘까</td>
					</tr>
					<tr>
						<th>나이</th>
						<td>100세</td>
					</tr>
				</table>
				
				<div id="info_btn">
					<a href="" id="memberUpdate">회원정보 수정</a>
					<a href="" id="memberDelete">회원탈퇴</a>
				</div>
			</div>
			
			
			<!-- 일반진료 -->
			<div id="reserve_info" class="common_div">
			
				<h3>진료예약 조회</h3>
				
				<p>온라인으로 진료 예약한 내역을<br>
				확인하실 수 있습니다.</p>
				
				<div class="info_btn_2">
					<a href="">조회하기</a>
				</div>
			</div>
			
			
			<!-- 건강검진진료 -->
			<div id="medical_info" class="common_div">
			
				<h3>건강검진 조회</h3>
				
				<p>온라인으로 건강검진 예약내역을<br>
				확인하실 수 있습니다.</p>
				
				<div class="info_btn_2">
					<a href="">조회하기</a>
				</div>
			</div>
			
			
			<!-- 후원내역 -->
			<div id="donation_info" class="common_div">
			
				<h3>후원내역 조회</h3>
			
				<p>쌍용백병원에 후원한 내역을<br>
				확인하실 수 있습니다.</p>
			
				<div class="info_btn_2">
					<a href="">조회하기</a>
				</div>
			</div>
			
			
			<!-- 문의내역 -->
			<div id="qna_info" class="common_div">
			
				<h3>문의내역 조회</h3>
			
				<p>내가 남긴 문의 내역을<br>
				확인하실 수 있습니다.</p>
			
				<div class="info_btn_2">
					<a href="">조회하기</a>
				</div>
			</div>
			
			
			<!-- 대표전화 -->
			<div id="main_info">
			
				<h3>대표전화</h3>
			
			</div>
			
			
		</div>
	</div>
		
		
		
	</div>
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>