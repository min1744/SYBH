function generateReport() {
	var allMemberCount = $('#allMemberCount').val();
	var donations = $('#donations').html();
	var earnings = $('#earnings').html();
	var access_count = $('#access_count').html();
	var allDoctorCount = $('#allDoctorCount').val();
	var allAdminCount = $('#allAdminCount').val();
	var annualMemberCount = $('#annualMemberCount').html();
	var earningsNum = $('#earningsNum').html();
	
	var pdf = new jsPDF('p', 'pt', 'portrait');
	source = '<html>'+
		'<head>'+
	'<meta charset="UTF-8">'+
	'<title>쌍용백병원::관리자페이지::</title>'+
	'<meta http-equiv="X-UA-Compatible" content="IE=edge">'+
	  '<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">'+
	  '<meta name="description" content="">'+
	  '<meta name="author" content="">'+
	  '<link href="../css/all.min.css" rel="stylesheet" type="text/css">'+
	  '<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">'+
	  '<link href="../css/sb-admin-2.min.css" rel="stylesheet">'+
	'</head>'+
	'<body id="page-top">'+
	  '<div id="wrapper">'+
	    '<div id="content-wrapper" class="d-flex flex-column">'+
	      '<div id="content">'+
	        '<div class="container-fluid">'+
	          '<div class="d-sm-flex align-items-center justify-content-between mb-4">'+
	            '<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>'+
	          '</div>'+
	          '<div class="row">'+
	            '<div class="col-xl-3 col-md-6 mb-4">'+
	              '<div class="card border-left-primary shadow h-100 py-2">'+
	                '<div class="card-body">'+
	                  '<div class="row no-gutters align-items-center">'+
	                    '<div class="col mr-2">'+
	                      '<div class="text-xs font-weight-bold text-success text-uppercase mb-1">MEMBERSHIP</div>'+
	                      '<div class="h5 mb-0 font-weight-bold text-gray-800">'+allMemberCount+'</div>'+
	                    '</div>'+
	                    '<div class="col-auto">'+
	                      '<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	            '<div class="col-xl-3 col-md-6 mb-4">'+
	              '<div class="card border-left-warning shadow h-100 py-2">'+
	                '<div class="card-body">'+
	                  '<div class="row no-gutters align-items-center">'+
	                    '<div class="col mr-2">'+
	                      '<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Annual Donations</div>'+
	                      '<div class="h5 mb-0 font-weight-bold text-gray-800">'+donations+'</div>'+
	                    '</div>'+
	                    '<div class="col-auto">'+
	                      '<i class="fas fa-won-sign fa-2x text-gray-300"></i>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	            '<div class="col-xl-3 col-md-6 mb-4">'+
	              '<div class="card border-left-success shadow h-100 py-2">'+
	                '<div class="card-body">'+
	                  '<div class="row no-gutters align-items-center">'+
	                    '<div class="col mr-2">'+
	                      '<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Annual Earnings</div>'+
	                      '<div class="h5 mb-0 font-weight-bold text-gray-800">'+earnings+'</div>'+
	                    '</div>'+
	                    '<div class="col-auto">'+
	                      '<i class="fas fa-won-sign fa-2x text-gray-300"></i>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	            '<div class="col-xl-3 col-md-6 mb-4">'+
	              '<div class="card border-left-info shadow h-100 py-2">'+
	                '<div class="card-body">'+
	                  '<div class="row no-gutters align-items-center">'+
	                    '<div class="col mr-2">'+
	                      '<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">The Number of Visitors(Today)</div>'+
	                      '<div class="h5 mb-0 font-weight-bold text-gray-800">'+access_count+'</div>'+
	                    '</div>'+
	                    '<div class="col-auto">'+
	                      '<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	          '</div>'+
	          '<div class="row">'+
	            //<c:forEach items="${monthData}" var="monthdata">
	            	//<input type="hidden" class="monthData" value="${monthdata}">
	            //</c:forEach>
	            '<div class="col-xl-8 col-lg-7">'+
	              '<div class="card shadow mb-4">'+
	                '<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">'+
	                  '<h6 class="m-0 font-weight-bold text-primary" id="chartName">'+
	                  	'Overview'+
	                  '</h6>'+
	                '</div>'+
	                '<div class="card-body">'+
	                  '<div class="chart-area">'+
	                    '<canvas id="myAreaChart"></canvas>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	            '<input type="hidden" id="allMemberCount" value="'+allMemberCount+'" title="Member">'+
	            '<input type="hidden" id="allDoctorCount" value="'+allDoctorCount+'" title="Doctor">'+
	            '<input type="hidden" id="allAdminCount" value="'+allAdminCount+'" title="Admin">'+
	            '<div class="col-xl-4 col-lg-5">'+
	              '<div class="card shadow mb-4">'+
	                '<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">'+
	                  '<h6 class="m-0 font-weight-bold text-primary">Member Ratio</h6>'+
	                '</div>'+
	                '<div class="card-body">'+
	                  '<div class="chart-pie pt-4 pb-2">'+
	                    '<canvas id="myPieChart"></canvas>'+
	                  '</div>'+
	                  '<div class="mt-4 text-center small">'+
	                    '<span class="mr-2">'+
	                      '<i class="fas fa-circle text-primary"></i> Member'+
	                    '</span>'+
	                    '<span class="mr-2">'+
	                      '<i class="fas fa-circle text-success"></i> Doctor'+
	                    '</span>'+
	                    '<span class="mr-2">'+
	                      '<i class="fas fa-circle text-info"></i> Admin'+
	                    '</span>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	          '</div>'+
	          '<div class="row">'+
	            '<div class="col-lg-6 mb-4">'+
	              '<div class="card shadow mb-4">'+
	                '<div class="card-header py-3">'+
	                  '<h6 class="m-0 font-weight-bold text-primary">Goals</h6>'+
	                '</div>'+
	                '<div class="card-body">'+
	                  '<input type="hidden">'+
	                  '<h4 class="small font-weight-bold">Annual Membership<span class="float-right">'+annualMemberCount+'</span></h4>'+
	                  '<div class="progress mb-4">'+
	                    '<div class="progress-bar bg-danger" role="progressbar" style="width: '+annualMemberCount+'%" aria-valuenow="'+annualMemberCount+'" aria-valuemin="0" aria-valuemax="100"></div>'+
	                  '</div>'+
	                  '<h4 class="small font-weight-bold">Annual Earnings (Online Earnings/Total Earings : 0.02%)<span class="float-right">'+earningsNum+'%</span></h4>'+
	                  '<div class="progress mb-4">'+
	                    '<div class="progress-bar bg-warning" role="progressbar" style="width: '+earningsNum+'%" aria-valuenow="'+earningsNum+'" aria-valuemin="0" aria-valuemax="100"></div>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	              '<div class="row">'+
	                '<div class="col-lg-4 mb-4">'+
	                  '<div class="card bg-primary text-white shadow">'+
	                    '<div class="card-body">'+
	                      'Primary (50 ~ 80%)'+
	                      '<div class="text-white-50 small">#4e73df</div>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	                '<div class="col-lg-4 mb-4">'+
	                  '<div class="card bg-success text-white shadow">'+
	                    '<div class="card-body">'+
	                      'Success (100%)'+
	                      '<div class="text-white-50 small">#1cc88a</div>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	                '<div class="col-lg-4 mb-4">'+
	                  '<div class="card bg-info text-white shadow">'+
	                    '<div class="card-body">'+
	                      'Info (80 ~ 99%)'+
	                      '<div class="text-white-50 small">#36b9cc</div>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	                '<div class="col-lg-4 mb-4">'+
	                  '<div class="card bg-warning text-white shadow">'+
	                    '<div class="card-body">'+
	                      'Warning (20 ~ 50%)'+
	                      '<div class="text-white-50 small">#f6c23e</div>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	                '<div class="col-lg-4 mb-4">'+
	                  '<div class="card bg-danger text-white shadow">'+
	                    '<div class="card-body">'+
	                      'Danger (0 ~ 20%)'+
	                      '<div class="text-white-50 small">#e74a3b</div>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	                '<div class="col-lg-4 mb-4">'+
	                  '<div class="card bg-secondary text-white shadow">'+
	                    '<div class="card-body">'+
	                      'Secondary (0%)'+
	                      '<div class="text-white-50 small">#858796</div>'+
	                    '</div>'+
	                  '</div>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	            '<div class="col-lg-6 mb-4">'+
	              '<div class="card shadow mb-4">'+
	                '<div class="card-header py-3">'+
	                  '<h6 class="m-0 font-weight-bold text-primary">Pledge</h6>'+
	                '</div>'+
	                '<div class="card-body">'+
	                  '<div class="text-center">'+
	                    '<img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="../images/undraw_posting_photo.svg" alt="">'+
	                  '</div>'+
	                  '<p><strong>Of the People, By the People, For the People</strong></p>'+
	                  '<p>세계는 오늘 우리가 여기 모여 무슨 말을 했는가를 별로 주목하지도, 오래 기억하지도 않겠지만 여기서 수행한 일이 어떤 것이었던가는 결코 잊지 않을 것입니다. 우리 앞에 남겨진 미완의 큰 과업을 다 하기 위해 지금 여기 이곳에 바쳐져야 하는 것은 우리들 자신입니다. 우리는 생명이라는 존엄성 앞에서 최선을 다 할 것을 굳게 다짐합니다.</p>'+
	                '</div>'+
	              '</div>'+
	            '</div>'+
	          '</div>'+
	        '</div>'+
	      '</div>'+
	      '<footer class="sticky-footer bg-white">'+
	        '<div class="container my-auto">'+
	          '<div class="copyright text-center my-auto">'+
	            '<span>COPYRIGHT©1996-2019 BY SSANGYONG MEDICAL CENTER. ALL RIGHTS RESERVED.</span>'+
	          '</div>'+
	        '</div>'+
	      '</footer>'+
	    '</div>'+
	  '</div>'+
	  '<a class="scroll-to-top rounded" href="#page-top">'+
	    '<i class="fas fa-angle-up"></i>'+
	  '</a>'+
	  '<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+
	    '<div class="modal-dialog" role="document">'+
	      '<div class="modal-content">'+
	        '<div class="modal-header">'+
	          '<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>'+
	          '<button class="close" type="button" data-dismiss="modal" aria-label="Close">'+
	            '<span aria-hidden="true">×</span>'+
	          '</button>'+
	        '</div>'+
	        '<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>'+
	        '<div class="modal-footer">'+
	          '<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>'+
	          '<a class="btn btn-primary" href="login.html">Logout</a>'+
	        '</div>'+
	      '</div>'+
	    '</div>'+
	  '</div>'+
	'</body>'+
	'</html>';
	margins = {
			top : 80,
			bottom : 60,
			left : 60,
			width : 522
    };
	pdf.fromHTML(source, // HTML string or DOM elem ref.
			margins.left, // x coord
            margins.top, { // y coord
				'width' : margins.width, // max width of content on PDF
	},
	
	function(dispose) {
        // dispose: object with X, Y of the last line add to the PDF 
        //          this allow the insertion of new lines after html
        pdf.save('Generate_Report.pdf');
    }, margins);
}