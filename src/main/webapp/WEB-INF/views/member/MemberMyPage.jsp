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
				<li><a href="#">예약안내</a></li>
				<li><a href="#">일반진료 예약</a></li>
				<li><a href="#">건강검진 예약</a></li>
				<li><a href="#">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="boardList">
		
		
		</div>
		
	</div>
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>