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
    var fix = ${vo.fix};
    var fixCount = 0;
    if(fix == 1) {
    	$('#fix').prop("checked",true);
    	fixCount = $('#fixCount').val();
    	fixCount--;
    }
	$("#write").click(function() {
	//다른 input들 검증
	if($('#contents').summernote('isEmpty')) {
		alert('Empty');
	} else {
		if($('#fix').prop("checked")){
			if(fixCount > 2){
				alert('상단고정은 최대 3개까지가능합니다');
			} else {
				$('#frm').submit();	
			}
		} else {
			$('#frm').submit();	
		}	
	}
	 });
	   $('#fix_info').hide();
	   
	   $('#fix_info_1').hover(function() {
	      $('#fix_info').show();
	   });
	   
	   $('#fix_info_1').mouseleave(function() {
	      $('#fix_info').hide();
	
	});
});
</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<input type="hidden" id="fixCount" value="${result}">
	<div id="board">
		<div id="board_title">
			<p>공지수정</p>
		</div>

		<div id="board_box">

			<div id="form_box">
				<form id="frm" action="./${board}Update" method="post">
					<input type="hidden" name="num" value="${vo.num}">
					
					<div class="float">
						<span class="title">제목</span> <input class="form-control"
							type="text" id="title" value="${vo.title}" name="title">
					</div>
					<div class="float">
						<span class="writer">작성자</span> <input class="form-control"
							type="text" id="writer" name="writer" value="admin" readonly>
					</div>
					<div class="form-group" id="contents_box">
						<span class="contents">글내용</span>
						<textarea class="form-control" rows="5" cols="15" id="contents"
							name="contents">${vo.contents}</textarea>
					</div>
					<div class="form-group" id="fix_box">
						<img src="../resources/images/info.png" id="fix_info_1">
						<label for="fix" class="contents">공지사항 고정</label>
						<input type="checkbox" id="fix" name="fix" value="1"> 
						<img alt="상단고정은 최대 3개까지가능합니다" src="../resources/images/fix_info.png" id="fix_info">
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