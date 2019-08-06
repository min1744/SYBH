	$(function() {
		//checkAll button control
		$("#checkAll").click(function() {
			var checkAll = $(this).prop("checked");
			$(".check").prop("checked", checkAll);
		});

		//All check control
		$(".check").click(function() {
			var check = true;
			$(".check").each(function() {
				if (!$(this).prop("checked")) {
					check = false;
				}
			});
			$("#checkAll").prop("checked", check);
		});
		
		//모든 checkbox 'checked' 검증
		$("#next").click(function() {
			if($("#checkAll").prop("checked")){
				location.href="./memberJoin";
			} else {
				alert("이용약관을 모두 동의하지 않으셨습니다.");
			}
		});
	});