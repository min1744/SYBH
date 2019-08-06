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



<!-- ------------ notice list -------------- -->

<c:if test="${board eq 'notice'}">


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
				<li><a href="./noticeList" style="color:#6bb5db;">공지사항</a></li>
				<li><a href="../hospital/hospitalInfo">병원소개</a></li>
				<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
				<li><a href="../hospital/floorInfo">층별안내</a></li>
				<li><a href="../hospital/location">오시는 길</a></li>
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
						<!-- fix -->
					    <c:forEach items="${list2}" var="vo">
							<tr class="position">
							<td class="num"><img src="../resources/images/notice_icon.png"></td>
							<td class="title"><a href="./${board}Select?num=${vo.num}">${vo.title}</a>	</td>
							<td class="date">${vo.reg_date}</td>
							<td class="hit">${vo.hit}</td>
							</tr>
						</c:forEach>  
						<c:forEach items="${list}" var="vo">
							<tr class="position_2">
								<td class="num">${vo.num}</td>
								<td><a href="./${board}Select?num=${vo.num}">${vo.title}</a></td>
								<td class="date">${vo.reg_date}</td>
								<td class="hit">${vo.hit}</td>
							</tr>
						</c:forEach>
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
							<li><a href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
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

</c:if>

<!-- ------------------- QNA list ---------------- -->


<c:if test="${board eq 'qna'}">

<div id="board">
		<c:choose>
			<c:when test="${menu eq 'complaint'}">
		<div id="board_title">
				<p id="title">건의합니다</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
		</div>
	
		<div id="write_btn">
		<a href="./complaintWrite" id="write">글쓰기</a>
	</div>
			</c:when>
			<c:when test="${menu eq 'praise'}">
			<div id="board_title">
				<p id="title">칭찬합니다</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 칭찬하고싶은 사항을 등록해주세요.</p>
				</div>
	
		<div id="write_btn">
		<a href="./praiseWrite" id="write">글쓰기</a>
	</div>
			</c:when>
			<c:otherwise>
			<div id="board_title">
				<p id="title">질문과 답변</p>
				<p id="sub_title">쌍용백병원을 이용하시면서 궁금한 사항을 등록해 주세요.</p>
				</div>
	
		<div id="write_btn">
		<a href="./qnaWrite" id="write">글쓰기</a>
	</div>
			</c:otherwise>
		</c:choose>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
		<c:choose>
			<c:when test="${menu eq 'complaint'}">
				<ul>
					<li>고객의 소리</li>
					<li><a href="#" style="color:#6BB5DB;">건의합니다</a></li>
					<li><a href="./praise">칭찬합니다</a></li>
					<li><a href="./qnaList">질문과답변</a></li>
				</ul>
			</c:when>
			<c:when test="${menu eq 'praise'}">
				<ul>
					<li>고객의 소리</li>
					<li><a href="./complaint">건의합니다</a></li>
					<li><a href="#" style="color:#6BB5DB;">칭찬합니다</a></li>
					<li><a href="./qnaList">질문과답변</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li>고객의 소리</li>
					<li><a href="./complaint">건의합니다</a></li>
					<li><a href="./praise">칭찬합니다</a></li>
					<li><a href="#" style="color:#6BB5DB;">질문과답변</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
		
		</div>
		
		
		<div id="boardList">
				<table>
					<thead>
						<tr>
							<th style="width: 95px;">번호</th>
							<th style="width: 510px;">제목</th>
							<th style="width: 150px;">작성자</th>
							<th style="width: 150px;">작성일</th>
							<th style="width: 100Px;">조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${menu eq 'complaint'}">
							<c:forEach items="${list}" var="complaint">
							<tr class="position_2">
								<td class="num">${complaint.num}</td>
								<td><a href="./complaintSelect?num=${complaint.num}">${complaint.title}</a></td>
								<td class="date">${complaint.writer}</td>
								<td class="date">${complaint.reg_date }</td>
								<td class="hit">${complaint.hit}</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:when test="${menu eq 'praise'}">
							<c:forEach items="${list}" var="praise">
							<tr class="position_2">
								<td class="num">${praise.num}</td>
								<td><a href="./praiseSelect?num=${praise.num}">${praise.title}</a></td>
								<td class="date">${praise.writer}</td>
								<td class="date">${praise.reg_date }</td>
								<td class="hit">${praise.hit}</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="qna">
							<tr class="position_2">
								<td class="num">${qna.num}</td>
								<td><a href="./qnaSelect?num=${qna.num}">${qna.title}</a></td>
								<td class="date">${qna.writer}</td>
								<td class="date">${qna.reg_date }</td>
								<td class="hit">${qna.hit}</td>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				
				
				<c:choose>
					<c:when test="${menu eq 'complaint'}">
						<div id="paging">
							<ul>
								<c:if test="${pager.curBlock>1}">
								<li><a href="./complaintList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
							</c:if>
							<c:choose>
								<c:when test="${pager.totalCount == 0 }">
									<li><a href="./complaintList?curPage=1&kind=${pager.kind}$search=${pager.search}">1</a></li>
								</c:when>
								<c:otherwise>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li><a href="./complaintList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<c:if test="${pager.curBlock<pager.totalBlock}">
								<li><a href="./complaintList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
							</c:if>
							</ul>
						</div>
					</c:when>
					<c:when test="${menu eq 'praise'}">
						<div id="paging">
							<ul>
								<c:if test="${pager.curBlock>1}">
								<li><a href="./praiseList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
							</c:if>
							<c:choose>
								<c:when test="${pager.totalCount == 0 }">
									<li><a href="./praiseList?curPage=1&kind=${pager.kind}$search=${pager.search}">1</a></li>
								</c:when>
								<c:otherwise>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li><a href="./praiseList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<c:if test="${pager.curBlock<pager.totalBlock}">
								<li><a href="./praiseList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
							</c:if>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div id="paging">
							<ul>
								<c:if test="${pager.curBlock>1}">
								<li><a href="./qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a></li>
							</c:if>
							<c:choose>
								<c:when test="${pager.totalCount == 0 }">
									<li><a href="./qnaList?curPage=1&kind=${pager.kind}$search=${pager.search}">1</a></li>
								</c:when>
								<c:otherwise>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li><a href="./qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<c:if test="${pager.curBlock<pager.totalBlock}">
								<li><a href="./qnaList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a></li>
							</c:if>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			
			
			
			
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

</c:if>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>