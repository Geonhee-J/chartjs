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
	<h1>CHART4</h1>
	<canvas id="myChart" style="width:100%;max-width:700px"></canvas>
	<script>
		const xValues = [];
		const male = [];
		const female = [];
		const barColors = ["red", "green", "blue", "orange", "brown"];
		
		$.ajax({
			url: "/rest/getGenderCountByYear",
			method: "GET",
			async: false,
			success: function(json) {
				json.forEach((item) => {
					if (item.gender === 'M') {
						male.push(item.cnt);
						xValues.push(item.y);
					} else {
						female.push(item.cnt);
					}
				});
			}
		});
		
		console.log(xValues);
		console.log(male);
		console.log(female);
		
		new Chart("myChart", {
			type: "line",
			data: {
				labels: xValues,
				datasets: [{ 
					data: male,
					borderColor: "green",
					fill: false
				}, { 
					data: female,
					borderColor: "orange",
					fill: false
			    }]
			},
			options: {
				legend: {display: false}
			}
		});
	</script>
</body>
</html>