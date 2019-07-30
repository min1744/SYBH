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
			<p id="title">공지사항</p>
			<p id="sub_title">쌍용백병원의 새로운 소식을 알려드립니다.</p>
		</div>
	
	<div id="write_btn">
	<a href="./noticeWrite" id="write">공지등록</a>
	</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="./noticeList">공지사항</a></li>
				<li><a href="#" style="color:#6BB5DB;">병원소개</a></li>
				<li><a href="../medical/medicalTeam">의료진 소개</a></li>
				<li><a href="#">층별안내</a></li>
				<li><a href="#">오시는 길</a></li>
				
			
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