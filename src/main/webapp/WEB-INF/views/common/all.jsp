<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>쌍용백병원 - 병원 진료 예약 서비스</title>
<!-- 파비콘  -->
<link rel="shortcut icon" href="../resources/images/favicon1.ico"/>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/header.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/footer.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/slick-theme.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style type="text/css">

* {

margin: 0;
padding: 0;
font-family: 'Noto Sans KR', sans-serif;
list-style: none;


}

body {

overflow-x: hidden;

}

a {
	
	text-decoration: none !important;
}


a:hover {
	
	text-decoration: none !important;
}

a:active {
	
	text-decoration: none !important;
}




</style>
<script type="text/javascript">

$(function() {
	
	$('#header_menu li').mouseover(
	  function() {
		  $('#sub_nav').stop().slideDown(350);
		  
	  }
	);
	
	$('#sub_nav').mouseleave(
			 
		function() {
			 $(this).stop().slideUp(350);
		 }
	);
	
      $('.slide').click({
    	  dots: true,
    	  slidesToShow: 1,
    	  slidesToScroll: 1,
    	  autoplay: true,
    	  autoplaySpeed: 4000
      });
      
      
      $(window).scroll(function() {
          if ($(this).scrollTop() > 400) {
              $('#top_btn').fadeIn();
          } else {
              $('#top_btn').fadeOut();
          }
      });
      
      $("#top_btn").click(function() {
          $('html, body').animate({
              scrollTop : 0
          }, 400);
          return false;
      });
      
	
}); 

</script>