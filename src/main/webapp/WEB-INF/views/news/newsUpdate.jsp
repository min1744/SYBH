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
<script type="text/javascript">
	$(function() {
	
		//file 추가
		var count = 0;
		
		$('#add').click(function() {
			if(count < 5) {
				var result = '<input type="file" name="f1" class="form-control f1"><span style="cursor:pointer;" class="del">X</span>';
				$('#files').append(result);
				count++;
			} else {
				alert('첨부파일은 최대 5개까지만 가능합니다.');
			}
		});	
			
		$("#write").click(function() {
			//다른 input들 검증
			if($('#contents').summernote('isEmpty')) {
				alert('Empty');
			} else {
				$('#frm').submit();				
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
			<p>공지수정</p>
		</div>
	
<div id="board_box">
	
	<div id="form_box">
		<form id="frm" action="./newsUpdate" method="post">
		<input type="hidden" name="num" value="${vo.num}">
		<div class="float">
		 <span class="title">제목</span>
 		 <input class="form-control" type="text" id="title" value="${vo.title}" name="title">
		</div>
		<div class="float">
		 <span class="writer">작성자</span>
 		 <input class="form-control" type="text" id="writer" name="writer" value="admin" readonly>
		</div>
		<div class="form-group" id="contents_box">
		  <span class="contents">글내용</span>
 		 <textarea class="form-control" rows="5" cols="15" id="contents" name="contents">${vo.contents}</textarea>
		</div>
		<div class="form-group" id="box">
			<input type="button" id="add" value="ADD FILE" class="btn btn-primary">
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