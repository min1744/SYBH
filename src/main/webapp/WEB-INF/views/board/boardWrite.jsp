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
			<p>공지등록</p>
		</div>
	
<div id="board_box">
	
	<div id="form_box">
		<form id="frm" action="./${board}Write" method="post" enctype="multipart/form-data">
		<div class="float">
		 <span class="title">제목</span>
 		 <input class="form-control" type="text" id="title" name="title">
		</div>
		<div class="float">
		 <span class="writer">작성자</span>
 		 <input class="form-control" type="text" id="writer" name="writer" value="admin" readonly>
		</div>
		<div class="form-group" id="contents_box">
		  <span class="contents">글내용</span>
 		 <textarea class="form-control" rows="5" cols="15" id="contents" name="contents"></textarea>
		</div>
		
		<div id="write_btn">
			<input id="write" type="button" value="글등록">
		</div>
	</form>
	</div>
		
	<p>상단고정!<input type="checkbox" id="fix" name="fix" value="1"></p>	
		
	<div id="write_btn">
	<a href="./noticeWrite" id="write">공지등록</a>
	</div>
	</div>
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>