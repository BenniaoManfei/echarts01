<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/bootstrap-3.3.5-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
	<script src="resources/js/jquery-1.12.4.min.js"></script>
	<script src="resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script src="resources/js/echarts.min.js"></script>
</head>
<body class="container">
	<!-- 为ECharts准备一个具备大小(宽高的dom) -->
	<div class="container" id="main" style="width: 600px;height:400px;border: 1px solid">
	
	</div>
	
	<input class="btn btn-default" type="button" value="加载图表组件" onclick="showChart()">
</body>
<script type="text/javascript">
	// 基于准备好的dom，初始化Echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	
	//执行图表的配置项和数据
	var option = {
		title:{
			text:'ECharts入门实例'
		},
		tooltip:{
			
		},
		legend:{
			data:['销量']
		},
		xAxis:{
			data:[]
		},
		yAxis:{
			
		},
		series:[
			{
				name:'销量',
				type:'bar',
				data:[]
			}
		]
	}
	
	//使用刚指定的配置项和数据显示图表
	myChart.setOption(option);
	
	function showChart() {
		alert("加载图表数据");
		$.ajax({
			type:"POST",
			url:"/sync1",
			dataType:"json",
			success:function(data){
				console.info(data);
				setTimeout(function(){
					myChart.setOption({
						xAxis:{
							data:data.categories
						},
						series: [{
							name: '销量',
							data: data.data
						}]
					});
				},1000)
			}
		});
	}
</script>
</html>