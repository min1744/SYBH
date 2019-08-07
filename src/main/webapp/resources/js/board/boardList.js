
		$(function() {	
	
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
	
});
