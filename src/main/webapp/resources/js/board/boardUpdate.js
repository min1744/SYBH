$(function() {
	var fix = $('#dbFix').val();
	if(fix == 1){
		$('#fix').prop("checked", true);
	}
	
	$("#write").click(function() {
		//다른 input들 검증
		if($('#contents').summernote('isEmpty')) {
			alert('모두 입력해주세요.');
		} else {
			var board = $('#board').val();
			if(board == 'notice'){
				var fixStatus = $('#fix').prop("checked");
				if(fixStatus){
					var fixCount = $('#fixCount').val();
					if(fix == 1 && fixCount == 2) {
						fixCount--;
					}
					if(fixCount > 2){
						alert('상단고정은 최대 3개까지가능합니다');
					} else {
						//상단고정이 3개 이하일 때 submit
						$('#frm').submit();	
					}
				} else {
					//상단 고정이 아닌 일반 notice 게시글 submit
					$('#frm').submit();	
				}	
			} else {
				//notice 제외 그냥 submit
				$('#frm').submit();	
			}
		}
	 });
	
	
	//qna부분 form 검증
	$("#q_write").click(function() {
			//다른 input들 검증
			if($('#contents').summernote('isEmpty')) {
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