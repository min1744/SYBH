<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/boardWrite.css" rel="stylesheet">
<c:import url="../temp/boot.jsp" />
<c:import url="../temp/summernote.jsp" />
<script type="text/javascript" src="../resources/js/summernote.js"></script>
<script type="text/javascript" src="../resources/js/news/newsUpdate.js"></script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<c:choose>
			<c:when test="${menu eq 'disease'}">
				<p id="wtitle">질환 글수정</p>
			</c:when>
			<c:when test="${menu eq 'nutrition'}">
				<p id="wtitle">영양 글수정</p>
			</c:when>
			<c:otherwise>
				<p id="wtitle">운동 글수정</p>
			</c:otherwise>
		</c:choose>
		</div>

	
<div id="board_box">
	
	<div id="form_box">
		<form id="frm" action="./newsUpdate" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${newsVO.num}">
		<input type="hidden" name="menu" value="${newsVO.menu}">
		<div class="float">
		 <span class="title">제목</span>
 		 <input class="form-control" type="text" id="title" value="${newsVO.title}" name="title">
		</div>
		<div class="float">
		 <span class="writer">작성자</span>
 		 <input class="form-control" type="text" id="writer" name="writer" value="${memberVO.name}" readonly>
		</div>
		<div class="form-group" id="contents_box">
		  <span class="contents">sub</span>
 		 <textarea class="form-control" rows="5" cols="15" id="sub_contents" name="sub_contents">${newsVO.sub_contents}</textarea>
		</div>
		<div class="form-group" id="contents_box">
		  <span class="contents">main</span>
 		 <textarea class="form-control" rows="5" cols="15" id="contents" name="main_contents">${newsVO.main_contents}</textarea>
		</div>
		<div class="form-group" id="box">
				<p>${newsVO.newsImagesVO.oname} <span id="${newsVO.newsImagesVO.fnum}" title="${newsVO.newsImagesVO.fname}" class="fdel" style="cursor: pointer;">X</span>
			<div id="files"></div>
		</div>
		<div id="write_btn">
			<input id="write" type="button" value="글수정">
		</div>
	</form>
	</div>
	</div>
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>