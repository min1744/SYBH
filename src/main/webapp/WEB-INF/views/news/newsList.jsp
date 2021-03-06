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
			</c:when>

			<c:when test="${menu eq 'nutrition'}">
				<div id="board_title">
					<p id="title">영양 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div id="board_title">
					<p id="title">운동 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 운동 정보에 관해 알려드립니다.</p>
				</div>
				
			</c:otherwise>
		</c:choose>
		<div id="write_btn">
			<c:if test="${memberVO.grade eq '2'}">
				<a href="./${menu}Write" id="write">뉴스등록</a>
				</c:if>
				</div>
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
	    
<!-- 검색 -->			
		<div id="newsList">
						<form action="./${menu}">
							<div id="news_search">
								<input type="text" name="search" id="search" placeholder="제목을 입력해주세요">
								<button id="search_btn">검색</button>
							</div>
						</form>
			<div id="newsContents">
			<c:choose>
				<c:when test="${menu eq 'disease'}">
					<c:forEach items="${list}" var="disease">
				<a href="./diseaseSelect?num=${disease.num}" class="news">
					<div class="news_img">
					<img src="../resources/file/${disease.newsImagesVO.oname}">
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
					<img src="../resources/file/${nutrition.newsImagesVO.oname}">
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
					<img src="../resources/file/${exercise.newsImagesVO.oname}">
					</div>
					<p class="news_title">${exercise.title}</p>
					<p class="news_sub">${exercise.sub_contents}</p>
					<p class="news_date">${exercise.reg_date}</p>
				</a>
				</c:forEach>
				</c:when>				
			</c:choose>
			</div>
			
<!--페이징처리 -->			
			
			<c:choose>
				<c:when test="${menu eq 'disease'}">		
				<div id="paging">
			<ul>
				<c:if test="${pager.curBlock>1}">
					<li><a href="./disease?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
				</c:if>
					<c:choose>				
					<c:when test="${pager.totalCount == 0 }">
						<li><a href="./disease?curPage=1&kind=${pager.kind}&search=${pager.search}">1</a></li>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li><a href="./disease?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				<c:if test="${pager.curBlock<pager.totalBlock}">
					<li><a href="./disease?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
				</c:if>
				</ul>
			</div>
			</c:when>
			<c:when test="${menu eq 'nutrition'}">		
				<div id="paging">
			<ul>
				<c:if test="${pager.curBlock>1}">
					<li><a href="./nutrition?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
				</c:if>
					<c:choose>				
					<c:when test="${pager.totalCount == 0 }">
						<li><a href="./nutrition?curPage=1&kind=${pager.kind}&search=${pager.search}">1</a></li>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li><a href="./nutrition?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				<c:if test="${pager.curBlock<pager.totalBlock}">
					<li><a href="./nutrition?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
				</c:if>
				</ul>
			</div>
			</c:when>
			<c:otherwise>
			<div id="paging">
			<ul>
				<c:if test="${pager.curBlock>1}">
					<li><a href="./exercise?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
				</c:if>
					<c:choose>				
					<c:when test="${pager.totalCount == 0 }">
						<li><a href="./exercise?curPage=1&kind=${pager.kind}&search=${pager.search}">1</a></li>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li><a href="./exercise?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				<c:if test="${pager.curBlock<pager.totalBlock}">
					<li><a href="./exercise?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
				</c:if>
				</ul>
			 </div>
			</c:otherwise>
		</c:choose>
		
			
			
			
		</div>
		
	</div>
	
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>