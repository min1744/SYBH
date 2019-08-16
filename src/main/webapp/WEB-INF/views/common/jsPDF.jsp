<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype>
<html>
<head>
<title>jsPDF</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="../resources/css/jsPDF/smoothness/jquery-ui-1.8.17.custom.css">
<link rel="stylesheet" type="text/css" href="../resources/css/jsPDF/main.css">

<script type="text/javascript" src="../resources/js/admin/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../resources/js/admin/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="../resources/js/admin/jspdf.debug.js"></script>
<script type="text/javascript" src="../resources/js/admin/basic.js"></script>
</head>
<body>
	<h1>jsPDF Demos</h1>
	<div id="tabs">
		<div id="tabs-basic">
			<div id="accordion-basic">
				<h2>Simple two-page text document</h2>
				<div>
					<p>
					<pre>var doc = new jsPDF();
doc.text(20, 20, 'Hello world!');
doc.text(20, 30, 'This is client-side Javascript, pumping out a PDF.');
doc.save('Generate_Report.pdf');</pre>
					<a href="javascript:demoTwoPageDocument()" class="button">Run Code</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>