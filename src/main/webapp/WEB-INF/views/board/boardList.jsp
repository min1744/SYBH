<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/noticeList.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p>공지사항</p>
		</div>
	
	<div id="write_btn">
	<a href="./noticeWrite" id="write">공지등록</a>
	</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="./notice/noticeList">공지사항</a></li>
				<li><a href="#">병원소개</a></li>
				<li><a href="#">의료진 소개</a></li>
				<li><a href="#">층별안내</a></li>
				<li><a href="#">오시는 길</a></li>
				
			
			</ul>
		
		</div>
		
		
		<div id="boardList">
			
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td>${dto.num}</td>
						<td><a href="./${board}Select?num=${dto.num}">${dto.title}</a></td>
						<td>${dto.writer}</td>
						<td>${dto.hit}</td>
					</tr>
						
						
					</c:forEach>		
				</tbody>
			</table>
			
			
			
			
			
			
			
			
			<div id="paging">
				<ul>
					<li><a href="">[이전]</a></li>
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
					<li><a href="">6</a></li>
					<li><a href="">7</a></li>
					<li><a href="">8</a></li>
					<li><a href="">9</a></li>
					<li><a href="">10</a></li>
					<li><a href="">[다음]</a></li>
				</ul>
			</div>
			
			<div id="search_box">
				<select name="kind" id="select">
					<option value="1">제목</option>
					<option value="2">내용</option>
				</select>
				<input type="text" name="search" id="search">
				<button id="btn">검색</button>
			</div>
			
		
		</div>
		
	
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>