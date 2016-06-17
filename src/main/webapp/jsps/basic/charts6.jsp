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
<link rel="stylesheet"
	href="resources/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
<script src="resources/js/jquery-1.12.4.min.js"></script>
<script src="resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="resources/js/echarts.min.js"></script>

<title>Insert title here</title>
</head>
<body class="container">
	<div class="container" id="main"
		style="width: 600px; height: 480px; border: 1px solid red;"></div>

</body>
<script type="text/javascript">
	//基于准备好的dom，初始化Echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	
	//执行图表的配置项和数据
	//设置扇形的颜色
	//1.可以在series->itemStyle->emphasis/normal->color设置
	//2.也可以对data->下单独设置
	/*
	data:[
		{
			value:'',
			name:'',
			itemStyle:{
				nomal:{
					color:''
				}
			}
		}
	]
	*/
	//3.仅调整明暗变化
	
	var option = {
		backgroundColor: '#2c343c',
		series:[
	        {
	        	name:'访问来源',
	        	type:'pie',
	        	radius:'55%',
	        	roseType:'angel',
	        	data:[
	        		{value:400,name:'搜索引擎'},
	        		{value:335,name:'直接访问'},
	        		{value:310,name:'邮件营销'},
	        		{value:274,name:'联盟广告'},
	        		{value:235,name:'频广告'},
	        	],
	        	itemStyle: {
	                normal: {
	                    color: '#c23531',
	                    shadowBlur: 200,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            },
	            label: {
	                normal: {
	                    textStyle: {
	                        color: 'rgba(255, 255, 255, 0.3)'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    lineStyle: {
	                        color: 'rgba(255, 255, 255, 0.3)'
	                    }
	                }
	            },
	        }
		],
		visualMap: {
	        show: false,// 不显示 visualMap 组件，只用于明暗度的映射
	        min: 80,// 映射的最小值为 80
	        max: 600, // 映射的最大值为 600
	        inRange: {
	            colorLightness: [0, 1]// 明暗度的范围是 0 到 1
	        }
	
	    },
	}
	
	//使用刚指定的配置项和数据显示图表
	myChart.setOption(option);	
</script>
</html>