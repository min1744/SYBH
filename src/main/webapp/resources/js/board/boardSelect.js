$(function() {
		
		
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $('#num').val();
			if(result){
				
				location.href="./boardList";
			}
						
		});
		
		
		//qna 부분
		$("#q_delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $('#qnum').val();
			var menu = $('#qmenu').val();
			if(result){
				
				post({'num':num,'menu':menu});
			}
						
		});
		
		//post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./qnaDelete");
			for(var key in params){
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type","hidden");
				hiddenField.setAttribute("name",key);
				hiddenField.setAttribute("value",params[key]);
				form.appendChild(hiddenField);
			}
			document.body.appendChild(form);
			form.submit();
		}
		
///////////////////////////////////////////// 댓글 관련▼
		
		var curPage = 1;
		
		getList(1); //함수호출
		
		//댓글 등록하기 코드
		$('#comment_btn').click(function() {
			var num = 41;
			var id = $('#c_writer').text();
			var contents = $('.c_area').val();
			$.ajax({
				
				url:"../comments/commentsWrite",
				type:"POST",
				data: {
					//num : num,
					id : id,
					contents : contents
				},
				success:function(data) {
					if(data=='1') {
						alert('등록성공');
						location.reload();
						getList(1);
					} else {
						alert('등록실패');
					}
				}
			});
			
		});
		//등록하기 코드 끝
		
		
		//리스트 가져오기
		function getList(count) {
			$.get("../comments/commentsList?num=41&curPage="+count,
					function(data) {
						if (count == 1) {
							$('.commentslist').html(data);
						} else {
							$('.commentslist').append(data);
						}
					})
		}
		
		
	});