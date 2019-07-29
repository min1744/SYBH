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
					<img alt="" src="../resources/images/stethoscope.png">
					<p><input type="radio" name="a" checked="checked">기본 종합검진(남)<br></p>
					<input type="radio" name="a">기본 종합검진(여)
					</li>
					<li>
					<img alt="" src="../resources/images/hug.png">
					<input type="radio" name="a">쌍용 플래티넘(남)<br>
					<input type="radio" name="a">쌍용 플래티넘(여)<br>
					<input type="radio" name="a">러브 패키지(남)<br>
					<input type="radio" name="a">러브 패키지(여)<br>
					</li>
					<li>
					<img alt="" src="../resources/images/heart.png">
					<input type="radio" name="a">심장 정밀검진 1<br>
					<input type="radio" name="a">심장 정밀검진 2<br>
					<input type="radio" name="a">심장 정밀검진 3<br>
					</li>
					<li>
					<img alt="" src="../resources/images/microscope.png">
					<input type="radio" name="a">소화기 정밀검진<br>
					<input type="radio" name="a">폐 정밀검진<br>
					<input type="radio" name="a">뇌 정밀검진<br>
					</li>
					<li id="last_li">
					<img alt="" src="../resources/images/hospital-bed.png">
					<input type="radio" name="a">숙박 검진(남)<br>
					<input type="radio" name="a">숙박 검진(여)
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