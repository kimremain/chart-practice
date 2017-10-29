<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<!-- for rmate -->
<link rel="stylesheet" href="<c:url value="/resources/rmate/rMateChartH5/Assets/Css/rMateChartH5.css" />" >
<script src="<c:url value="/resources/rmate/LicenseKey/rMateChartH5License.js" />"></script>
<script src="<c:url value="/resources/rmate/rMateChartH5/JS/rMateChartH5.js" />"></script>

 
<script type="text/javascript">
	//-----------------------차트 설정 시작-----------------------
	
	//rMate 차트 생성 준비가 완료된 상태 시 호출할 함수를 지정합니다.
	var chartVars = "rMateOnLoadCallFunction=chartReadyHandler";
	
	//rMateChart 를 생성합니다.
	//파라메터 (순서대로) 
	//1. 차트의 id ( 임의로 지정하십시오. ) 
	//2. 차트가 위치할 div 의 id (즉, 차트의 부모 div 의 id 입니다.)
	//3. 차트 생성 시 필요한 환경 변수들의 묶음인 chartVars
	//4. 차트의 가로 사이즈 (생략 가능, 생략 시 100%)
	//5. 차트의 세로 사이즈 (생략 가능, 생략 시 100%)
	rMateChartH5.create("chart1", "chartHolder", chartVars, "100%", "100%"); 
	
	//차트의 속성인 rMateOnLoadCallFunction 으로 설정된 함수.
	//rMate 차트 준비가 완료된 경우 이 함수가 호출됩니다.
	//이 함수를 통해 차트에 레이아웃과 데이터를 삽입합니다.
	//파라메터 : id - rMateChartH5.create() 사용 시 사용자가 지정한 id 입니다.
	function chartReadyHandler(id) {
		document.getElementById(id).setDataType("json");
		document.getElementById(id).setLayout(layoutStr);
		document.getElementById(id).setData(chartData);
	}
	
	//스트링 형식으로 레이아웃 정의.
	//x축 기준 컬럼 categoryField 정의
	var layoutStr = 
					'<rMateChart backgroundColor="#FFFFFF"  borderStyle="none">'
						+'<Options>'
							+'<Caption text="chart-rmate"/>'
							+'<SubCaption text="2008"/>'
							+'<Legend useVisibleCheck="true" useAxisVisibleCheck="true"/>'
						+'</Options>'
						+'<NumberFormatter id="fmt"/>'
						+'<Line2DChart id="chart" showDataTips="true">'
							+'<horizontalAxis>'
								+'<CategoryAxis id="hAxis" categoryField="year" padding="0"/>'
							+'</horizontalAxis>'
							+'<series>'
								+'<Line2DSeries yField="hp" displayName="hp">'
									+'<verticalAxis>'
										+'<LinearAxis id="vAxis3" formatter="{fmt}" title="hp" interval="300"/>'
									+'</verticalAxis>'
									+'<lineStroke>'
										+'<Stroke color="#EA594E" weight="3"/>' 
									+'</lineStroke>'
									+'<showDataEffect>'
										+'<SeriesSlide direction="up" duration="1000"/>'
									+'</showDataEffect>'
								+'</Line2DSeries>'
								+'<Line2DSeries yField="dell" displayName="dell">'
									+'<verticalAxis>'
										+'<LinearAxis id="vAxis2" formatter="{fmt}" title="dell" interval="300"/>'
									+'</verticalAxis>'
									+'<lineStroke>'
										+'<Stroke color="#F2B035" weight="3"/>' 
									+'</lineStroke>'
									+'<showDataEffect>'
										+'<SeriesSlide direction="up" duration="1000"/>'
									+'</showDataEffect>'
								+'</Line2DSeries>'
								+'<Line2DSeries yField="ibm" displayName="ibm">'
									+'<verticalAxis>'
										+'<LinearAxis id="vAxis1" formatter="{fmt}" title="ibm" interval="300"/>'
									+'</verticalAxis>'
									+'<lineStroke>'
										+'<Stroke color="#A5C571" weight="3"/>' 
									+'</lineStroke>'
									+'<showDataEffect>'
										+'<SeriesSlide direction="up" duration="1000"/>'
									+'</showDataEffect>'
								+'</Line2DSeries>'
							+'</series>'
							+'<verticalAxisRenderers>'
							/* 각 시리즈 마다 각각의 y축을 참조합니다 */
								+'<Axis2DRenderer axis="{vAxis1}" placement="left" showLine="true">'
								/* vAxis1을 참조 */
									+'<axisStroke>'
										+'<Stroke color="#A5C571" weight="3" caps="none"/>'
									+'</axisStroke>'
								+'</Axis2DRenderer>'
								+'<Axis2DRenderer axis="{vAxis2}" placement="left" showLine="true">'
								/* vAxis2를 참조 */
									+'<axisStroke>'
										+'<Stroke color="#F2B035" weight="3" caps="none"/>'
									+'</axisStroke>'
								+'</Axis2DRenderer>'
								+'<Axis2DRenderer axis="{vAxis3}" placement="left" showLine="true">'
								/* vAxis3을 참조 */
									+'<axisStroke>'
										+'<Stroke color="#EA594E" weight="3" caps="none"/>'
									+'</axisStroke>'
								+'</Axis2DRenderer>'
							+'</verticalAxisRenderers>'
						+'</Line2DChart>'
					+'</rMateChart>';
	
	//차트 데이터
	var chartData = '${json}';	
	
	//-----------------------차트 설정 끝 -----------------------
	
</script>


<title>chart-rmate</title>
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
	
	<div id= "chartHolder" style= "width:1200px; height:400px;" ></div> 

</body>
</html>