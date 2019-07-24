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
			<p>후원내역 조회</p>
		</div>

	<div id="board_box">
	
		<div id="board_nav">
		
			<ul>
				<li>조회 내역</li>
				<li><a href="./memberUpdate">내정보 수정</a></li>
				<li><a href="./memberBreakdown">진료예약 조회</a></li>
				<li><a href="./memberBreakdown">건강검진 조회</a></li>
				<li><a href="#" style="color:#6BB5DB;">후원내역 조회</a></li>
				<li><a href="./memberBreakdown">문의내역 조회</a></li>
			</ul>
		
		</div>
	
		<div id="info_box">	
		
			<div id="info_list">
				
				<p>총 게시물 : <span>1</span></p>
			
				<table>
					<thead>
						<tr>
							<th>후원번호</th>
							<th>입금자명</th>
							<th>후원금액</th>
							<th>후원날짜</th>
							<th>결제정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						<tr>
							<td>145</td>
							<td>admin</td>
							<td>1,456,789원</td>
							<td>2019-07-24-23:15:04</td>
							<td>신용카드</td>						
						</tr>
						
					</tbody>
				</table>
				
				<div id="paging">
					
					<ul>
						<li><a href="" id="prev">◀</a></li>
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
						<li><a href="" id="next">▶</a></li>
					</ul>				
				
				</div>
			</div>
			
		</div>
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>