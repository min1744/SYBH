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
							<th style="width: 95px;">번호</th>
							<th style="width: 510px;">제목</th>
							<th style="width: 150px;">작성일</th>
							<th style="width: 100Px;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vo">
							<tr>
								<td>${vo.num}</td>
								<td><a href="./${board}Select?num=${vo.num}">${vo.title}</a></td>
								<td>${vo.writer}</td>
								<td>${vo.hit}</td>
							</tr>
						</c:forEach>
						<!-- fix -->
						<%-- <c:forEach items="${list2}" var="vo">
							<tr id="position">
							<td class="num" style="background-color: blue"></td>
							<td class="title"><a href="./${board}Select?num=${vo.num}"></a></td>
							<td class="date">${vo.reg_date}</td>
							<td class="hit">${vo.hit}</td>
							</tr>
						</c:forEach> --%>
					</tbody>
				</table>
				<div id="paging">
			<ul>
				<c:if test="${pager.curBlock>1}">
					<li><a href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
				</c:if>
				
				
				<c:choose>
					<c:when test="${pager.totalCount == 0 }">
						<li><a href="./${board}List?curPage=1&kind=${pager.kind}$search=${pager.search}">1</a></li>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li><a href="./${board}List?curPage=${i}&kind=${pager.kind}$search=${pager.search}">${i}</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
								
				<c:if test="${pager.curBlock<pager.totalBlock}">
					<li><a href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
				</c:if>
				
			
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