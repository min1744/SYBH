// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

//labels
var doughnutChartName = [];
var member = $('#allMemberCount').prop("title");
var doctor = $('#allDoctorCount').prop("title");
var admin = $('#allAdminCount').prop("title");
doughnutChartName.push(member);
doughnutChartName.push(doctor);
doughnutChartName.push(admin);

//data
var doughnutChartData = [];
member = $('#allMemberCount').val();
doctor = $('#allDoctorCount').val();
admin = $('#allAdminCount').val();
doughnutChartData.push(member);
doughnutChartData.push(doctor);
doughnutChartData.push(admin);

// Pie Chart
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
	type: 'doughnut',
	data: {
		labels: doughnutChartName,
		datasets: [{
			data: doughnutChartData,
			backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
			hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
			hoverBorderColor: "rgba(234, 236, 244, 1)",
		}],
	},
	options: {
		maintainAspectRatio: false,
		tooltips: {
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			caretPadding: 10,
		},
		legend: {
			display: false
		},
		cutoutPercentage: 80,
	},
});