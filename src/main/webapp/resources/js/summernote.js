/**
 * 
 */

$(function() {
	
	$('#contents').summernote({
		callbacks: {
			onImageUpload: function(files) {
				//파라미터 이름이 file
				var formData = new FormData();
				formData.append('file', files[0]);
				$.ajax({
					
					type: "POST",
					url: "../ajax/summerFileUpload",
					data: formData, 
					enctype: "multipart/form-data",
					contentType: false,
					cache: false,
					processData: false,
					success: function(data) {
						console.log(data);
						data=data.trim();
						$("#contents").summernote('editor.insertImage', data);
					}
				
				});
			},
			
			//onImageUpload End
			onMediaDelete: function(files) {
				var fileName = $(files[0]).attr('src');
				$.ajax({
					
					type:"POST",
					url:"../ajax/summerFileDelete",
					data:{fileName:fileName},
					success: function(data) {
						console.log(data);
					}
					
				});
			}
			//onMediaDelete End
		}
	});
});