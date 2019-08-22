$(function() {	
	var kind = $('#kind').val();
	if(kind == 2){
		$('#writer_option').prop("selected", true);
	} else if(kind == 3){
		$('#contents_option').prop("selected", true);
	} else {
		$('#title_option').prop("selected", true);
	}
	
	$('.position_2 td').each(function() {
		var check = $(this).attr("title");
		if(check==1){
			$(this).closest('tr').css({
				'background-color': '#f5f5f5'
			});

			$(this).closest('tr').mouseover(function() {
				$(this).css({
					'background-color': '#f8f8f8'
				});
			});

			$(this).closest('tr').mouseleave(function() {
				$(this).css({
					'background-color': '#f5f5f5'
				});
			});

			$('.depth_a').css({
				'font-weight':'700',
				'color': '#153F91'
			});
		}
		$(this).mouseover(function() {
			$(this).removeAttr('title');
		});
	});


	$('#btn').click(function() {
		var result = $('#search').val();
		if(result == '') {
			alert('검색어를 입력해주세요.');
		} else {
			$('#frm').submit();
		}
	});
});