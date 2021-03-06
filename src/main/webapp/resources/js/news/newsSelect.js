$(function() {
		
		var board = $("#board").val();
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var num = $("#nnum").val();
			var menu= $("#nmenu").val();
			if(result){
				post({'num':num, 'menu':menu});
			}
		});

		//post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./newsDelete");
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
		        alert("최대 500자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 500));
		        $('#counter').html("(500 / 500)");
		    }
		});
		
		
		var curPage = 1;
		var nnum = $('#num').val();
		
		getList(curPage); //함수호출
		
		// 댓글 수정 코드
		$('#updateBtn').click(function() {
			var upContents = $('#updateContents').val();
			var cnumId = $('#cnum').val();
			
			if(upContents == '') {
				
				alert('수정할 내용을 입력해주세요.');
			} else {
				
				$.ajax({
					
					url:"../comments/newsCommentsUpdate",
					type:"POST",
					data: {
						cnum : cnumId,
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
				
			}
			
		});
		$('.commentslist').on('click', '.c_update', function() {
			var id = $(this).attr('title');
			var con = $('#c' + id).html();
			$('#updateContents').val(con);
			$('#cnum').val(id);
		});
		
		//댓글 등록하기 코드
		$('#comment_btn').click(function() {
			var num = $('#nnum').val();
			var id = $('#c_writer').text();
			var contents = $('.c_area').val();
			
			if(contents == '') {
				
				alert('내용을 입력해주세요');
			} else {
				
				$.ajax({
					
					url:"../comments/newsCommentsWrite",
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
				
			}
			
		});
		//등록하기 코드 끝
		
		//리스트 가져오기
		function getList(curPage) {
			$.get("../comments/newsCommentsList?num="+nnum+"&curPage="+curPage,
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
			console.log(ref);
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				
				$.ajax({
					
					url:"../comments/newsCommentsDelete",
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
		
		//답글 댓글 삭제
		$('.commentslist').on('click', '.reply_delete', function() {
			var cnum = $(this).attr('id');
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				
				$.ajax({
					
					url:"../comments/newsCommentsReplyDelete",
					type:"POST",
					data: {
						cnum : cnum
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
		var recnum = 0;
		$('.commentslist').on('click', '.c_replyBtn', function() {
				
			recnum = $(this).attr('title');
			
		});
		///댓글 답글 
		$('#replyBtn').click(function() {
			var recnum2 = recnum;
			var reContents = $('#replyContents').val();
			var renum = $('#nnum').val();
			var reid = $('#reid').val();
			
			if(reContents == '') {
				
				alert('내용을 입력해주세요.');
			} else {
				
				$.ajax({
					
					url:"../comments/newsCommentsReply",
					type:"POST",
					data: {
						cnum : recnum2,
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
				
			}
			
		});
		
		var likecnum = 0;
		var likeId = $('#likeId').val();
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
				likecnum = $(this).attr('title');
				$.ajax({
					
					url:"../comments/newsCommentsLike",
					type:"POST",
					data: {
						cnum : likecnum,
						num : likecnum,
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
