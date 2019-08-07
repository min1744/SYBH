	$(function() {
		
		
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			if(result){
				
				location.href="./boardList";
			}
						
		});
		
		console.log($('#qnum').val());
		
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
		
		//글자수 textarea 체크
		$('.c_area').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 500)");    //글자수 실시간 카운팅

		    if (content.length > 500){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 500));
		        $('#counter').html("(200 / 500)");
		    }
		});
		
		
		var curPage = 1;
		
		getList(curPage); //함수호출
		
		// 댓글 수정 코드
		$('#updateBtn').click(function() {
			var upContents = $('#updateContents').val();
			var cnumId = $('#cnum').val();
			$.post("../event/commentsUpdate", {
				cnum : cnumId,
				contents : upContents
			},
			function(data) {
				if (data.trim() == '1') {
					//location.reload();
					getList(1);
					//$('#c'+id).html(upContents);
				} else {
					alert('수정실패');
				}
			});
		});
		$('.commentslist').on('click', '.c_update', function() {
			var id = $(this).attr('title');
			var con = $('#c' + id).html();
			$('#updateContents').val(con);
			$('#cnum').val(id);
		});
		
		//댓글 등록하기 코드
		$('#comment_btn').click(function() {
			var num = $('#qnum').val();
			var id = $('#c_writer').text();
			var contents = $('.c_area').val();
			$.ajax({
				
				url:"../comments/commentsWrite",
				type:"POST",
				data: {
					num : num,
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
		
		console.log(curPage);
		//리스트 가져오기
		function getList(curPage) {
			$.get("../comments/commentsList?num=${vo.num}&curPage="+curPage,
					function(data) {
						if (curPage == 1) {
							$('.commentslist').html(data);
						} else {
							$('.commentslist').append(data);
						}
					})
		}
		
		
		
		/////////////////////////////////////////////////
				////// 댓글 더보기 코드
				$('#more').click(function() {
					curPage++;
					getList(curPage);
				});
		
		
		
		
	});