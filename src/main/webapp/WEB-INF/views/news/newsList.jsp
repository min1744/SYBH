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
		<c:choose>
			<c:when test="${menu eq 'disease'}">
				<div id="board_title">
					<p id="title">질환 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 질환 정보에 관해 알려드립니다.</p>
				</div>

				<div id="write_btn">
					<a href="./diseaseWrite" id="write">뉴스 등록</a>
				</div>
			</c:when>

			<c:when test="${menu eq 'nutrition'}">
				<div id="board_title">
					<p id="title">영양 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
				</div>
				<div id="write_btn">
					<a href="./nutritionWrite" id="write">뉴스 등록</a>
				</div>
			</c:when>
			<c:otherwise>
				<div id="board_title">
					<p id="title">운동 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 운동 정보에 관해 알려드립니다.</p>
				</div>
				<div id="write_btn">
					<a href="./exerciseWrite" id="write">뉴스 등록</a>
				</div>
			</c:otherwise>
		</c:choose>
	<div id="board_box">
			
		<div id="board_nav">
		
		<c:choose>
			<c:when test="${menu eq 'disease' }">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease" style="color:#6bb5db;">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:when test="${menu eq 'nutrition' }">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:when test="${menu eq 'exercise' }">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise" style="color:#6bb5db;">운동 정보</a></li>
			</ul>
			</c:when>
		</c:choose>
		</div>
			
		<div id="newsList">
		
			<div id="news_search">
				<select id="select_box">
					<option>제목</option>
				</select>
				<input type="text" name="search" id="search" placeholder="검색어를 입력해주세요">
				<button id="search_btn">검색</button>
			</div>
			
			<div id="newsContents">
			<c:choose>
				<c:when test="${menu eq 'disease'}">
					<c:forEach items="${list}" var="disease">
				<a href="./diseaseSelect?num=${disease.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_all_1.jpg">
					</div>
					<p class="news_title">${disease.title}</p>
					<p class="news_sub">${disease.sub_contents}</p>
					<p class="news_date">${disease.reg_date}</p>
				</a>
				</c:forEach>
				</c:when>
				
				
				<c:when test="${menu eq 'nutrition'}">
					<c:forEach items="${list}" var="nutrition">
				<a href="./nutritionSelect?num=${nutrition.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_health_1.jpg">
					</div>
					<p class="news_title">${nutrition.title}</p>
					<p class="news_sub">${nutrition.sub_contents}</p>
					<p class="news_date">${nutrition.reg_date}</p>
				</a>
				</c:forEach>
				</c:when>
				
				
				<c:when test="${menu eq 'exercise'}">
					<c:forEach items="${list}" var="exercise">
				<a href="./exerciseSelect?num=${exercise.num}" class="news">
					<div class="news_img">
					<img src="../resources/images/news_1.jpg">
					</div>
					<p class="news_title">${exercise.title}</p>
					<p class="news_sub">${exercise.sub_contents}</p>
					<p class="news_date">${exercise.reg_date}</p>
				</a>
				</c:forEach>
				</c:when>				
			</c:choose>
			</div>
			
			
				<div id="paging">
			<ul>
				<c:if test="${pager.curBlock>1}">
					<li><a href="./${news}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
				</c:if>
				
				
				<c:choose>
					<c:when test="${pager.totalCount == 0 }">
						<li><a href="./${news}List?curPage=1&kind=${pager.kind}&search=${pager.search}">1</a></li>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li><a href="./${news}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
								
				<c:if test="${pager.curBlock<pager.totalBlock}">
					<li><a href="./${news}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
				</c:if>
				
			
				</ul>
			</div>
			
			
			
		</div>
		
	</div>
	
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>