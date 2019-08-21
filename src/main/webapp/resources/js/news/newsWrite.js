$(function() {
	$("#write").click(function() {
		//다른 input들 검증
		if($('#contents').summernote('isEmpty')) {
			alert('모두 입력해주세요.');
		} else {
			$('#frm').submit();				
		}
	});
});