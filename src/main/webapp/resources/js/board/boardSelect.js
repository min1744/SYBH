$(function() {
	
	
		/////////////////////////////////notice + commu 원본 글 삭제 관련▼
		var board = $("#board").val();
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $("#num").val();
			if(result){
				post({'num':num});
			}
		});
		
		//원본 글 삭제 post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./"+board+"Delete");
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
				
		/////////////////////////////////qna 원본 글 삭제 관련▼
		$("#q_delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var ref = $('#qref').val();
			var menu = $('#qmenu').val();
			if(result){
				
				qnapost({'ref':ref,'menu':menu});
			}
						
		});
		
		//원본 글 삭제 post방식으로 넘기기
		function qnapost(params){
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
		
		/////////////////////////////////qna 답글 삭제 관련▼
		$("#reply_delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $('#qnum').val();
			var menu = $('#qmenu').val();
			if(result){
				
				replypost({'num':num,'menu':menu});
			}
						
		});
		
		//답글 삭제 post방식으로 넘기기
		function replypost(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./replyDelete");
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
		
		
		///////////////////////////////////////////////////////
		
		
		
///////////////////////////////////////////// 커뮤니티 댓글 관련▼
		
		//글자수 textarea 체크
		$('.c_area').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 500)");    //글자수 실시간 카운팅

		    if (content.length > 500){
		        alert("최대 500자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 500));
		        $('#counter').html("(500 / 500)");
		    }
		});
		
		
		var curPage = 1;
		var c_num = $('#c_num').val();
		
		getList(curPage); //함수호출
		
		// 댓글 수정 코드
		$('#updateBtn').click(function() {
			var upContents = $('#updateContents').val();
			var ccnumId = $('#ccnum').val();
			$.ajax({
				
				url:"../comments/commuCommentsUpdate",
				type:"POST",
				data: {
					ccnum : ccnumId,
					contents : upContents
				},
				success:function(data) {
					console.log(data);
					if(data=='1') {
						getList(1);
					} else {
						alert('수정실패');
					}
				}
			});
		});
		$('.commentslist').on('click', '.c_update', function() {
			var id = $(this).attr('title');
			var con = $('#c' + id).html();
			$('#updateContents').val(con);
			$('#ccnum').val(id);
		});
		
		//댓글 등록하기 코드
		$('#comment_btn').click(function() {
			var num = $('#c_num').val();
			var id = $('#c_writer').text();
			var contents = $('.c_area').val();
			$.ajax({
				
				url:"../comments/commuCommentsWrite",
				type:"POST",
				data: {
					num : num,
					id : id,
					contents : contents
				},
				success:function(data) {
					if(data=='1') {
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
		function getList(curPage) {
			$.get("../comments/commuCommentsList?num="+c_num+"&curPage="+curPage,
					function(data) {
						if (curPage == 1) {
							$('.commentslist').html(data);
						} else {
							$('.commentslist').append(data);
						}
					})
		}
		
		
		
		//원본 댓글 삭제
		$('.commentslist').on('click', '.c_delete', function() {
			var ref = $(this).attr('id');
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				
				$.ajax({
					
					url:"../comments/commuCommentsDelete",
					type:"POST",
					data: {
						ref : ref
					},
					success:function(data) {
							location.reload();
							getList(1); //append가 아니라 html로 덮어씌우기
					}
				});
				
			}
		});
		
		//원본 댓글 삭제
		$('.commentslist').on('click', '.reply_delete', function() {
			var ccnum = $(this).attr('id');
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				
				$.ajax({
					
					url:"../comments/commuCommentsReplyDelete",
					type:"POST",
					data: {
						ccnum : ccnum
					},
					success:function(data) {
						if(data=='1') {
							location.reload();
							getList(1); //append가 아니라 html로 덮어씌우기
						} else {
							alert('삭제실패');
						}
					}
				});
				
			}
		});
		
		
		/////////////////////////////////////////////////
				////// 댓글 더보기 코드
				$('#more').click(function() {
					curPage++;
					getList(curPage);
				});
		
		
		
		////////////////////////////대댓글 관련 코드
		var reccnum = 0;
		$('.commentslist').on('click', '.c_replyBtn', function() {
				
			reccnum = $(this).attr('title');
			
		});
		///댓글 답글 
		$('#replyBtn').click(function() {
			var reccnum2 = reccnum;
			var reContents = $('#replyContents').val();
			var renum = $('#nnum').val();
			var reid = $('#reid').val();
			$.ajax({
				
				url:"../comments/commuCommentsReply",
				type:"POST",
				data: {
					ccnum : reccnum2,
					num : renum,
					id : reid,
					contents : reContents
				},
				success:function(data) {
					if(data=='1') {
						getList(1);
					} else {
						alert('등록실패');
					}
				}
			});
		});
		
		var likeccnum = 0;
		var likeId = '${memberVO.id}';
		var likeResult = null;
		var hateResult = null;
		console.log(likeId);
		
		///////////////////////////////////////좋아요
		$('.commentslist').on('click', '.like', function(e) {
			e.preventDefault();
			if(likeId == '') {
				alert('로그인 하셔야 이용 가능합니다.');
				location.href="../member/memberLogin";
			} else {
				likeccnum = $(this).attr('title');
				$.ajax({
					
					url:"../comments/commuCommentsLike",
					type:"POST",
					data: {
						ccnum : likeccnum,
						num : likeccnum,
						id : likeId
					},
					success:function(data) {
						if(data=='1') {
							getList(1);
						} else {
							alert('like error');
						}
					}
				});
			}
		});
		
///////////////////////////////////////////// 댓글 끝	
		
		
		
	});