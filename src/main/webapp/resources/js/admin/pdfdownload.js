$('#pdfDownload').click(function () {
	html2canvas($("#pdfContents"),{
	    useCORS: true,
	    allowTaint: true,
	    onrendered:function(canvas){
	    	 // 캔버스를 이미지로 변환
	        var imgData = canvas.toDataURL('image/jpeg');
	        var imgHeight = 210; // 이미지 세로 길이(mm) A4 기준
		    var pageWidth = imgHeight * 1.414;  // 출력 페이지 가로 길이 계산 A4 기준
		    var imgWidth = canvas.width * imgHeight / canvas.height - 13;//- 13는 pdf 크기에 맞추기 위해 임의로 계산한 값
		    var widthLeft = imgWidth;
	        var doc = new jsPDF('landscape');
	        var position = 0;
	        
	     	// 첫 페이지 출력
			doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);
			widthLeft -= pageWidth;
	         
	        // 한 페이지 이상일 경우 루프 돌면서 출력
	        while (widthLeft >= 20) {
				position = widthLeft - imgWidth;
				doc.addPage();
				doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);
				widthLeft -= pageWidth;
	        }
			
			// 파일 저장
	        doc.save('Generate_Report.pdf');
	    }
	});
});