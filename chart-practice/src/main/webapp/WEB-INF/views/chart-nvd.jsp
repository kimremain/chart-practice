<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- for nvd -->
<!-- <script src="https://d3js.org/d3.v4.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.min.js" charset="utf-8"></script>
<script src="https://cdn.rawgit.com/novus/nvd3/v1.8.1/build/nv.d3.min.js"></script>
<link rel="stylesheet" href="https://cdn.rawgit.com/novus/nvd3/v1.8.1/build/nv.d3.css">
<script>
	nv.addGraph(function () {
	    var chart = nv.models.lineChart();
	
	    chart.xAxis.axisLabel('year').tickFormat(d3.format(''));
	    chart.yAxis.axisLabel('counter').tickFormat(d3.format(''));
	    d3.select('#dateChart')
	        .datum(chartData())
	        .transition().duration(500)
	        .call(chart);
	    nv.utils.windowResize(function () {
	        d3.select('#dateChart').call(chart)
	    });
	
	    return chart;
	});
	
	function chartData() {
	    var jsonStr = '${json}';
	    var jsonArr = JSON.parse(jsonStr);	    
	    var returnDataHP = [];
	    var returnDataDELL = [];
	    var returnDataIBM = [];
	    
 	    for (var i = 0; i < jsonArr.length; i++) {
			console.log(jsonArr[i].year);
			console.log(jsonArr[i].hp);
			console.log(jsonArr[i].dell);
			console.log(jsonArr[i].ibm);
			returnDataHP.push({
  	            x: jsonArr[i].year,
	            y: jsonArr[i].hp
	        });
			returnDataDELL.push({
  	            x: jsonArr[i].year,
	            y: jsonArr[i].dell
	        });
			returnDataIBM.push({
  	            x: jsonArr[i].year,
	            y: jsonArr[i].ibm
	        });
	    }

 	 	return [
	    	{
		        values: returnDataHP,
		        key: 'HP',
		        color: 'red'
	    	},
	    	{
		        values: returnDataDELL,
		        key: 'DELL',
		        color: 'blue'
	    	},
	    	{
		        values: returnDataIBM,
		        key: 'IBM',
		        color: 'green'
	    	}
		];
	}
</script>

<title>chart-nvd</title>    
</head>
<body>
    
<%-- 	<table border="1" class="table">
	    <tr>
	        <th>dt_year</th>
	        <th>cn_sum_hp</th>
	        <th>cn_sum_dell</th>
	        <th>cn_sum_ibm</th>
	    </tr>
	    <c:forEach var="list" items="${list}">
	    <tr>
	        <td>${list.year}</td>
	        <td>${list.hp}</td>
	        <td>${list.dell}</td>
	        <td>${list.ibm}</td>
	    </tr>
	    </c:forEach>
	</table> --%>
	    
	<div id="chart-nvd" style= "width:1200px; height:400px;"><svg id="dateChart"></svg></div>


</body>

</html>