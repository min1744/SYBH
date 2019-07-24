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
				<li><a href="./memberDonation" style="color:#6BB5DB;">후원내역 조회</a></li>
				<li><a href="./memberBreakdown">문의내역 조회</a></li>
			</ul>
		
		</div>
	
		<div id="info_box">	
		
			<div id="info_list">
				
				<p>총 게시물 : <span>${count }</span></p>
			
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
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.num }</td>
							<td>${list.name }</td>
							<td>${list.price }원</td>
							<td>${list.pay_date }</td>
							<td>${list.opt }</td>						
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
				
				<div id="paging">
					
					<ul>
						<c:if test="${pager.curBlock>1 }">
						<li><a href="./member${board }?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
						</c:if>
						<c:choose>
							<c:when test="${pager.totalCount==0 }">
								<li><a href="./member${board }?curPage=1&kind=${pager.kind}&search=${pager.search}">1</a></li>
							</c:when>
							<c:otherwise>
								<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="i">
									<li><a href="./member${board }?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<c:if test="${pager.curBlock<pager.totalBlock }">
						<li><a href="./member${board }?curPage=${pager.lastNum+1 }&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
						</c:if>
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