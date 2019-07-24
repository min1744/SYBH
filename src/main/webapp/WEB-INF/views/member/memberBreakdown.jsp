<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberBreakdown.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p>진료예약내역</p>
		</div>

	<div id="board_box">
	
		<div id="board_nav">
		
			<ul>
				<li>조회 내역</li>
				<li><a href="./memberUpdate">내정보 수정</a></li>
				<li><a href="#" style="color:#6BB5DB;">진료예약 조회</a></li>
				<li><a href="./reserveNomal">건강검진 조회</a></li>
				<li><a href="./reserveMedical">후원내역 조회</a></li>
				<li><a href="#">문의내역 조회</a></li>
			</ul>
		
		</div>
	
		<div id="info_box">	
		
			
			
		</div>
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>