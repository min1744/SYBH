	$(function() {
					
		var f = document.boardform;
		   $("#write").click(function() {
		   //다른 input들 검증
		   var str = f.title.value;
		   if(!str){
		      alert('제목을 입력하세요');
		      f.title.focus();
		      return false;
		   }
		   str = f.sub_contents.value;
		   if(!str){
		      alert('Sub내용을 입력하세요');
		      f.sub_contents.focus();
		      return false;
		   }
		   if($('#contents').summernote('isEmpty')) {
		      alert('Main내용을 입력해주세요.');
		      return false;
		   }
		   var check = $('.fdel').attr('title');
		   if(!check){
		   str = f.add.value;
			   if(!str){
			      alert('썸네일 이미지를 넣어주세요');
			      return false;
			   }
		   }
		   $("#frm").submit();
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
							var result = '<input type="file" name="multipartFile" id="add" class="form-control formEmptyCheck">';
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
			var result = '<input type="file" name="multipartFile" class="form-control formEmptyCheck">';
			$("#files").append(result);
		}
			
	});