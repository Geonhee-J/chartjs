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
	<h1>HOME</h1>
	<canvas id="myChart" style="width:100%;max-width:700px"></canvas>
	<script>
		const xValues = [];
		const yValues = [];
		const barColors = ["red", "green"];
		
		$.ajax({
			url: "/rest/getCountGender",
			method: "GET",
			async: false,
			success: function(json) {
				json.forEach((item) => {
					xValues.push(item.gender);
					yValues.push(item.cnt);
				});
			}
		});
		
		console.log(xValues);
		console.log(yValues);
		
		new Chart("myChart", {
			type: "bar",
			data: {
				labels: xValues,
				datasets: [{
					backgroundColor: barColors,
					data: yValues
				}]
			},
			options: {
				legend: {display: false},
				title: {
					display: true,
					text: "World Wine Production 2018"
		    	},
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
	</script>
</body>
</html>