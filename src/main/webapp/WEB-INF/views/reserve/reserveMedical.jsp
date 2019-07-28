<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/reserveMedical.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p>건강검진 예약</p>
		</div>

	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>진료 예약/조회</li>
				<li><a href="./reserveInfo">예약안내</a></li>
				<li><a href="./reserveNomal">일반진료 예약</a></li>
				<li><a href="#" style="color:#6BB5DB;">건강검진 예약</a></li>
				<li><a href="#">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="doctorList">
			
			<div id="office_select">
				<h3>검진 선택</h3>
				<ul>
					<li>
					<input type="radio" name="a" checked="checked">기존 종합검진(남)<br>
					<input type="radio" name="a">기존 종합검진(여)
					</li>
					<li>
					<input type="radio" name="a" checked="checked">기존 종합검진(남)<br>
					<input type="radio" name="a">기존 종합검진(여)
					</li>
					<li>
					<input type="radio" name="a" checked="checked">기존 종합검진(남)<br>
					<input type="radio" name="a">기존 종합검진(여)
					</li>
					<li>
					<input type="radio" name="a" checked="checked">기존 종합검진(남)<br>
					<input type="radio" name="a">기존 종합검진(여)
					</li>
					<li id="last_li">
					<input type="radio" name="a" checked="checked">기존 종합검진(남)<br>
					<input type="radio" name="a">기존 종합검진(여)
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