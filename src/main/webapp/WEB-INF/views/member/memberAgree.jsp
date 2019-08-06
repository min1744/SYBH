<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberAgree.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/member/memberAgree.js"></script>
</head>
<body>
	<!-- header 추가 -->
	<c:import url="../common/header.jsp" />
	<div id="board">
		<div id="board_title">
			<p id="title">회원가입</p>
			<p id="sub_title">회원가입을 하시면 다양한 서비스를 편리하게 이용하실 수 있습니다.</p>
		</div>
	</div>
	<div id="agree_box">
		<c:forEach begin="1" end="3" step="1" varStatus="i">
			<div id="agree_${i.count}">
				<c:if test="${i.count eq 1}">
				<h2>이용약관</h2>
				</c:if>
				<c:if test="${i.count eq 2}">
				<h2>개인정보수집에 대한 동의</h2>
				</c:if>
				<c:if test="${i.count eq 3}">
				<h2>동의거부시 불이익에 관한 사항</h2>
				</c:if>
				<div id="agree_${i.count}_box">
					<c:import url="../terms_and_conditions/agree${i.count}.jsp" />
				</div>
				<div id="agree_${i.count}_check">
					<input type="checkbox" class="check">위 이용약관에 동의합니다.
				</div>
			</div>
		</c:forEach>
		<div id="all_check">
			<input type="checkbox" id="checkAll">전체 동의
		</div>
		<div id="next_btn">
			<button id="next">다음단계</button>
		</div>
	</div>
	<!-- footer 추가 -->
	<c:import url="../common/footer.jsp" />
</body>
</html>