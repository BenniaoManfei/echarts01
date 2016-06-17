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
			type:'axis'
		},
		toolbox:{
			show:true,
			feature:{
				dataZoom:{},
				magicType: {//视图切换组件
			        type: ['line', 'bar', 'pie']
			    },
				restore:{},
				saveAsImage:{},
				//dataView:{}//数据视图
				
			}
		},
		legend:{
			data:['销量']
		},
		xAxis:{
			type:'category',
			boundaryGap:true,
			max:'dataMax',
			min:'dataMin',
			data:['衬衫','羊毛衫','雪纺衫','裤子','高跟鞋','袜子']
		},
		yAxis:{
		},
		series:[
			{
				name:'销量',
				type:'bar',
				data:[5,20,35,20,213,40]
			}
		]
	}
	
	//使用刚指定的配置项和数据显示图表
	myChart.setOption(option);
	myChart.on('click', function (params) {
		console.log(params);
	});
</script>
</html>