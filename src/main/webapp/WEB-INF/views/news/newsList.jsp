<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/newsList.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">영양 정보</p>
			<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
		</div>
	
	<div id="write_btn">
	<a href="./newsWrite" id="write">뉴스 등록</a>
	</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="./notice/noticeList">건강뉴스</a></li>
				<li><a href="#">질병 정보</a></li>
				<li><a href="#" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="#">운동 정보</a></li>
			</ul>
		
		</div>
		
		
		<div id="newsList">
		
			<div id="news_search">
			
				<select>
					<option>제목</option>
					<option>내용</option>
				</select>
				
				<input type="text" name="search" id="search">
				
				<button id="search_btn">검색</button>
				
			</div>
		
		
		</div>
		
	</div>
	
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>