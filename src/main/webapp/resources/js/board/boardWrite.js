
$(function() {
	
	$("#write").click(function() {
	//다른 input들 검증
	var q_title = $('#q_title').val();
	var title = $('#title').val();
	if($('#contents').summernote('isEmpty') || q_title == '' || title == '') {
		alert('모두 입력해주세요.');
		return false;
	} else {
		if($('#fix').prop("checked")){
			var fixCount = $('#fixCount').val();
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
	
	
	//qna부분 form 검증
	$("#q_write").click(function() {
			var title = $('#q_title').val();
			console.log(title);
			//다른 input들 검증
			if($('#contents').summernote('isEmpty') || title == '') {
				alert('모두 입력해주세요.');
			} else {
				$('#frm').submit();				
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

