$(function() {
		
		$("#delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			if(result){
				
				location.href="./boardList";
			}
						
		});
		
		
		/////////////////////////////////qna 원본 글 삭제 관련▼
		$("#q_delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var ref = $('#qref').val();
			var menu = $('#qmenu').val();
			if(result){
				
				post({'ref':ref,'menu':menu});
			}
						
		});
		
		//원본 글 삭제 post방식으로 넘기기
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
		
		
		
	});