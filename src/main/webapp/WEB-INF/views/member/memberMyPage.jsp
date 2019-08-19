<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberMypage.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/member/memberMyPage.js"></script>
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
							<!-- 민근 : kakao로그인 시 뿌려지는 member데이터들과 -->
							<!-- 일반회원 로그인 시 뿌려지는 데이터들의 차이로 HTML 수정 -->
							<!-- variety : kakao(카카오 로그인) / member(일반 로그인) -->
							<c:choose>
								<c:when test="${variety eq 'kakao'}">
									<tr>
										<th>이름</th>
										<c:choose>
											<c:when test="${not empty memberVO.name}">
												<td>${memberVO.name}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>이메일</th>
										<c:choose>
											<c:when test="${not empty memberVO.email}">
												<td>${memberVO.email}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>생일</th>
										<c:choose>
											<c:when test="${not empty memberVO.birthday}">
												<td>${memberVO.birthday}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>성별</th>
										<c:choose>
											<c:when test="${not empty memberVO.gender}">
												<td>${memberVO.gender}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>연령대</th>
										<c:choose>
											<c:when test="${not empty memberVO.age_range}">
												<td>${memberVO.age_range}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th>아이디</th>
										<c:choose>
											<c:when test="${not empty memberVO.id}">
												<td>${memberVO.id}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>이름</th>
										<c:choose>
											<c:when test="${not empty memberVO.name}">
												<td>${memberVO.name}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>주민등록번호</th>
										<c:choose>
											<c:when test="${not empty memberVO.res_reg_num}">
												<td>${memberVO.res_reg_num}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>핸드폰 번호</th>
										<c:choose>
											<c:when test="${not empty memberVO.phone}">
												<td>${memberVO.phone}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>이메일</th>
										<c:choose>
											<c:when test="${not empty memberVO.email}">
												<td>${memberVO.email}</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>성별</th>
										<c:choose>
											<c:when test="${not empty memberVO.gender}">
												<c:choose>
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
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th>나이</th>
										<c:choose>
											<c:when test="${not empty memberVO.age}">
												<td>${memberVO.age}세</td>
											</c:when>
											<c:otherwise>
												<td>정보가 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<div id="info_btn">
							<c:if test="${variety eq 'member'}">
								<a href="./memberReLogin" id="memberUpdate">회원정보 수정</a>
							</c:if>
							<input type="button" id="${variety}Delete" value="회원탈퇴">
						</div>
					</div>
					<!-- 일반진료 -->
					<div id="reserve_info" class="common_div">
						<h3>진료예약 조회</h3>
						<p>
							온라인으로 진료 예약한 내역을<br> 확인하실 수 있습니다.
						</p>

						<div class="info_btn_2">
							<a href="./memberNomal">조회하기</a>
						</div>
					</div>
					<!-- 건강검진진료 -->
					<div id="medical_info" class="common_div">
						<h3>건강검진 조회</h3>
						<p>
							온라인으로 건강검진 예약내역을<br> 확인하실 수 있습니다.
						</p>
						<div class="info_btn_2">
							<a href="./memberMedical">조회하기</a>
						</div>
					</div>
					<!-- 후원내역 -->
					<div id="donation_info" class="common_div">
						<h3>후원내역 조회</h3>
						<p>
							쌍용백병원에 후원한 내역을<br> 확인하실 수 있습니다.
						</p>
						<div class="info_btn_2">
							<a href="./memberDonation">조회하기</a>
						</div>
					</div>
					<!-- 문의내역 -->
					<div id="qna_info" class="common_div">
						<h3>고객의소리 조회</h3>
						<p>
							내가 남긴 고객의소리 내역을<br> 확인하실 수 있습니다.
						</p>

						<div class="info_btn_2">
							<a href="./memberQna">조회하기</a>
						</div>
					</div>
					<!-- 대표전화 -->
					<div id="main_info">
						<h3>사이트 문의관련</h3>
						<p>대표전화 : 1588-5700</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer 추가 -->
	<c:import url="../common/footer.jsp" />
</body>
</html>