<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/boardWrite.css" rel="stylesheet">
<c:import url="../temp/boot.jsp" />
<script type="text/javascript" src="../resources/js/news/newsWrite.js"></script>
<c:import url="../temp/summernote.jsp" />
<script type="text/javascript" src="../resources/js/summernote.js"></script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
		<c:choose>
			<c:when test="${menu eq 'disease'}">
				<p id="wtitle">질환 글 등록</p>
			</c:when>
			<c:when test="${menu eq 'nutrition'}">
				<p id="wtitle">영양 글 등록</p>
			</c:when>
			<c:otherwise>
				<p id="wtitle">운동 글 등록</p>
			</c:otherwise>
			
		</c:choose>
		</div>
<div id="board_box">
	
	<div id="form_box">
		<form id="frm" action="./newsWrite" method="post" enctype="multipart/form-data" name="boardform">
		<c:choose>
			<c:when test="${menu eq 'disease'}">
			<input type="hidden" name="menu" value="disease">
			</c:when>
			<c:when test="${menu eq 'nutrition'}">
			<input type="hidden" name="menu" value="nutrition">
			</c:when>
			<c:otherwise>
			<input type="hidden" name="menu" value="exercise">
			</c:otherwise>
						
		</c:choose>
		<div class="float">
		 <span class="title">제목</span>
 		 <input class="form-control" type="text" id="title" name="title">
		</div>
		<div class="float">
		 <span class="writer">작성자</span>
 		 <input class="form-control" type="text" id="writer" name="writer" value="${memberVO.name}" readonly>
		</div>
		<div class="form-group" id="contents_sub">
		  <span class="contents">sub</span>
 		 <textarea class="form-control" rows="5" cols="15" id="sub_contents" name="sub_contents"></textarea>
		</div>
		<div class="form-group" id="contents_box">
		  <span class="contents">main</span>
 		 <textarea class="form-control" rows="5" cols="15" id="contents" name="main_contents"></textarea>
		</div>
		<div id="info_box">
			<img src="../resources/images/info.png">
			<span>썸네일에 등록할 이미지를 첨부해주세요.</span>
		</div>
		<div class="form-group custom-file" id="box">
			<input type="file" id="add" value="ADD FILE" name="multipartFile">
			<div id="files"></div>
		</div>
		<div id="write_btn">
			<input id="write" type="button" value="뉴스 등록">
		</div>
	</form>
	</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>