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
	   str = f.add.value;
	   if(!str){
	      alert('썸네일 이미지를 넣어주세요');
	      return false;
	   }
	   $("#frm").submit();
	   });
});