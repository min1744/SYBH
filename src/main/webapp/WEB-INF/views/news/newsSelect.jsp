﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/newsSelect.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		
		var board = $("#board").val();
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $("#nnum").val();
			var menu= $("#nmenu").val();
			if(result){
				post({'num':num, 'menu':menu});
			}
		});

		//post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./newsDelete");
			for(var key in params){
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type","hidden");
				hiddenField.setAttribute("name",key);
				hiddenField.setAttribute("value",params[key]);
				form.appendChild(hiddenField);
			}
			document.body.appendChild(form);
			form.submit();
		}
		
		//글자수 textarea 체크
		$('.c_area').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 500)");    //글자수 실시간 카운팅

		    if (content.length > 500){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 500));
		        $('#counter').html("(200 / 500)");
		    }
		});

	});




</script>
</head>
<body>
<!-- header 추가 -->
 
<c:import url="../common/header.jsp" />

<input type="hidden" id="board" value="${news}">

<input type="hidden" id="num" value="${vo.num}">


<div id="board">
		<div id="board_title">
			
			<c:choose>
				<c:when test="${menu eq 'disease'}">
					<p id="title">질환 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 질환 정보에 관해 알려드립니다.</p>
				</c:when>
				<c:when test="${menu eq 'nutrition'}">
					<p id="title">영양 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 건강한 식이요법에 관해 알려드립니다.</p>
				</c:when>
				<c:otherwise>
					<p id="title">운동 정보</p>
					<p id="sub_title">쌍용백병원의 전문 의료진들이 운동 정보에 관해 알려드립니다.</p>
				</c:otherwise>
			</c:choose>
			
	
		
	</div>
	<div id="board_box">
	  <div id="board_nav">
		<c:choose>
			<c:when test="${menu eq 'disease'}">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease" style="color:#6bb5db;">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:when test="${menu eq 'nutrition'}">
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition" style="color:#6bb5db;">영양 정보</a></li>
				<li><a href="./exercise">운동 정보</a></li>
			</ul>
			</c:when>
			<c:otherwise>
			<ul>
				<li>건강뉴스</li>
				<li><a href="./disease">질환 정보</a></li>
				<li><a href="./nutrition">영양 정보</a></li>
				<li><a href="./exercise" style="color:#6bb5db;">운동 정보</a></li>
			</ul>
			</c:otherwise>
		</c:choose>
		</div>
		
		
		<div id="boardSelect">
			<input type="hidden" name="num" value="${vo.num}" id="nnum">
			<input type="hidden" name="menu" value="${vo.menu}" id="nmenu">
		
			<div class="title">${vo.title}</div>
			<div id="sub">
				<ul>
					<li>등록일</li>
					<li>${vo.reg_date}</li>
					<li>│</li>
					<li>조회수</li>
					<li>${vo.hit}</li>
				</ul>
			</div>
			
			<div id="main_contents">${vo.main_contents}</div>
			<div id="sub_contents">${vo.sub_contents}</div>
			
			
			<div id="file">
					<table>
						<tr>
							<th><img src="../resources/images/clip.png">첨부파일</th>
							<td><a href="">파일명.jpg</a></td>
							<td><a href="">파일명sdfsdfsdf.jpg</a></td>
						</tr>
					</table>
				</div>
			
			
			
			
			<div id="btn_box">
				<a href="./newsList" id="list">목록</a>
				
				<button id="delete">삭제</button>
				<a href="./${vo.menu}Update?num=${vo.num}" id="update">수정</a>
			</div>
		
		</div>
		
	
	</div>
</div>

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>