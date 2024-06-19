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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"></script>
</head>
<body>
	<h1>CHART3</h1>
	<canvas id="sumChart" style="width:100%;max-width:700px"></canvas>
	<canvas id="avgChart" style="width:100%;max-width:700px"></canvas>
	<canvas id="maxChart" style="width:100%;max-width:700px"></canvas>
	<canvas id="minChart" style="width:100%;max-width:700px"></canvas>
	<script>
		const deptName = [];
		const sumSalary = [];
		const avgSalary = [];
		const maxSalary = [];
		const minSalary = [];
		const barColors = [
			'rgba(255, 99, 132, 0.2)',
			'rgba(255, 205, 86, 0.2)',
			'rgba(75, 192, 192, 0.2)',
			'rgba(54, 162, 235, 0.2)',
			'rgba(153, 102, 255, 0.2)',
			'rgba(255, 99, 132, 0.2)',
			'rgba(255, 205, 86, 0.2)',
			'rgba(75, 192, 192, 0.2)',
			'rgba(54, 162, 235, 0.2)'
			];
		const borderColors = [
			'rgb(255, 99, 132)',
			'rgb(255, 205, 86)',
			'rgb(75, 192, 192)',
			'rgb(54, 162, 235)',
			'rgb(153, 102, 255)',
			'rgb(255, 99, 132)',
			'rgb(255, 205, 86)',
			'rgb(75, 192, 192)',
			'rgb(54, 162, 235)'
		    ];
		
		$.ajax({
			url: "/rest/getSalaryByDeptName",
			method: "GET",
			async: false,
			success: function(json) {
				json.forEach((item) => {
					deptName.push(item.deptName);
					sumSalary.push(item.sumSalary);
					avgSalary.push(item.avgSalary);
					maxSalary.push(item.maxSalary);
					minSalary.push(item.minSalary);
				});
			}
		});
		
		/*
		console.log(deptName);
		console.log(sumSalary);
		console.log(avgSalary);
		console.log(maxSalary);
		console.log(minSalary);
		*/
		
		new Chart("sumChart", {
			type: "bar",
			data: {
				labels: deptName,
				datasets: [{
					backgroundColor: barColors,
					borderColor: borderColors,
					borderWidth: 1,
					data: sumSalary 
				}]
			},
			options: {
				legend: {display: false},
				title: {
					display: true,
					text: "sumSalary"
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
		
		new Chart("avgChart", {
			type: "bar",
			data: {
				labels: deptName,
				datasets: [{
					backgroundColor: barColors,
					borderColor: borderColors,
					borderWidth: 1,
					data: avgSalary 
				}]
			},
			options: {
				legend: {display: false},
				title: {
					display: true,
					text: "avgSalary"
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
		
		new Chart("maxChart", {
			type: "bar",
			data: {
				labels: deptName,
				datasets: [{
					backgroundColor: barColors,
					borderColor: borderColors,
					borderWidth: 1,
					data: maxSalary 
				}]
			},
			options: {
				legend: {display: false},
				title: {
					display: true,
					text: "maxSalary"
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
		
		new Chart("minChart", {
			type: "bar",
			data: {
				labels: deptName,
				datasets: [{
					backgroundColor: barColors,
					borderColor: borderColors,
					borderWidth: 1,
					data: minSalary 
				}]
			},
			options: {
				legend: {display: false},
				title: {
					display: true,
					text: "minSalary"
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