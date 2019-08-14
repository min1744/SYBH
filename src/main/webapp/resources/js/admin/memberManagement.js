//checkAll button control
var variety = $('#variety').val();
if(variety != 'accessinfo'){
	var checkMoreZero = false;
	$("#checkAll").click(function() {
		var checkAll = $(this).prop("checked");
		$(".check").prop("checked", checkAll);
		checkMoreZero = checkAll;
	});
	
	//All check control & Check More Zero
	$(".check").click(function() {
		var check = true;
		checkMoreZero = false;
		$(".check").each(function() {
			if (!$(this).prop("checked")) {
				check = false;
			} else {
				checkMoreZero = true;
			}
		});
		$("#checkAll").prop("checked", check);
	});
	
	$('#delete_btn').click(function() {
		if(checkMoreZero){
			var result = confirm("삭제하시겠습니까?");
			if(result){
				var ids = [];
				$(".check").each(function() {
					if($(this).prop("checked")){
						ids.push($(this).val());
					}
				});
				//ajax로 배열을 전송하고자 할때 추가
				jQuery.ajaxSettings.traditional = true;
				var delete_ajax_url = $('#delete_ajax_url').val();
				$.ajax({
					url : "./"+delete_ajax_url,
					type : "POST",
					data : {
						id : ids
					},
					success : function(data) {
						data = data.trim();
						if (data == '0') {
							alert("삭제 실패");
						} else {
							alert("삭제 되었습니다.");
							location.reload();
						}
					}
				});
			}
		} else {
			alert("선택된 것이 없습니다.");
		}
	});
}

if(variety == 'normal'){
	$('#up_btn').click(function() {
		if(checkMoreZero){
			var ids = [];
			var grades = [];
			$(".check").each(function() {
				if($(this).prop("checked")){
					ids.push($(this).val());
					grades.push($(this).prop("title"));
				}
			});
			//ajax로 배열을 전송하고자 할때 추가
			jQuery.ajaxSettings.traditional = true;
			
			var check = false;
			for(var i = 0; i < grades.length; i++){
				if(grades[i] < 2){
					check = true;
				} else {
					check = false;
					break;
				}
			}
			
			if(check){
				$.ajax({
					url : "./memberUpgrade",
					type : "POST",
					data : {
						id : ids
					},
					success : function(data) {
						data = data.trim();
						if (data == '0') {
							alert("등급 상향 실패");
						} else {
							alert("등급이 상향되었습니다.");
							location.reload();
						}
					}
				});
			} else {
				alert("더 이상 상향할 수 없는 아이디가 포함되어 있습니다.(일반회원 : 1 / 관리자등급 : 2)");
			}
		} else {
			alert("선택된 것이 없습니다.");
		}
	});
	
	$('#down_btn').click(function() {
		if(checkMoreZero){
			var ids = [];
			var grades = [];
			$(".check").each(function() {
				if($(this).prop("checked")){
					ids.push($(this).val());
					grades.push($(this).prop("title"));
				}
			});
			//ajax로 배열을 전송하고자 할때 추가
			jQuery.ajaxSettings.traditional = true;
			
			var check = false;
			for(var i = 0; i < grades.length; i++){
				if(grades[i] < 2){
					check = true;
				} else {
					check = false;
					break;
				}
			}
			
			if(check){
				$.ajax({
					url : "./memberDowngrade",
					type : "POST",
					data : {
						id : ids
					},
					success : function(data) {
						data = data.trim();
						if (data == '0') {
							alert("등급 하향 실패");
						} else {
							alert("등급이 하향되었습니다.");
							location.reload();
						}
					}
				});
			} else {
				alert("더 이상 하향할 수 없는 아이디가 포함되어 있습니다.(일반회원 : 1 / 관리자등급 : 2)");
			}
		} else {
			alert("선택된 것이 없습니다.");
		}
	});
	
	$('#unserviceability_btn').click(function() {
		if(checkMoreZero){
			var result = confirm("해당 아이디의 홈페이지 이용을 차단하시겠습니까?");
			if(result){
				var ids = [];
				$(".check").each(function() {
					if($(this).prop("checked")){
						ids.push($(this).val());
					}
				});
				//ajax로 배열을 전송하고자 할때 추가
				jQuery.ajaxSettings.traditional = true;
				
				$.ajax({
					url : "./setUnserviceability",
					type : "POST",
					data : {
						id : ids
					},
					success : function(data) {
						data = data.trim();
						if (data == '0') {
							alert("차단 실패");
						} else {
							alert("차단 되었습니다.");
							location.href="./memberUnserviceability";
						}
					}
				});
			}
		} else {
			alert("선택된 것이 없습니다.");
		}
	});
}