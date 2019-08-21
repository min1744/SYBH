	$(function() {
					
		$("#write").click(function() {
			//다른 input들 검증
			if($('#contents').summernote('isEmpty')) {
				alert('Empty');
			} else if($('#sub_contents').summernote('isEmpty')){
				alert('Empty');				
			} else {
				$('#frm').submit();	
			}
			
		});
		
		$(".fdel").click(function() {
			var check = confirm("삭제 하시겠습니까? 복구 불가능");
			var id = $(this).attr("id");
			var title = $(this).attr("title");
			var select = $(this);
			if(check){
				$.ajax({
					url:"../ajax/fileDelete",
					type:"POST",
					data:{
						fnum:id,
						fname:title,
					},
					success:function(data){
						data=data.trim();
						if(data=='1'){
							select.parent().remove();
							select.remove();
							var result = '<input type="file" name="multipartFile" class="form-control">';
							$("#files").append(result);
						}else {
							alert("File Delete Fail");
						}
					}
				});
			}
		});
		var img= '${newsVO.newsImagesVO}';
		if(img == ''){
			$('.fdel').hide();
			var result = '<input type="file" name="multipartFile" class="form-control">';
			$("#files").append(result);
		}
			
	});