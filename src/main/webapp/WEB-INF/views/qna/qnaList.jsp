<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/qnaList.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">고객의 소리</p>
			<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
		</div>
	
	<div id="write_btn">
	<a href="./noticeWrite" id="write">글쓰기</a>
	</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>고객의 소리</li>
				<li><a href="./noticeList">건의합니다</a></li>
				<li><a href="#">칭찬합니다</a></li>
				<li><a href="#">질문과답변</a></li>
				
			
			</ul>
		
		</div>
		
		
		<div id="boardList">
				<table>
					<thead>
						<tr>
							<th style="width: 95px;">번호</th>
							<th style="width: 510px;">제목</th>
							<th style="width: 150px;">작성일</th>
							<th style="width: 100Px;">조회수</th>
						</tr>
					</thead>
					<tbody>
							<tr class="position_2">
								<td class="num">1</td>
								<td><a href="./qnaSelect?num=41">타이틀타이틀타이틀</a></td>
								<td class="date">2019-07-26</td>
								<td class="hit">0</td>
							</tr>
					</tbody>
				</table>
				<div id="paging">
				<ul>
					<li><a href="#"id="prev">◀</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li><a href="#">10</a></li>
					<li><a href="#" id="next">▶</a></li>
				</ul>
			</div>
			
			<div id="search_box">
				<select name="kind" id="select">
					<option value="1">제목</option>
					<option value="2">작성자</option>
					<option value="3">내용</option>
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