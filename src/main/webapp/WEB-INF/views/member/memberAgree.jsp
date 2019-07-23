<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberAgree.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		//checkAll button control
		$("#checkAll").click(function() {
			var checkAll = $(this).prop("checked");
			$(".check").prop("checked", checkAll);
		});

		//All check control
		$(".check").click(function() {
			var check = true;
			$(".check").each(function() {
				if (!$(this).prop("checked")) {
					check = false;
				}
			});
			$("#checkAll").prop("checked", check);
		});
		
		//모든 checkbox 'checked' 검증
		$("#next").click(function() {
			if($("#checkAll").prop("checked")){
				location.href="./memberJoin";
			} else {
				alert("이용약관을 모두 동의하지 않으셨습니다.");
			}
		});
	});
</script>
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
				<h2>이용약관</h2>
				<div id="agree_${i.count}_box">
					<c:import url="../common/agree${i.count}.jsp" />
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