<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberMypage.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	//회원탈퇴(일반 회원)
	$("#memberDelete").click(function() {
		var result = confirm("정말 회원탈퇴 하시겠습니까?");
		if(result){
			alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
			location.href = "./memberDelete";
		}
	});
	
	//회원탈퇴(카카오톡 회원)
	$("#kakaoDelete").click(function() {
		var result = confirm("정말 회원탈퇴 하시겠습니까?");
		if(result){
			alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
			location.href = "./kakaoDelete";
		}
	});
});
</script>
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
			<!-- 내정보 -->
			<div id="myInfo">
				<div id="myInfo_list">
					<h3>내 정보</h3>
					<table>
						<tr>
							<th>아이디</th>
							<c:choose>
								<c:when test="${empty memberVO.id}">
									<td>정보가 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td>${memberVO.id}</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>이름</th>
							<c:choose>
								<c:when test="${empty memberVO.name}">
									<td>정보가 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td>${memberVO.name}</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>주민등록번호</th>
							<c:choose>
								<c:when test="${empty memberVO.res_reg_num}">
									<td>정보가 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td>${memberVO.res_reg_num}</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>핸드폰 번호</th>
							<c:choose>
								<c:when test="${empty memberVO.phone}">
									<td>정보가 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td>${memberVO.phone}</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>이메일</th>
							<c:choose>
								<c:when test="${empty memberVO.email}">
									<td>정보가 없습니다.</td>
								</c:when>
								<c:otherwise>
									<td>${memberVO.email}</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>성별</th>
							<c:choose>
								<c:when test="${empty memberVO.gender}">
									<td>정보가 없습니다.</td>
								</c:when>
								<c:when test="${memberVO.gender eq 1}">
									<td>남자</td>
								</c:when>
								<c:when test="${memberVO.gender eq 2}">
									<td>여자</td>
								</c:when>
								<c:otherwise>
									<td>정보가 없습니다.</td>
								</c:otherwise>
							</c:choose>
							<td>
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<c:choose>
								<c:when test="${empty memberVO.age}">
									<td>정보가 없습니다.</td>
								</c:when>
								<c:when test="${not empty age_range}">
									<td>${age_range}세</td>
								</c:when>
								<c:otherwise>
									<td>${memberVO.age}세</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
					<div id="info_btn">
						<a href="./memberReLogin" id="memberUpdate">회원정보 수정</a>
						<input type="button" id="${variety}Delete" value="회원탈퇴">
					</div>
				</div>
				<!-- 일반진료 -->
				<div id="reserve_info" class="common_div">
					<h3>진료예약 조회</h3>
					<p>온라인으로 진료 예약한 내역을<br>
					확인하실 수 있습니다.</p>
					
					<div class="info_btn_2">
						<a href="./memberNomal">조회하기</a>
					</div>
				</div>
				<!-- 건강검진진료 -->
				<div id="medical_info" class="common_div">
					<h3>건강검진 조회</h3>
					<p>온라인으로 건강검진 예약내역을<br>
					확인하실 수 있습니다.</p>
					<div class="info_btn_2">
						<a href="./memberMedical">조회하기</a>
					</div>
				</div>
				<!-- 후원내역 -->
				<div id="donation_info" class="common_div">
					<h3>후원내역 조회</h3>
					<p>쌍용백병원에 후원한 내역을<br>
					확인하실 수 있습니다.</p>
					<div class="info_btn_2">
						<a href="./memberDonation">조회하기</a>
					</div>
				</div>
				<!-- 문의내역 -->
				<div id="qna_info" class="common_div">
					<h3>문의내역 조회</h3>
					<p>내가 남긴 문의 내역을<br>
					확인하실 수 있습니다.</p>
				
					<div class="info_btn_2">
						<a href="./memberBreakdown">조회하기</a>
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