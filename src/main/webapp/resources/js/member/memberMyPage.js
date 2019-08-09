$(function() {
	//회원탈퇴(일반 회원)
	$("#memberDelete").click(function() {
		var result = confirm("정말 회원탈퇴 하시겠습니까?");
		if (result) {
			alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
			location.href = "./memberDelete";
		}
	});

	//회원탈퇴(카카오톡 회원)
	$("#kakaoDelete").click(function() {
		var result = confirm("정말 회원탈퇴 하시겠습니까?");
		if (result) {
			alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
			location.href = "./kakaoDelete";
		}
	});
});