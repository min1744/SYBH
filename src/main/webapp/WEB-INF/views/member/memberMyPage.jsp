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
	
		
		<div id="board_nav">
		
			<ul>
				<li>마이 페이지</li>
				<li><a href="#" style="color:#6BB5DB;">내 정보</a></li>
				<li><a href="#">진료 예약/결제 조회</a></li>
				<li><a href="#">건강검진 예약/결제 조회</a></li>
				<li><a href="#">후원 내역 조회</a></li>
				<li><a href="#">문의 내역</a></li>
			</ul>
		
		</div>
		
		
		<div id="myInfo">
		
			<div id="myInfo_list">
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
				
				
				<a href="" id="memberUpdate">회원정보 수정</a>
				<a href="" id="memberDelete">회원탈퇴</a>
			
			</div>
		
		</div>
		
	</div>
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>