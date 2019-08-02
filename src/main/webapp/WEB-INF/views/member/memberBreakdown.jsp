<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
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
		<c:choose>
			<c:when test="${board eq 'nomal'}">
		<div id="board_title">
			<p>진료 예약 조회</p>
		</div>

	<div id="board_box">
	
		<div id="board_nav">
		
			<ul>
				<li>조회 내역</li>
				<li><a href="./memberUpdate">내정보 수정</a></li>
				<li><a href="./memberNomal" style="color:#6BB5DB;">진료예약 조회</a></li>
				<li><a href="./memberMedical">건강검진 조회</a></li>
				<li><a href="./memberDonation">후원내역 조회</a></li>
				<li><a href="./memberBreakdown">문의내역 조회</a></li>
			</ul>
			</c:when>
			<c:when test="${board eq 'medical'}">
			<div id="board_title">
			<p>건강검진 예약 조회</p>
		</div>

	<div id="board_box">
	
		<div id="board_nav">
			<ul>
				<li>조회 내역</li>
				<li><a href="./memberUpdate">내정보 수정</a></li>
				<li><a href="./memberNomal">진료예약 조회</a></li>
				<li><a href="./memberMedical" style="color:#6BB5DB;">건강검진 조회</a></li>
				<li><a href="./memberDonation">후원내역 조회</a></li>
				<li><a href="./memberBreakdown">문의내역 조회</a></li>
			</ul>
			</c:when>
			<c:otherwise>
			<div id="board_title">
			<p>후원내역 조회</p>
		</div>

	<div id="board_box">
	
		<div id="board_nav">
			<ul>
				<li>조회 내역</li>
				<li><a href="./memberUpdate">내정보 수정</a></li>
				<li><a href="./memberNomal">진료예약 조회</a></li>
				<li><a href="./memberMedical">건강검진 조회</a></li>
				<li><a href="./memberDonation" style="color:#6BB5DB;">후원내역 조회</a></li>
				<li><a href="./memberBreakdown">문의내역 조회</a></li>
			</ul>
			</c:otherwise>
		</c:choose>
		
		</div>
	
		<div id="info_box">	
		
			<div id="info_list">
				
			<c:choose>
				<c:when test="${board eq 'nomal'}">
				<!-- 일반진료 예약 내역 -->
				<p>총 게시물 : <span>0</span></p>
			
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>예약자명</th>
							<th>진료과목/의료진</th>
							<th>예약날짜</th>
							<th>진료날짜</th>
							<th>예약여부</th>
							<th>처방전</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>홍길동</td>
							<td>이비인후과/최재혁</td>
							<td>2019-07-30</td>
							<td>2019-08-01-09:00</td>
							<td>예약완료or진료완료</td>	<!-- 진료예약날짜가 지나야 진료완료 떠야함 -->
							<td>처방전파일.pdf</td> <!-- 처방전은 진료완료일때만 뜨게끔 -->					
						</tr>
					</tbody>
				</table>
				<div id="paging">
					<ul>
						<c:if test="${pager.curBlock>1 }">
						<li><a href="./member${board }?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
						</c:if>
						<c:choose>
							<c:when test="${pager.totalCount < 10 }">
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
				</c:when>
				<c:when test="${board eq 'Medical'}">
				<!-- 건강검진 예약 내역 -->
				<p>총 게시물 : <span>${count}</span></p>
			
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>예약자명</th>
							<th>검진명</th>
							<th>검진날짜</th>
							<th>예약검진금액</th>
							<th>검진여부</th>
							<th>결제날짜</th>
							<th>결제정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list" varStatus="i">
						<tr>
							<td>${list.num }</td>
							<td>${memberVO.name }</td>
							<td>${list.contents }</td>
							<td id="check_date${i.index}" class="check" >${list.check_date}</td>
							<td>${list.price }</td>
							
							<!-- 검진날짜가 지나야 검진완료 떠야함 -->
							<td id="check_status" class="check_status">
							<c:choose>
								<c:when test="${list.check_status eq 0 }">예약대기</c:when>
								<c:when test="${list.check_status eq 1 }">예약취소</c:when>
								<c:when test="${list.check_status eq 2 }">검진완료</c:when>
							</c:choose>
							</td>
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
							<c:when test="${pager.totalCount < 10 }">
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
				<script type="text/javascript">
					//한자리수일 경우 0을 채워준다. 
					$(function(){
					var date = new Date(); 
					var year = date.getFullYear(); 
					var month = new String(date.getMonth()+1); 
					var day = new String(date.getDate()); 	
						
					if(month.length == 1){ 
					  month = "0" + month; 
					} 
					if(day.length == 1){ 
					  day = "0" + day; 
					} 
					var today = year+"-"+month+"-"+day; //오늘날짜
					$(".check").each(function(){
						var num = $(this).prev().prev().prev().text();
						var check_date = $(this).text();
						var check_status = $(this).next().next().text().match('예약대기');
						if(today>check_date && check_status =='예약대기' ){
							$.ajax({
								url:"../checkup/checkUpUpdate",
								type:"POST",
								data:{
									num : num,
									check_status : 2
								},success : function(data){
									location.reload();
								}
							});//ajax문
						}//if문	
					});//each문
					
					});
					
					
				</script>
				</c:when>
				<c:otherwise>
				<!-- 후원내역 -->
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
							<td><fmt:formatNumber value="${list.price}" pattern="#,###"/> 원</td>
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
							<c:when test="${pager.totalCount < 10 }">
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
				</c:otherwise>
			</c:choose>
				
				
			</div>
			
		</div>
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>