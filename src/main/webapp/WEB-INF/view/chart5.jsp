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
	<h1>CHART5</h1>
	<canvas id="myChart" style="width:100%;max-width:700px"></canvas>
	<script>
		const department = [];
		const newDeptName = [];
		const newYear = [];
		
		// year
		const xValues = [];
		
		// dname
		const dname = [];
		
		// dname each count
		const csCnt = [];
		const devCnt = [];
		const finCnt = [];
		const hrCnt = [];
		const mktgCnt = [];
		const prodCnt = [];
		const qmCnt = [];
		const resCnt = [];
		const slsCnt = [];
		
		// chart datasets에 들어갈 data
		const data = [csCnt, devCnt, finCnt, hrCnt, mktgCnt, prodCnt, qmCnt, resCnt, slsCnt];
		
		const barColors = ["red", "green", "blue", "orange", "brown", "red", "green", "blue", "orange"];
		
		$.ajax({
			url: "/rest/getDeptMemberForYear",
			method: "GET",
			async: false,
			success: function(json) {
				json.forEach((item) => {
					department.push(item);
				})
				
				console.log("department : ", department);
				
				// 빈 newYear에 전체 조회된 데이터 중 중복된 year제거
				newYear.push(department.filter((x, xi) => {
					return (
						department.findIndex((y, yi) => {
							return x.year === y.year
						})	=== xi
					);
				}));
				
				console.log("newYear : ", newYear);
				
				newYear.forEach((x) => {
					x.forEach((y) => {
						xValues.push(y.year);
					});
				});
				
				console.log("xValues : ", xValues);
				
				// 빈 newDeptName에 전체 조회된 데이터 중 중복된 dname제거
				newDeptName.push(department.filter((x, xi) => {
					return (
						department.findIndex((y, yi) => {
							return x.dname === y.dname
						})	=== xi
					);
				}));
				
				console.log("newDeptName : ", newDeptName);
				
				newDeptName.forEach((x) => {
					x.forEach((y) => {
						dname.push(y.dname);
					});
				});
				
				console.log("dname : ", dname);
				
				// 빈 data에 dname과 일치하는 cnt담기
				json.forEach((item) => {
					for(i = 0; i < data.length; i++) {
						if(item.dname === dname[i]) {
							data[i].push(item.cnt);
						}
					}
				});
				
				console.log("csCnt : ", csCnt);
				console.log("devCnt : ", devCnt);
				console.log("finCnt : ", finCnt);
				console.log("hrCnt : ", hrCnt);
				console.log("mktgCnt : ", mktgCnt);
				console.log("prodCnt : ", prodCnt);
				console.log("qmCnt : ", qmCnt);
				console.log("resCnt : ", resCnt);
				console.log("slsCnt : ", slsCnt);
			}
		});
		
		const datasets = [];
		
		for(i = 0; i < data.length; i++) {
			datasets.push({
				data: data[i],
				borderColor: barColors[i],
				fill: false
			});
		}
		
		console.log("datasets : ", datasets);
		
		new Chart("myChart", {
			type: "line",
			data: {
				labels: xValues,
				datasets: datasets
			},
			options: {
				legend: {display: false}
			}
		});
		
	</script>
</body>
</html>