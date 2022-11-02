<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
//구글 차트 라이브러리 로딩
google.charts.load("current", {packages:["corechart"]});
//라이브러리 로딩이 완료되면 drawChart함수 호출, ()는 안씀
google.charts.setOnLoadCallback(drawChart);

function drawChart(){
	//차트 그리기에 필요한 json 데이티 로딩
	var jsonData=$.ajax({
		url: "${path}/sell/cart_money_list.do",
		dataType: "json",
		async: false //동기식처리(순차적 처리:데이터를 다부른 후 챠트출력하기 위해)
	    }).responseText;
    console.log(jsonData);//콘솔에도 출력해봄
    var data=new google.visualization.DataTable(jsonData);
    console.log("데이터 테이블:"+data);
    var options = {
    	    title : '판매 통계',
    	    is3D: true //2d는 flase
    	};
      /* var chart=new google.visualization.PieChart(
    	    document.getElementById("chart_div"));*/
    /*var chart=new google.visualization.LineChart(
    	    document.getElementById("chart_div")); */
		var chart=new google.visualization.ColumnChart(
       	  document.getElementById("chart_div"));
        chart.draw(data, options);
}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
@font-face {
    font-family: 'MonoplexKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_Monoplex-kr@1.0/MonoplexKR-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

#chart_div{
	color: #E0B4FE;
    font-size: 13px;
    font-weight: normal;
    letter-spacing: 1px;
    font-family: 'MonoplexKR-Regular';

}

#btn {
	color: #DCB9F3;
    font-size: 15px;
    font-weight: normal;
    letter-spacing: 1px;
    font-family: 'MonoplexKR-Regular';
}

</style>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<div id="chart_div" style="width: 600px; height: 440px"></div>
<button id="btn" type="button" onclick="drawChart()" class="btn btn-success">refresh</button>

</body>
</html>
