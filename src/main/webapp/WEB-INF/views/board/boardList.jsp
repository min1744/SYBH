<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/noticeList.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/board/boardList.js"></script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />
	<div id="board">
		<c:choose>
			<c:when test="${board eq 'notice'}">
			<!------------ notice ------------>
				<div id="board_title">
					<p id="title">공지사항</p>
					<p id="sub_title">쌍용백병원의 새로운 소식을 알려드립니다.</p>
				</div>
					<div id="write_btn">
				<c:if test="${memberVO.grade eq '2'}">
						<a href="./${board}Write" id="write">공지등록</a>
				</c:if>
					</div>
			</c:when>
			<c:when test="${board eq 'qna'}">
			<!------------ qna ------------>
				<c:choose>
					<c:when test="${menu eq 'complaint'}">
						<div id="board_title">
							<p id="title">건의합니다</p>
							<p id="sub_title">쌍용백병원을 이용하시면서 불편하신점이나 건의할 사항을 등록해 주세요.</p>
						</div>
					</c:when>
					<c:when test="${menu eq 'praise'}">
						<div id="board_title">
							<p id="title">칭찬합니다</p>
							<p id="sub_title">쌍용백병원을 이용하시면서 칭찬하고싶은 사항을 등록해주세요.</p>
						</div>
					</c:when>
					<c:otherwise>
						<div id="board_title">
							<p id="title">질문과 답변</p>
							<p id="sub_title">쌍용백병원을 이용하시면서 궁금한 사항을 등록해 주세요.</p>
						</div>
					</c:otherwise>
				</c:choose>
				<div id="write_btn">
				<c:if test="${memberVO.grade eq '1' || memberVO.grade eq '2'}">
					<a href="./${menu}Write" id="write">글쓰기</a>
				</c:if>
				</div>
			</c:when>
			<c:otherwise>
			<!------------ community ------------>
				<div id="board_title">
					<p id="title">커뮤니티</p>
					<p id="sub_title">쌍용백병원의 커뮤니티 게시판 입니다.</p>
				</div>
				<div id="write_btn">
				<c:if test="${memberVO.grade eq '1' || memberVO.grade eq '2'}">
					<a href="./${board}Write" id="write">글등록</a>
				</c:if>
				</div>
			</c:otherwise>
		</c:choose>
		<div id="board_box">
			<div id="board_nav">
				<c:choose>
					<c:when test="${board eq 'notice'}">
					<!------------ notice ------------>
						<ul>
							<li>병원안내</li>
							<li><a href="./${board}List" style="color: #6bb5db;">공지사항</a></li>
							<li><a href="../hospital/hospitalInfo">병원소개</a></li>
							<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
							<li><a href="../hospital/floorInfo">층별안내</a></li>
							<li><a href="../hospital/location">오시는 길</a></li>
						</ul>
					</c:when>
					<c:when test="${board eq 'qna'}">
					<!------------ qna ------------>
						<c:choose>
							<c:when test="${menu eq 'complaint'}">
								<ul>
									<li>고객의 소리</li>
									<li><a href="./complaint" style="color:#6BB5DB;">건의합니다</a></li>
									<li><a href="./praise">칭찬합니다</a></li>
									<li><a href="./qna">질문과답변</a></li>
								</ul>
							</c:when>
							<c:when test="${menu eq 'praise'}">
								<ul>
									<li>고객의 소리</li>
									<li><a href="./complaint">건의합니다</a></li>
									<li><a href="./praise" style="color:#6BB5DB;">칭찬합니다</a></li>
									<li><a href="./qna">질문과답변</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li>고객의 소리</li>
									<li><a href="./complaint">건의합니다</a></li>
									<li><a href="./praise">칭찬합니다</a></li>
									<li><a href="./qna" style="color:#6BB5DB;">질문과답변</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
					<!------------ community ------------>
						<ul>
							<li>병원커뮤니티</li>
							<li><a href="./communityList" style="color: #6bb5db;">커뮤니티</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="boardList">
				<table>
					<thead>
					<c:choose>
						<c:when test="${board eq 'notice'}">
						<!------------ notice ------------>
						<tr>
							<th style="width: 95px;">번호</th>
							<th style="width: 510px;">제목</th>
							<th style="width: 150px;">작성일</th>
							<th style="width: 100Px;">조회수</th>
						</tr>
						</c:when>
						<c:when test="${board eq 'qna'}">
						<!------------ qna ------------>
						<tr>
							<th style="width: 95px;">번호</th>
							<th style="width: 150px;">구분</th>
							<th style="width: 510px;">제목</th>
							<th style="width: 150px;">작성자</th>
							<th style="width: 150px;">작성일</th>
							<th style="width: 100Px;">조회수</th>
						</tr>
						</c:when>
						<c:otherwise>
						<tr>
							<th style="width: 95px;">번호</th>
							<th style="width: 510px;">제목</th>
							<th style="width: 150px;">작성자</th>
							<th style="width: 150px;">작성일</th>
							<th style="width: 100Px;">조회수</th>
						</tr>
						</c:otherwise>
					</c:choose>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${board eq 'notice'}">
							<!-- fix -->
							<c:forEach items="${fixedList}" var="vo">
								<tr class="position">
								<td class="num"><img src="../resources/images/notice_icon.png"></td>
								<td class="title"><a href="./${board}Select?num=${vo.num}">${vo.title}</a>	</td>
								<td class="date">${vo.reg_date}</td>
								<td class="hit">${vo.hit}</td>
								</tr>
							</c:forEach>  
							<c:forEach items="${list}" var="vo">
							<!------------ notice ------------>
								<tr class="position_2">
									<td class="num">${vo.num}</td>
									<td><a href="./${board}Select?num=${vo.num}">${vo.title}</a></td>
									<td class="date">${vo.reg_date}</td>
									<td class="hit">${vo.hit}</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:when test="${board eq 'qna'}">
							<!------------ qna ------------>
								<c:forEach items="${list}" var="vo">
									<tr class="position_2">
										<td class="num">${vo.num}</td>
										<td class="q_ca">
												[<c:choose>
													<c:when test="${vo.category eq 'site'}">
														<c:choose>
															<c:when test="${vo.depth eq '1'}">
																답변
															</c:when>
															<c:otherwise>
																사이트이용
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${vo.category eq 'web'}">
													<c:choose>
															<c:when test="${vo.depth eq '1'}">
																답변
															</c:when>
															<c:otherwise>
																병원이용
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${vo.category eq 'etc'}">
													<c:choose>
															<c:when test="${vo.depth eq '1'}">
																답변
															</c:when>
															<c:otherwise>
																기타
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>]
										</td>
										<td title="${vo.depth}">
										<c:forEach begin="1" end="${vo.depth}">
											<img width="20px" src="../resources/images/reply.png" style="transform: rotate(-180deg);">
										</c:forEach> 
										<c:choose>
											<c:when test="${vo.depth eq '1'}">
												<a href="./${menu}Select?num=${vo.num}" class="depth_a">${vo.title}</a>
											</c:when>
											<c:otherwise>
												<a href="./${menu}Select?num=${vo.num}">${vo.title}</a>
											</c:otherwise>
										</c:choose>
										</td>
										<td class="date">${vo.writer}</td>
										<td class="date">${vo.reg_date }</td>
										<td class="hit">${vo.hit}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="vo">
								<!------------ community ------------>
								<tr class="position_2">
									<td class="num">${vo.num}</td>
									<td><a href="./${board}Select?num=${vo.num}">${vo.title}</a></td>
									<td class="date">${vo.writer}</td>
									<td class="date">${vo.reg_date}</td>
									<td class="hit">${vo.hit}</td>
								</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div id="paging">
					<c:choose>
						<c:when test="${board eq 'qna'}">
						<!------------ qna ------------>
							<ul>
								<c:if test="${pager.curBlock > 1}">
									<li><a
										href="./${menu}?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
										id="prev">◀</a></li>
								</c:if>
								<c:choose>
									<c:when test="${pager.totalCount == 0 }">
										<li><a
											href="./${menu}?curPage=1&kind=${pager.kind}&search=${pager.search}">1</a></li>
									</c:when>
									<c:otherwise>
										<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
											var="i">
											<li><a
												href="./${menu}?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<c:if test="${pager.curBlock < pager.totalBlock}">
									<li><a
										href="./${menu}?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
										id="next">▶</a></li>
								</c:if>
							</ul>
						</c:when>
						<c:otherwise>
							<ul>
								<c:if test="${pager.curBlock>1}">
									<li>
										<a href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" id="prev">◀</a>
									</li>
								</c:if>
								<c:choose>
									<c:when test="${pager.totalCount == 0 }">
										<li>
											<a href="./${board}List?curPage=1&kind=${pager.kind}&search=${pager.search}">1</a>
										</li>
									</c:when>
									<c:otherwise>
										<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
											<li>
												<a href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<c:if test="${pager.curBlock<pager.totalBlock}">
									<li>
										<a href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" id="next">▶</a>
									</li>
								</c:if>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${board eq 'notice'}">
					<!------------ notice ------------>
					<form id="frm" action="./${board}List">
						<div id="search_box">
							<input type="hidden" id="kind" value="${pager.kind}">
							<select name="kind" id="select">
								<option value="1" id="title_option">제목</option>
								<option value="3" id="contents_option">내용</option>
							</select> <input type="text" name="search" id="search">
							<input type="button" id="btn" value="검색">
						</div>
					</form>
					</c:when>
					<c:when test="${board eq 'qna'}">
					<!------------ qna ------------>
					<form id="frm" action="./${menu}">
						<div id="search_box">
							<input type="hidden" id="kind" value="${pager.kind}">
							<select name="kind" id="select">
								<option value="1" id="title_option">제목</option>
								<option value="2" id="writer_option">작성자</option>
								<option value="3" id="contents_option">내용</option>
							</select>
							<input type="text" name="search" id="search" value="${pager.search}">
							<input type="button" id="btn" value="검색">
						</div>
					</form>
					</c:when>
					<c:otherwise>
					<!------------ community ------------>
					<form id="frm" action="./${board}List">
						<div id="search_box">
							<input type="hidden" id="kind" value="${pager.kind}">
							<select name="kind" id="select">
								<option value="1" id="title_option">제목</option>
								<option value="2" id="writer_option">작성자</option>
								<option value="3" id="contents_option">내용</option>
							</select> <input type="text" name="search" id="search">
							<input type="button" id="btn" value="검색">
						</div>
					</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>