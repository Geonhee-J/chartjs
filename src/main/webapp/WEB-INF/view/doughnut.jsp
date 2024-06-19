<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>DOUGHNUT</h1>
	<canvas id="myChart" style="width:100%;max-width:700px"></canvas>
	<script>
		const xValues = [];
		const yValues = [];
		const barColors = [
			"rgba(255, 99, 132, 0.2)", // 1
			"rgba(255, 159, 64, 0.2)", // 2
			"rgba(255, 205, 86, 0.2)", // 3
			"rgba(75, 192, 192, 0.2)", // 4
			"rgba(54, 162, 235, 0.2)", // 5
			"rgba(153, 102, 255, 0.2)", // 6
			"rgba(201, 203, 207, 0.2)", // 7
			"rgba(255, 99, 132, 0.2)", // 8
			"rgba(255, 159, 64, 0.2)", // 9
			"rgba(255, 205, 86, 0.2)", // 10
			"rgba(75, 192, 192, 0.2)", // 11
			"rgba(54, 162, 235, 0.2)", // 12
			"rgba(153, 102, 255, 0.2)", // 13
			"rgba(201, 203, 207, 0.2)", // 14
			"rgba(255, 99, 132, 0.2)", // 15
			"rgba(255, 159, 64, 0.2)" // 16
		];
		
		$.ajax({
			url: "/rest/getCountHireDate",
			method: "GET",
			async: false,
			success: function(json) {
				json.forEach((item) => {
					xValues.push(item.hireYear);
					yValues.push(item.cnt);
				});
			}
		});
		
		console.log(xValues);
		console.log(yValues);
		
		new Chart("myChart", {
			type: "doughnut",
			data: {
				labels: xValues,
				datasets: [{
					backgroundColor: barColors,
					data: yValues
				}]
			},
			options: {
				title: {
					display: true,
					text: "doughnut"
				}
			}
		});
	</script>
</body>
</html>